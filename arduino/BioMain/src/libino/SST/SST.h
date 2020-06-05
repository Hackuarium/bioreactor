/*
	SST.h - Library for controlling the chip SST26VF064
	Compatible with SST25VF064 chip.
	
	Based on library by Gael Grosch, July 18, 2013

	SST chip has a size of 64Mb
	Reading and writing is byte per byte
	Erasing is only possible per sectors of 4096 Byte. There are 2048 such sectors.

	The addressing works with 3 bytes. The addresses are contained between 0h000000 and 0h7FFFFF
*/

#ifndef SST_h
#define SST_h

#include "Arduino.h"

class SST
{
	public:

	//PUBLIC METHODS----------------------------------------------------

		SST(char port, int pin);
		void init();
		void printNonEmptySector(Print* output);	//this function could be used to get the position in the memory after a reboot
		void printFlashID(Print*);
		void printStatusRegister(Print* output);	// DEBUGGING PURPOSE ONLY: Only accepts Serial as output
		void printConfigRegister(Print* output);	// DEBUGGING PURPOSE ONLY: Only accepts Serial as output
		
		/********
		 * READ *
		 ********/

		void flashReadInit(uint32_t);

		uint8_t flashReadNextInt8();
		uint16_t flashReadNextInt16();
		uint32_t flashReadNextInt32();

		void flashReadFinish();

		/*********
		 * WRITE *
		 *********/

		void flashWriteInit(uint32_t);

		void flashWriteNextInt8(uint8_t);
		void flashWriteNextInt16(uint16_t);
		void flashWriteNextInt32(uint32_t);

		void flashWriteFinish();

		/*********
		 * ERASE *
		 *********/

		void flashSectorErase(uint32_t);
		void flashTotalErase();

		/********************
		 * Block Protection *
		 ********************/
		void flashReadBPR(Print* output); //print block protection regs
		void flashWriteBPR(uint8_t* BPR,int size); //write desired config (18*bytes) to BPR
		void flashClearBPR(); //unlock all block rights (default at startup)
		void flashLockDownBPR(); //lock down BPR config until restart
		void flashLockAllLockDownBPR(uint8_t* BPR); //lock down BPR while writing config (18*bytes)

	private:

	// CLASS ATTRIBUTES ------------------------------------------------

		volatile uint8_t *memPort;
		int _ssPin;
		uint8_t flashVersion;

	// PRIVATE METHODS -------------------------------------------------

		// "No operation" function: Specifies to the controller to wait for 1 clock round
		inline void volatile nop(void);
		void flashSelect();
		void flashDeselect();

		void flashEnable();
		void flashDisable();
		void flashInit();
		void flashWREN(); //Write enable 

		void flashWaitUntilDone();
		void flashSetAddress(uint32_t);
};

#endif
