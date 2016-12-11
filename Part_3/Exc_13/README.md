#Exercise 13

##Summary:

This exercise uses a counter to go through the different locations of the ROM, and using the output of the ROM, this is passed to the two methods of digital to analogue conversion which should then give us a sinewave of a fixed frequency.


##Method:

The first step was to reduce the frequency to 10KHz as this would act as an enable for the counter, the clock for the ROM and the load/enable for the 2 conversion modules. This was done simply using a divide by 5000 block as seen in earlier tasks. So the counter advances every clock cycle of this clock. This also acted as the clock for the ROM so that the two coponents match. Beyond this, we have the two conversion modules from previous sections, and the 10 bit output of the ROM representing the output at the current phase is passed on to these conversion methods. As the whole of the ROM represents one sinewave of a fixed frequency and there are 1K x 10, we shoudl get a complete sinewave on screen when verifying the output using the oscilloscope through either method.


##Results and Conclusion:

As can be seen above, a fixed frequency sinewave is the output we got from this exercise as is to be expected.
