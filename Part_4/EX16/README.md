##Summary:

This exercise was an introduction to analogue to digital converter mostly using modules provided and the objective was to hear the sound played through the computer through the earphones connected to the add on card.

##Method:

As previously mentioned most of the modules were provided, including the top level module, spi2adc.v and allpass.v. The main one is allpass and what this basically does is it applies the offsets to ensure that the two's complement factor is taken into acoount and assigns the whole of the input to the output, hence teh name.

Our extension task here was to try and amplify this sound and this was a simple extension by simply adapting the allpass module to multiply the offset applied input by 4 and assigning this to the output, then applying the digital to analogue offset.

##Results/Conclusions:

This worked as expected with the sound being heard cleanly with the normal allpass, and louder when the amplification was applied.
