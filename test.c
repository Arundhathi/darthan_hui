#include <mraa.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

//set of definitions 
#define TOUCH_SENSOR_PIN 2
#define PIEZO_SENSOR_PIN 0
#define PIEZO_THRESHOLD 720 
#define TOUCH_SENSED 1 
#define TOUCH_NOT_SENSED 0
#define VIBRATION_SENSED 1
#define VIBRATION_NOT_SENSED 0 

int  main(void)
{	
	int reada, readb;
	char packet [10] = {};
	printf("\nBuilding Brains Evaluation Task");  
	mraa_gpio_context TouchsensorPin;
	mraa_aio_context PiezosensorPin;
	mraa_init();
	TouchsensorPin = mraa_gpio_init(TOUCH_SENSOR_PIN);
	mraa_gpio_dir(TouchsensorPin, MRAA_GPIO_IN);
        PiezosensorPin = mraa_aio_init(PIEZO_SENSOR_PIN);	
//	read = mraa_gpio_read(sensorPin);
	while(1)
	{
		reada = mraa_aio_read(PiezosensorPin);
		int i;
		printf("\n %d", reada);
		if (reada >= PIEZO_THRESHOLD)
		{
			packet[0] = VIBRATION_SENSED; 
		}
		else 
		{
			packet[0] = VIBRATION_NOT_SENSED;
		}


		readb = mraa_gpio_read(TouchsensorPin);
		printf("\n %d", readb);
		if (readb == 1)
		{
			packet[1] = TOUCH_SENSED;
		}
		else 
		{
			packet[1] = TOUCH_NOT_SENSED; 
		}
		printf("\n");
		for(i = 0; i<5; i++)
		{
			printf ("%d", packet[i]);
		}

		for (i =0; i<999999999; i++)
		{}			
	}
}

