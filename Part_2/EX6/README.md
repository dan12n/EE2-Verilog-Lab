#Exercise 6

##Summary:

The task we were set for exercise 6 was to design a 16 bit counter, and display the counter on the 7 segment display in a hexadecimal representation. This used many of the previous modules we've used slightly adapted to the larger number of bits.


##Method:

3 main modules would be required for this design, a 16 bit counter, a binary to bcd converter and a hex to 7 segment display. The 16 bit counter was produced by just adaoting the 8 bit counter, changing the number of bits to 16 and adding a reset to reset the counter. The binary to bcd module was given to us and the hex to 7 segment was previously created. So the design was simple enough to produce, particularly using the diagram given in the instructions. Looking at the timing analysis, we found that the maximum frequency at the highest temperaure was 445.24MHz, and 422.3MHz for the lowest temperature. The other features we could find were the different types of paths within the design for the setup and hold time, such as unconstrained input ports for example.

For the extension of this exercise, we needed to add a clock divider as the current counter was far too quick, and this clock divider would divide the current clock by 50,000 meaning a new clock frequency of 1KHz. This is simple enough to design with the new clock having a cycle every 50,000 clock cycles of the quicker clock.


##Results and Conclusion:

The counter worked as expected with the display representing the value of the 16 bit counter. The results for the maximum frequencies at different temperatures are as seen above with a lower frequency at the lower temperature. The problems seen with the timinhg analysis were potential unconstrained ports or paths for the outputs and inputs, and this could be a problem as setup or hold times could be violated which could lead to a potetnial metasatable state.

