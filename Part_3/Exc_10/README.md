#Exercise 10

##Summary:

This exercise introduced digital to analogue conversion using serial to parallel interface. The digital input was provided by the switches and the analogue output would be verified on the oscilloscope.


##Method:

With the spi2dac.v module given to us, all that was required was clock divider to reduce the frequency to 10KHz. After connecting these together, we could use the inout switches to test the values given to us, namely the output voltage for 0 and 3ff, the min and max values for the 10 bits. Also the DAC_SDI and DAC_SCK for 23b.


##Results and Conclusion:
