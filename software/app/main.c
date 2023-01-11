#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"


int main(){
	
	int i =0;
	while(1){
		for(i=0;i<10;i++){
			IOWR_ALTERA_AVALON_PIO_DATA(SEG1_BASE,i);
			usleep(400000);
		}
		i = 0;
	}
}

