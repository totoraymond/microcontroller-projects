#include "LoadSamplesFromSerial.h"

//Buffer sizes
#define USB_BUFFER_SIZE	128
#define SD_BUFFER_SIZE	4096

//State machine
#define STATE_START			0
#define STATE_SIZE			1
#define STATE_CONTENT		2

//Special bytes
#define BYTE_START			0x7e
#define BYTE_ESCAPE			0x7d
#define BYTE_SEPARATOR		0x7c


using namespace digitalcave;

LoadSamplesFromSerial::LoadSamplesFromSerial() : Menu(2){
}

Menu* LoadSamplesFromSerial::handleAction(){
	display->write_text(0, 0, "Load From Serial     ", 20);
	
	if (getMenuPosition(0) == 0){
		display->write_text(1, 0, (char) 0x7E);
		display->write_text(2, 0, ' ');
	}
	else {
		display->write_text(1, 0, ' ');
		display->write_text(2, 0, (char) 0x7E);
	}
	
	display->write_text(1, 1, "Start               ", 19);
	display->write_text(2, 1, "Cancel              ", 19);

	if (button.releaseEvent() && getMenuPosition(0) == 0){
		//We start by formatting the flash...
		uint8_t id[3];
		SerialFlash.readID(id);
		uint32_t size = SerialFlash.capacity(id);
		SerialFlash.eraseAll();
		
		//Show progress while erasing...
		uint32_t last_millis = millis();
		uint8_t i = 0;
		uint16_t time = 0;
		while (!SerialFlash.ready()) {
			if (millis() - last_millis > 1000) {
				time++;
				last_millis = millis();
				snprintf(buf, sizeof(buf), "Formatting %dMB%c%c%c    ", (uint16_t) (size >> 20), (i > 0 ? '.' : ' '), (i > 1 ? '.' : ' '), (i > 2 ? '.' : ' '));
				display->write_text(1, 0, buf, 20);
				snprintf(buf, sizeof(buf), "(%d sec. elapsed)        ", time);
				display->write_text(2, 0, buf, 20);
				display->refresh();
				i = (i + 1) & 0x03;
			}
		}
		
		display->clearRow(2);
		delay(1000);

		//We are now ready for the upload program
		while(!Serial.available()){
			display->write_text(1, 0, "Start upload program ", 20);
			display->refresh();
		}
		
		SerialFlashFile flashFile;
		
		uint8_t state = STATE_START;
		uint8_t escape = 0;
		uint8_t fileSizeIndex = 0;
		uint32_t fileSize = 0;
		char filename[FILENAME_STRING_SIZE];
		
		uint8_t usbBuffer[USB_BUFFER_SIZE];
		uint8_t flashBuffer[SD_BUFFER_SIZE];
		
		uint16_t flashBufferIndex = 0;
		uint8_t filenameIndex = 0;
		
		uint32_t lastReceiveTime = millis();
		
		//We assume the serial receive part is finished when we have not received something for 3 seconds
		while(Serial.available() || lastReceiveTime + 3000 > millis()){
			uint16_t available = Serial.readBytes((char*) usbBuffer, USB_BUFFER_SIZE);
			if (available){
				lastReceiveTime = millis();
			}
			display->write_text(1, 0, "Copying...           ", 20);
			display->refresh();

			for (uint16_t usbBufferIndex = 0; usbBufferIndex < available; usbBufferIndex++){
				uint8_t b = usbBuffer[usbBufferIndex];
				
				if (state == STATE_START){
					//Start byte.  Repeat start is fine.
					if (b == BYTE_START){
						for (uint8_t i = 0; i < FILENAME_STRING_SIZE; i++){
							filename[i] = 0x00;
						}
						filenameIndex = 0;
					}
					//Valid characters are A-Z, 0-9, comma, period, colon, dash, underscore
					else if ((b >= 'A' && b <= 'Z') || (b >= '0' && b <= '9') || b == '.' || b == ',' || b == ':' || b == '-' || b == '_'){
						filename[filenameIndex++] = b;
						if (filenameIndex >= FILENAME_STRING_SIZE){
							display->write_text(1, 0, "Error                ", 20);
							display->write_text(2, 0, "Filename too long    ", 20);
							display->refresh();
							delay(2000);
							return Menu::mainMenu;
						}
					}
					//Filename end character
					else if (b == BYTE_SEPARATOR){
						if (filenameIndex == 0){
							display->write_text(1, 0, "Error                ", 20);
							display->write_text(2, 0, "Empty filename       ", 20);
							display->refresh();
							delay(2000);
							return Menu::mainMenu;
						}
						
						snprintf(buf, sizeof(buf), "%s                      ", filename);
						display->write_text(2, 0, buf, 20);
						display->refresh();

						//Change state
						state = STATE_SIZE;
						fileSizeIndex = 0;
						fileSize = 0;
						
					}
					//Invalid character
					else {
						display->write_text(1, 0, "Error                ", 20);
						display->write_text(2, 0, "Bad char in filename ", 20);
						display->refresh();
						delay(2000);
						return Menu::mainMenu;
					}
				}
				//We read 4 bytes as a uint32_t for file size
				else if (state == STATE_SIZE){
					if (fileSizeIndex < 4){
						fileSize = (fileSize << 8) + b;
						fileSizeIndex++;
					}
					else if (b == BYTE_SEPARATOR){
						state = STATE_CONTENT;
						flashBufferIndex = 0;
						escape = 0;
						
						//Create a new file and open it for writing
						if (SerialFlash.create(filename, fileSize)) {
							flashFile = SerialFlash.open(filename);
							if (!flashFile) {
								display->clear();
								display->write_text(1, 0, "Error                ", 20);
								display->write_text(2, 0, "Flash file open      ", 20);
								display->refresh();
								delay(2000);
								display->clear();
								return Menu::mainMenu;
							}
						}
						else {
							display->write_text(1, 0, "Error                ", 20);
							display->write_text(2, 0, "Flash create         ", 20);
							display->refresh();
							delay(2000);
							return Menu::mainMenu;
						}
					}
					else {
						display->write_text(1, 0, "Error                ", 20);
						display->write_text(2, 0, "Invalid file length  ", 20);
						display->refresh();
						delay(2000);
						return Menu::mainMenu;
					}
				}
				else if (state == STATE_CONTENT){
					//Previous byte was escaped; unescape and add to buffer
					if (escape){
						escape = 0;
						flashBuffer[flashBufferIndex++] = b ^ 0x20;
					}
					//Escape the next byte
					else if (b == BYTE_ESCAPE){
		// 				Serial.println("esc");
						escape = 1;
					}
					//End of file
					else if (b == BYTE_START){
		// 				Serial.println("End of file");
						state = STATE_START;
						flashFile.write(flashBuffer, flashBufferIndex);
						flashFile.close();
						flashBufferIndex = 0;
					}
					//Normal byte; add to buffer
					else {
						flashBuffer[flashBufferIndex++] = b;
					}
					
					//The buffer is filled; write to SD card
					if (flashBufferIndex >= SD_BUFFER_SIZE){
						flashFile.write(flashBuffer, SD_BUFFER_SIZE);
						flashBufferIndex = 0;
					}
				}
			}
		}

		display->write_text(1, 0, "Finished            ", 20);
		display->clearRow(2);
		display->clearRow(3);
		display->refresh();
		setMenuPosition(0);
		EEPROM.update(EEPROM_KIT_INDEX, 0);
		Mapping::loadMappings();
		Pad::loadAllSamples(0);
		delay(1000);

		return Menu::mainMenu;
	}
	else if (button.longPressEvent() || (button.releaseEvent() && getMenuPosition(0) == 1)){
		return Menu::mainMenu;
	}
		
	return NULL;
}