#Exercise 5

##Summary:

This exercise was more an introduction to counters, modelling and testbenches than a design task. The use of modelsim and to try testbenches and to model our 8 bit counter were an example to show the value of such tools.


##Method:
Simulation:
<img src ="https://cloud.githubusercontent.com/assets/17357371/20848935/3678a87c-b8cc-11e6-8dbd-5c4412642b5b.png" />

The design for the 8 bit binary counter was given to us, and upon implementing it, modelsim was run using and commanded to simulate this file. In the transcript pane, some commands were entered such as "force enable 1" to enable the counter. These commands produced the waveform seen above with the enable on, the counter incrementing as expected, and with the enable off, the counter retaining its current value. This was then seen again when the do file was created which basically acts as a testbench. The benefits of the do file is that it is reusable and can thus save time and verify correctness for different versions of the design. 

##Results and Conclusion:
Fmax Summary:
<div>
<img src ="https://cloud.githubusercontent.com/assets/17357371/20848948/41749a74-b8cc-11e6-9205-23eb80b0e20e.png" />
</div>
Unconstrained Paths:
<div>
<img src = "https://cloud.githubusercontent.com/assets/17357371/20848959/4b6efe66-b8cc-11e6-9254-cc6859e3969d.png" width=400px/>
</div>

In conclusion, we saw the benefits of these new tools, which could save time as projects grow larger and can allow us to be more sure of the success of our designs before uploading to the FPGA.
