##Summary:

For this exercise, we were tasked with producing an echo with a fixed delay for the sounds heard using the earphones. We were given a signal flow graph to help with this and this basically showed that the output would be the input sound plus the input sound delayed and attenuated by multiplication by a constant. This would give the original sound and a quieter echo.

##Method:

To implement this task, we had to firstly create a FIFO from the IP Catalog which would take a maximum capacity of 8192 samples each of size 10 bits. With a sampling frequency of 10KHz, this would mean that the dixed delay for this design will be 0.8192ms. How the FIFO works is that the incoming data is stored and released in the order that it is stored. With a number of the key components being previously available, the key changes were to be made in the delay module. Within this module, the offsets are initialised, and the input has the ADC_OFFSET taken away. This is then fed to the FIFO, along with the lower frequency clock and an output which represents the echo is expected. There are a couple of other parameters such as write to the FIFO, which is set to one throughout, and read is set to one only once the FIFO is full, and once this occurs, it reads and writes from there on. The output is then shifted, to represent the multiplication by a constant (for attentuation). One key note here is that this output is signed, and so we need to sign extend when divideing by 2 or 4 whcih constitutes a shift. This is one problem we had initially. Another was that our code seemed correct, but we were not hearing the echo, and this was a silly mistake as we had forgotten to add the echo to the inital data when outputting completely from the whole system.

##Results/Conclusions:

This was tested for different sounds and the echo was clear to hear so it worked correctly. The key takeaway from this probably was how to deal with signed variables in Verilog as seen with the signed output from the FIFO.
