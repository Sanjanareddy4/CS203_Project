module     fifo_tb; 
  reg     clk;  
  reg     rst_n;  
  reg     wr;  
  reg     rd; 
  reg     [7:0] data_in;
  wire     [7:0] data_out; 
  wire     fifo_empty;
  wire     fifo_full;
  wire     fifo_threshold;
  wire     fifo_overflow;
  wire     fifo_underflow;
fifomemory tb (.data_out(data_out),.ffull(fifo_full),.fempty(fifo_empty),.fthreshold(fifo_threshold), 
               .foverflow(fifo_overflow),.funderflow(fifo_underflow),.clk(clk), .rst_n(rst_n), .wr(wr),
               .rd(rd), .data_in(data_in) );  
  //
  //.....
endmodule