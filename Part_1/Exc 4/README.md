#Exercise 4

##Summary:

The objective of the final exercise in Part 1 extended the previous exercise by displaying a BCD representation of the input rather than the hexadecimal. This required slightly more work than simply adapting the top level design with new modules needed.

##Method:

Two new modules were required for this task. The first was to convert the binary input to a BCD representation, and then another to display the decimal number to replace the equivalent module for hexadecimal.The second was simple enough utilising the same technique for the hexadecimal equivalent, namely assigning each potential decimal input to an output on the screen. However, the b_to_bcd module was more difficult with the need for another module to be used within called add3get5. The designs for these were all explained in lectures and so were implemented based on these explanations. The add3get5 for example worked on the principle of if any digit was greater than 5, 3 was added to it.


##Results and Conclusion:

The results were as expected with the switches' binary input being represented by 3 decimal digits.
