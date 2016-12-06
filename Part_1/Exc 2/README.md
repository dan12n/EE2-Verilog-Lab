#Exercise 2

##Summary:

Exercise 2's objective was the same as that of exercise 1, but the method to implement it is different as this time Verilog is used to make the design instead of the schematic method. The output should be the same as before for the display, the timing analysis, and the resources used.


##Method:

The method this time round used Verilog code and the final code used can be found in ex_top2.v and hexto7seg.v. The top level entity takes the switches as input and calls the hexto7seg.v module which converts each 4 bit input arrangement to its equivalent output to be displayed on the 7 segment display, so for example an input of 1 corresponds to an output of 1111001. The right 7 bit pattern is returned and is displayed as the output of the top level entity.

Furthermore, pin assignment was time-consuming in th first exercise, so this time we were given a pin assignment text file to use every time with all the possible pins assigned. Any pins not used are removed (optimisation) is done by Quartus while compiling. 


##Results and Conclusion:

This method to produce the same output as exercise 1 was a lot quicker than having to connect blocks as was the case in the schematic method. This was a clear demonstration that the use of Verilog to design the modules is better than the slower and more error-prone schematic way.
