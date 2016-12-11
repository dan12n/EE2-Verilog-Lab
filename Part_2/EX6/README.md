#Exercise 6

##Summary:

The task we were set for exercise 6 was to design a 16 bit counter, and display the counter on the 7 segment display in a hexadecimal representation. This used many of the previous modules we've used slightly adapted to the larger number of bits.


##Method:

3 main modules would be required for this design, a 16 bit counter, a binary to bcd converter and a hex to 7 segment display. The 16 bit counter was produced by just adaoting the 8 bit counter, changing the number of bits to 16 and adding a reset to reset the counter. The binary to bcd module was given to us and the hex to 7 segment was previously created. So the design was simple enough to produce, particularly using the diagram given in the instructions. Looking at the timing analysis, we found that the maximum frequency at the highest temperaure was 445.24MHz, and 422.3MHz for the lowest temperature. The other features we could find were the different types of paths within the design for the setup and hold time, such as unconstrained input ports for example.


##Results and Conclusion:

