#Exercise 12

##Summary:

Exercise 12 introduces ROM, and the ROM we used stores one cycle of a sinewave, so each loation represents phase, and the value at this location represents magnitude. This is a more introductory task and so we had to create the ROM, populate it and using the switches as input, display the contents of the input location on the 7 segment display.


##Method:

Our first step was to create the contents of the ROM, and the instructions for this indicated that this could be done in two methods, via Python or Matlab, and with our recent experience in Matlab, this was the obvious choice. 

Through the IP Catalog, we created a 1 bit ROM and populated it using the .mif file and this produced a new module which could be readily called (ROM.v). All that was really left then was the top level module, and this required calling the ROM module with the switches as the input representing the memory location, and the returning output of this module is the location contents. These are the displayed on the 7 segment display and verified by examining the .mif file.


##Results and Conclusion:

The results were as expected with the input corresponding to the memory location and the ROM module working by taking in this value and returning the equivalent contents of this location. This was an introduction task and the ROM will be used again later, but it was also good to try the IP Catalog as this could come in handy for lots of different components.
