#Part 3

##Summary: 

Part 3 introduced the Add-on Card, and our first task with this addition was to understand the serial to parallel interface of the digital to analog converter using modelsim, and this was seen in exercise 10. 

Exercise 11 introduced pulse-width modulation and this highlighted that there was a different way to produce an analogue output from a digital number.

Exercise 12 brought the idea of ROM for the first time and we were tasked with creating a ROM, filling it with values, and displaying the values at the address specified by the input switches.

For the next exercise, the switches were replaced by a counter that goes through the addresses in the ROM. The ROM contains one cycle of a sinewave and so using the counter, and using both methods seen in exercise 10 and 11, we should get a perfect sinewave being generated.

Penultimately, we had to adapt the previous exercise so that the sinewave generated is no longer of a fixed frequency, but of a variable one as specified by the input switches on the FPGA.

Finally, exercise 15 is where we convert analogue voltages to their digital equivalent using the provided spi2adc module and the potentiometer on the add on card.
