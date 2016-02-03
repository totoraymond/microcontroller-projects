#ifndef CALIBRATION_H
#define CALIBRATION_H

#include <avr/eeprom.h>
#include <avr/wdt.h>

#include "../Stubby.h"
#include "../Leg.h"
#include "../gait/gait.h"
#include "../hardware/battery.h"
#include "../hardware/magnetometer.h"
#include "../types/Point.h"
#include "../util/delays.h"

#include "../lib/pwm/pwm.h"

//Calibration-specific messages are in 0x3X space...
#define MESSAGE_SAVE_CALIBRATION						0x30
#define MESSAGE_LOAD_CALIBRATION						0x31
#define MESSAGE_RESET_CALIBRATION						0x32
#define MESSAGE_REQUEST_JOINT_CALIBRATION				0x33
#define MESSAGE_SEND_JOINT_CALIBRATION					0x34
#define MESSAGE_REQUEST_FOOT_CALIBRATION				0x35
#define MESSAGE_SEND_FOOT_CALIBRATION					0x36
#define MESSAGE_REQUEST_MAGNETOMETER_CALIBRATION		0x37
#define MESSAGE_SEND_MAGNETOMETER_CALIBRATION			0x38
#define MESSAGE_START_MAGNETOMETER_CALIBRATION			0x39

//Reset Calibration modes
#define MODE_CALIBRATION_JOINTS							0x01
#define MODE_CALIBRATION_FEET							0x02
#define MODE_CALIBRATION_MAGNETOMETER					0x03

namespace digitalcave {
	class Calibration {
			
		private:
			Stubby* stubby;
			
		public:
			Calibration(Stubby* stubby);
			
			/*
			 * Called from the Stubby protocol dispatch function
			 */
			void dispatch(Serial* serial, FramedSerialMessage* message);
	};
}

#endif
