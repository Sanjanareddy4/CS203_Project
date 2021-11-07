CS203 - Project SUbmission 2

Verilog code implementation of FIFO Memory

Writing code in verilog is done till defining modules and declaring inputs and outputs for each module.
In test bench ports were declared. Following is the brief of our code and functions performed by modules.

This code contains 5 modules. Below points explain inputs and functions by each module.
=> Module 1: This module just calls the modules in the below written order (2,3,4,5). module definition is,

  module fifomemory(data_out,ffull,fempty,fthreshold,foverflow,funderflow,clk,rst_n,wr,rd,data_in);  

  inputs and their significance:
  wr : if it is '1' then data_in is written into memory.
  rd : if it is '1' then output will be given according to fifo.
  clk : clock with some time period.
  rst_n : if it is '0' then everything is cleared from memory.
  data_in : input data. it is of 8 bits.

  outputs and their significance:
  data_out : 8 bits output. It updates when rd is '1'.
  fempty : it is '1' if memory is empty.
  ffull : it is '1' if memory is full.
  fthreshold : it is '1' when the number of data in FIFO is less than a specific threshold, else low.
  foverflow : it is '1' when ffull is one and we still writing something in to memory.
  funderflow : it is '1' when fempty is one and we still reading something from memory.

=> Module 2 : This module shows where the data just given as input stored. The module definition is,

  module writepointer(wptr,fwe,wr,ffull,clk,rst_n);

  inputs and their significance:
  wr,ffull,clk,rst_n has their usual meanings as mentioned in module 1.

  outputs and their significance:
  fwe : output is '1' if wr is one and ffull is zero. can be understood as write enable.
  wptr : It is a 5 bit number increments by 1 when fwe is 1. starts from 0 when rst_n is 0.
         It changes at positive edge of clock or negitive edge of rst_n.

=> Module 3 : This module shows from where the data is just read. The module definition is,

  module readpointer(rptr,frd,rd,fempty,clk,rst_n);
  
  inputs and their significance:
  rd,fempty,clk,rst_n has their usual meanings.

  outputs and their significance:
  frd : output is '1' if rd is one and fempty is zero. can be understood as read enable.
  rptr : It is a 5 bit number increments by 1 when frd is 1. starts from 0 when rst_n is 0.
         It changes at positive edge of clock or negitive edge of rst_n.

=> Module 4 : This module performs assigning the data_in to memory and giving data_out as output based on 
              wptr and rptr respectively. The module definition is,

  module memory_array(data_out,data_in,clk,fwe,wptr,rptr);

  inputs and their significance:
  data_in,clk,fwe,wptr,rptr has their usual meanings.
  
  output and their significance:
  we output data_out based on rptr pointer.

  other than output and input we store the data_in at every positive edge of clock and when fwe is 1.

=> Module 5 : This module updates the values of ffull, fempty, fthreshold, foverflow, funderflow for every
              change in input. The module is defined as,

  module status_signal(ffull,fempty,fthreshold,foverflow,funderflow,wr,rd,fwe,frd,wptr,rptr,clk,rst_n);

  inputs and their significance:
  wr,rd,fwe,frd,wptr,rptr,clk,rst_n are inputs and has usual meanings.

  output and their significance:
  ffull,fempty,fthreshold,foverflow,funderflow are outputs and has usual meanings as mentioned in module 1. 