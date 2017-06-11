#include <mraa.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <time.h> 
#include <stdlib.h>

//set of definitions 
#define TOUCH_SENSOR_PIN 2
#define PIEZO_SENSOR_PIN 0
#define PIEZO_THRESHOLD 640 
#define TOUCH_SENSED 1 
#define TOUCH_NOT_SENSED 0
#define VIBRATION_SENSED 1
#define VIBRATION_NOT_SENSED 0 

int  main(void)
{	
	int reada, readb;
	char encoder_packet [10] = {};
	char encoded_packet [10] = {}; 
	printf("\nBuilding Brains Evaluation Task");  
	mraa_gpio_context TouchsensorPin;
	mraa_aio_context PiezosensorPin;
	mraa_init();
	TouchsensorPin = mraa_gpio_init(TOUCH_SENSOR_PIN);
	mraa_gpio_dir(TouchsensorPin, MRAA_GPIO_IN);
        PiezosensorPin = mraa_aio_init(PIEZO_SENSOR_PIN);	
	srand(time(NULL));
	int r; 
//	r = rand()%100; 
//	printf("\n%d", r);
//	read = mraa_gpio_read(sensorPin);
	while(1)
	{
		reada = mraa_aio_read(PiezosensorPin);
		int i;
		printf("\n %d", reada);
		if (reada >= PIEZO_THRESHOLD)
		{
			r = rand() % 50;
			int valuea;
			valuea = (VIBRATION_SENSED + r);
			encoded_packet[0] = valuea;
		        encoder_packet[0] = r; 	
		}
		else 
		{
			r = rand() % 50; 
			int valuea;
			valuea = (VIBRATION_NOT_SENSED + r);
			encoded_packet[0] = valuea;
			encoder_packet[0] = r;
		}


		readb = mraa_gpio_read(TouchsensorPin);
		printf("\n %d", readb);
		if (readb == 1)
		{
			r = rand()%50;
			int valueb; 
			valueb = (TOUCH_SENSED+r);
			encoded_packet[1] = valueb;
			encoder_packet[1] = r; 
		}
		else 
		{
			r = rand() % 50; 
		        int valueb; 
			valueb = (TOUCH_NOT_SENSED + r);
			encoded_packet[1] = valueb;
			encoder_packet[1] = r; 
		}

		for (i=2; i<6; i++)
		{
			r = rand() %50;
			encoder_packet[i] = r;
			encoded_packet[i] = r; 
		}

		printf("\n");
		for(i = 0; i<5; i++)
		{
			printf ("%d", encoder_packet[i]);
		}
		printf("\n");
		for (i=0; i<5; i++)
		{
			printf("%d", encoded_packet[i]);
		}

		for (i =0; i<999999999; i++)
		{}			
	}
}

