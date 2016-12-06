#Exercise 3

##Summary:

The objective of this exercise is to extend the Exercise 2 so that we take into account 10 bits, and hence 3 hexadecimal values (with the most significant one going to a maximum of 3). This required simply the adapting of the top level entity in exercise 2, with the component modules (hexto7seg.v) the same.


##Method:

Similar to exercise 2, the only differences were taking in input from all 10 switches rather than the least significant 4 switches and so representing 3 different hexadecimal values, and using 3 separate calls to hexto7seg.v with different input bits. So for the least significant hex value, we called hexto7seg.v on input switches 0-3, 4-7 for the middle hex value and 8-9 for the most significant hex display.


##Results and Conclusion:

The results were as expected with 3 different hexadecimal values displayed. One takeaway from thsi exercise was the increase in resources required with 31 pins now used, as opposed to the earlier 11 and 9 ALMs as opposed to the previous 4.

