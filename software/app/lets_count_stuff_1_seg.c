#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"

//Fonction qui affiche sur un 7 seg
void aff_segment(int addr,int nbr);


int main(){
	
	int i =0;
	while(1){
		for(i=0;i<10;i++){
			aff_segment(SEG1_BASE,i);
			usleep(400000);
		}
		i = 0;
	}
}



void aff_segment(int addr,int nbr){
	//On vien ecrire sur le 7seg en fonction du nbr
	switch(nbr){
		case 0: 
			alt_printf("0\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b1000000);
			break;
		case 1: 
			alt_printf("1\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b1111001);
			break;
		case 2: 
			alt_printf("2\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0100100);
			break;
		case 3: 
			alt_printf("3\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0110000);
			break;
		case 4: 
			alt_printf("4\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0011001);
			break;
		case 5: 
			alt_printf("5\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0010010);
			break;
		case 6: 
			alt_printf("6\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0000010);
			break;
		case 7: 
			alt_printf("7\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b1111000);
			break;
		case 8: 
			alt_printf("8\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0000000);
			break;
		case 9: 
			alt_printf("9\n");
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b0010000);
			break;
		default:
			IOWR_ALTERA_AVALON_PIO_DATA(addr,0b1111111);
			break;
	}
}
