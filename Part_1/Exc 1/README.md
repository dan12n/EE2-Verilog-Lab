#Exercise 1

##Summary:

Exercise 1's objective was to create a binary to hex converter with the hexadecimal values to be displayed on the 7 segment display. This was to be done using schematic design. Using a selection of AND, OR and NOT gates, the 4 bit binary (HEX) was converted to a 7 bit output corresponding to the segments on the display. Finally, a look at the timing analysis for different temperature models yielded the results seen in the images below.


##Method:

The method used to complete this program was the schematic design method. This required downloading a partially completed schematic design where 6 of the 7 output bits were completed. All that was left to add was the schematic section for out[4], the bottom left segment (the segments are numbered from 0-5 clockwise with 0 at the top, and 6 in the middle). This required the connection of a 3-input OR gate to the output from two 3-input AND, and one 2-input AND gate. The schematic represented: (/in3 AND in0) OR (/in3 AND in2 AND /in1)  OR (/in2 AND /in1 AND in0). This was then compiled, the respective pins were assigned and the output was displayed on the 7 segment display with a range of 0-F corresponding to the inputs from the switches. The results to take away from this exercise was toward the end when we had a look at the timing analysis for the different temperature extremes and the contributing pins and ALMs. 


##Results and Conclusion:

We saw that this implementation used very few resources (4 ALMs and 11 pins).

Finally, in terms of the actual output on the display, this was as expected. However it is important to note that due to the requirement of only out[4], this was implemented very quickly, but if all pins were required and we were not given the partially completed design, this would be very time-consuming and so the more efficient Verilog coding would be seen in Part 2.
