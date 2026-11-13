# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Brian
Paul

## Summary
We chained together three T flipflops to create a ripple counter that counts down from 7 to 0 then resets back to 7. 

We chained together three D flipflops to create a Modulo-5 counter that is able to count from 0 to 7 but checks the output, and outputs when it reaches 5 and then resets. 


## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
Because it is only sending an output signal once every 6 counts (0 to 5). This output signal can be used as a clock divider which divides the clock by 2 * count. 

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
Because it was a down counter. This means that all the T-Flipflops were triggered on the first positive clock edge. 

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
Assuming ripple counter / frequency divider then we would need 10 T flipflops set end-to end to reduce a 100MHz frequency to ~1kHz. 
