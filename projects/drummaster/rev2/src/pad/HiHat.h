#ifndef HIHAT_H
#define HIHAT_H

#include "Pad.h"

namespace digitalcave {

	/*
	 * A HiHat object is a special type of Pad which uses two analog input channels (pedal position and cymbal
	 * strike velocity) along with a digital switch (pedal tightly closed) to play back sounds.
	 */
	class HiHat : public Pad {
		private:
			uint8_t piezoMuxIndex;
			uint8_t pedalMuxIndex;
			uint8_t switchMuxIndex;
	
	public:
			//Create a new pad object referencing the specified hardware channel
			HiHat(uint8_t piezoIndex, uint8_t pedalMuxIndex, uint8_t switchMuxIndex, uint8_t doubleHitThreshold);

			//Implement virtual method
			void poll();
	};
	
}

#endif