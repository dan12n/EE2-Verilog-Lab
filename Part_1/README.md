#Part 1

##Summary:
The objective of part 1 of the experiment was to appreciate the efficiency that comes with using verilog code for the desgn of the circuits as opposed to using schematic diagrams in Quartus. This was demonstrated with the hexto7seg module, where switches 0-3, were the input representing a hex value from 0 to F, and this was to be displayed on the 7 segment display. The schematic implementation, while not too taxing due to the desired program being quite small, still took a lot longer to implement relative to the verilog implementation. 

This section covered both exercise 1 and 2. Moving on to exercise 3, we were tasked with extending our design from exercise 2, to include 3 of these hexto7seg blocks so that the whole range of 10 switches was taken into account on the 7 segment display.

Finally, for the optional challenge (Exercise 4), we adapted the design in part 3, so that the display was no longer of hexadecimal digits, but of BCD instead (0-9 in each display). This meant the basic building blocks were the same for the input (switches) and the output (hexto7seg). However, an extra function was require so that the input to the hexto7seg module was no longer the switches input, but a BCD input, and for this, the new function had to convert the binary input into a BCD output, which is the passed as input to the display modules. Furthermore, we saw the optimization Quartus carries out with regards to resources when we used the provided 16 bit converter for the 10 bit input.

In conclusion, Part 1 was an introduction to using Verilog for the design rather than the schematic method, with speed and reusability being the key benefits. 


