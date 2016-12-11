#Exercise 7

##Summary:

Exercise 7 used the idea of PRBS using a 7 bit LFSR. The implementation of this was not too difficult as it required just the adapting of the 4 bit LFSR given in the lecture to a 7 bit LFSR.


##Method:

As the summary outlines, this task was merely the expansion of the 4 bit LFSR shown in the lectures to a 7 bit equivalent. As for the 10 values to be tested, these had to be worked out manually. The taps would be at Q1 and Q7 when taking the lecture notes example explanation into account. This meant a sequence of:

0 0 0 0 0 0 1

0 0 0 0 0 1 1

0 0 0 0 1 1 1

0 0 0 1 1 1 1

0 0 1 1 1 1 1

0 1 1 1 1 1 1

1 1 1 1 1 1 1

1 1 1 1 1 1 0

1 1 1 1 1 0 1

1 1 1 1 0 1 0

And these are the values we alternated through everytime we pressed the key.


##Results and Conclusion:

The results were as expected with this being a good example to understand the LFSR and hence the PRBS.
