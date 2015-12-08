#include "Pad.h"

#include "HiHat.h"
#include "Drum.h"
#include "Cymbal.h"

using namespace digitalcave;

ADC* Pad::adc = NULL;
Pad* Pad::pads[PAD_COUNT] = {
	//	Type	File	MUX Indices				Double Trigger Threshold
	new HiHat(	"HH",	MUX_0, MUX_1, MUX_15,	75),	//Hihat + Pedal
	new Drum(	"SN",	MUX_2,					50),	//Snare
	new Drum(	"BS",	MUX_3,					150),	//Bass
	new Drum(	"T1",	MUX_4,					100),	//Tom1
	new Cymbal(	"CR",	MUX_5, MUX_14,			100),	//Crash
	new Drum(	"T2",	MUX_6,					100),	//Tom2
	new Drum(	"T3",	MUX_7,					100),	//Tom3
	new Cymbal(	"SP",	MUX_8, MUX_13,			100),	//Splash
	new Cymbal(	"RD",	MUX_9, MUX_12,			75),	//Ride
	new Drum(	"X0",	MUX_10,					100),	//X0
	new Drum(	"X1",	MUX_11,					100)	//X1
};

uint8_t Pad::randomSeedCompleted = 0;

//Initialize static pads array
uint8_t Pad::currentIndex = 0;

void Pad::init(){
	//Drain any charge which is currently in each channel
	digitalWriteFast(DRAIN_EN, MUX_ENABLE);
	for(uint8_t i = 0; i < CHANNEL_COUNT; i++){
		digitalWriteFast(MUX0, i & 0x01);
		digitalWriteFast(MUX1, i & 0x02);
		digitalWriteFast(MUX2, i & 0x04);
		digitalWriteFast(MUX3, i & 0x08);
		delay(10);
	}
	digitalWriteFast(DRAIN_EN, MUX_DISABLE);

	//Initialize the ADC
	adc = new ADC();
	adc->setResolution(10);
	adc->setConversionSpeed(ADC_LOW_SPEED);
	adc->setSamplingSpeed(ADC_VERY_LOW_SPEED);
	adc->setAveraging(4);
	
	updateAllSamples();
}

void Pad::updateAllSamples(){
	for (uint8_t i = 0; i < PAD_COUNT; i++){
		pads[i]->updateSamples();
	}
}

Pad::Pad(const char* filenamePrefix, uint8_t doubleHitThreshold) : playTime(0), doubleHitThreshold(doubleHitThreshold), lastSample(NULL), padIndex(currentIndex) {
	strncpy(this->filenamePrefix, filenamePrefix, 3);
	currentIndex++;
}

void Pad::play(double volume){
	if (volume < 0) volume = 0;
	else if (volume >= 5.0) volume = 5.0;

	lastSample = Sample::findAvailableSample(padIndex, volume);
	lastSample->play(lookupFilename(volume), padIndex, volume);
}

void Pad::fade(){
	Sample::fade(padIndex);
}

double Pad::getPadVolume(){
	return padVolume;
}

void Pad::setPadVolume(double volume){
	if (volume < 0) volume = 0;
	else if (volume >= 5.0) volume = 5.0;

	padVolume = volume;
}

void Pad::updateSamples(){
	//Reset fileCountByVolume
	for (uint8_t i = 0x00; i <= 0x0F; i++){
		fileCountByVolume[i] = 0x00;
	}

	SerialFlash.opendir();
	while (1) {
		char filename[64];
		unsigned long filesize;

		if (SerialFlash.readdir(filename, sizeof(filename), filesize)) {
			if (strlen(filename) != 10){
				Serial.print(filename);
				Serial.println(" is not a valid sample filename.");
				continue;	//Ensure the filename is in a valid format, XX_V_N.RAW.  See docs/Kit Sample Organization.txt for details
			}
			
			//Ensure that the first two characters in the filename are valid for this pad's filename prefix.
			if (strncmp(filenamePrefix, filename, 2) != 0) continue;
			
			//Ensure this filename's volume is a valid hexadecimal character (0..F)
			char fileVolume = filename[3];
			uint8_t volume;
			if (fileVolume >= '0' && fileVolume <= '9') volume = fileVolume - 0x30;
			else if (fileVolume >= 'A' && fileVolume <= 'F') volume = fileVolume - 0x37;
			else continue;	//Invalid volume
			
			//Ensure that this filename's sample number is a valid hexadecimal character (0..F)
			char fileSample = filename[5];
			uint8_t sample;
			if (fileSample >= '0' && fileSample <= '9') sample = fileSample - 0x30;
			else if (fileSample >= 'A' && fileSample <= 'F') sample = fileSample - 0x37;
			else continue;	//Invalid volume

			//This is why we need to have the sample number continuous... we just record the highest sample number,
			// rather than looking through all of them.
			//TODO Should we show an error if the samples are not continuous?
			if (fileCountByVolume[volume] < (sample + 1)) {
				fileCountByVolume[volume] = (sample + 1);
// 				Serial.print("Found sample number ");
// 				Serial.print(sample + 1);
// 				Serial.print(" for prefix ");
// 				Serial.println(filenamePrefix);
			}
		} 
		else {
			break; // no more files
		}
	}
}

char* Pad::lookupFilename(double volume){
	//Limit volume from 0 to 1
	if (volume < 0) volume = 0;
	else if (volume >= 1.0) volume = 1.0;

	//We find the closest match in fileCountByVolume, and if there is more than one, returns a random
	// sample number.
	
	int8_t offset = 1;
	int8_t closestVolume = volume * 16;		//Multiply by 16 to get into the 16 buckets of the samples
	while (fileCountByVolume[closestVolume] == 0){
		closestVolume = volume + offset;
		if (closestVolume >= 16) closestVolume = 16;
		if (closestVolume < 0) closestVolume = 0;
		if (offset > 0) offset *= -1;
		else offset += -1;
	}
	
	uint8_t randomNumber = 0; //((uint8_t) random(fileCountByVolume[closestVolume])) & 0x0F;
	closestVolume = closestVolume & 0x0F;
	snprintf(filenameResult, sizeof(filenameResult), "%s_%X_%X.RAW", filenamePrefix, closestVolume, randomNumber);

// 	Serial.print("fileCountByVolume[closestVolume] = ");
// 	Serial.print(fileCountByVolume[closestVolume]);
// 	Serial.print("; randomNumber = ");
// 	Serial.println(randomNumber);

	return filenameResult;
}

uint8_t Pad::readSwitch(uint8_t muxIndex){
	//Disable both MUXs
	digitalWriteFast(ADC_EN, MUX_DISABLE);
	digitalWriteFast(DRAIN_EN, MUX_DISABLE);
	
	//Set Sample
	digitalWriteFast(MUX0, muxIndex & 0x01);
	digitalWriteFast(MUX1, muxIndex & 0x02);
	digitalWriteFast(MUX2, muxIndex & 0x04);
	digitalWriteFast(MUX3, muxIndex & 0x08);
	
	//Enable ADC MUX...
	digitalWriteFast(ADC_EN, MUX_ENABLE);

	//... read value...
	int16_t currentValue = adc->analogRead(ADC_INPUT);
	
	//... and disable MUX again
	digitalWriteFast(ADC_EN, MUX_DISABLE);
	
	//If the currentValue is high, the button is not pressed (active low); if it is low, then
	// the button is pressed.
	return currentValue < 128;
}

double Pad::readPiezo(uint8_t muxIndex){
	//Disable both MUXs
	digitalWriteFast(ADC_EN, MUX_DISABLE);
	digitalWriteFast(DRAIN_EN, MUX_DISABLE);
	
	//Set Sample
	digitalWriteFast(MUX0, muxIndex & 0x01);
	digitalWriteFast(MUX1, muxIndex & 0x02);
	digitalWriteFast(MUX2, muxIndex & 0x04);
	digitalWriteFast(MUX3, muxIndex & 0x08);

	//If we are still within the double hit threshold time-span, re-enable the drain 
	// each time we go through here.  This serves to both drain the stored charge and
	// to prevent double triggering.
	if (playTime + doubleHitThreshold > millis()){
		digitalWriteFast(DRAIN_EN, MUX_ENABLE);
		//Give a bit of time to drain.  To keep constant delays, this should
		// be the same as the delay prior to the ADC reading.
		delayMicroseconds(5);
		return 0;
	}
	
	//Enable ADC MUX...
	digitalWriteFast(ADC_EN, MUX_ENABLE);

	//A short delay here seems to help to read a stable volume.  10us appears fine.
	delayMicroseconds(5);
	
	//... read value...
	uint16_t currentValue = adc->analogRead(ADC_INPUT);
	if (!randomSeedCompleted && currentValue > MIN_VALUE){
		//Seed the randomizer based on the time of the first hit
		randomSeed(millis());
		randomSeedCompleted = 1;
	}
	
	//... and disable MUX again
	digitalWriteFast(ADC_EN, MUX_DISABLE);

	if (currentValue < MIN_VALUE && peakValue < MIN_VALUE){
		//No hit in progress
	}
	else if (currentValue >= MIN_VALUE && peakValue == 0){
		//A new hit has started; record the time
		strikeTime = millis();
		peakValue = currentValue;
	}
	else if (currentValue > peakValue){
		//Volume is still increasing; record this as the new peak value
		peakValue = currentValue;
	}
	
	if (peakValue && (millis() - strikeTime) > MAX_RESPONSE_TIME){
		//We have timed out; send whatever the peak value currently is
		double result = peakValue / 256.0 * padVolume;
		playTime = millis();
		peakValue = 0;
		
		return result;
	}
	
	return 0;
}