module fifomemory(data_out,ffull, fempty, fthreshold, foverflow, funderflow,clk, rst_n, wr, rd, data_in);  
  input wr, rd, clk, rst_n;  
  input[7:0] data_in; 
  output[7:0] data_out;  
  output ffull, fempty, fthreshold, foverflow, funderflow;  
  wire[4:0] wptr,rptr;  
  wire fwe,frd;   
  writepointer U1(wptr,fwe,wr,ffull,clk,rst_n);  
  readpointer U2(rptr,frd,rd,fempty,clk,rst_n);  
  memory_array U3(data_out, data_in, clk,fwe, wptr,rptr);  
  status_signal top4(ffull, fempty, fthreshold, foverflow, funderflow, wr, rd, fwe, frd, wptr,rptr,clk,rst_n);
  //
  //.....
endmodule

module writepointer(wptr,fwe,wr,ffull,clk,rst_n);  
  input wr,ffull,clk,rst_n;  
  output[4:0] wptr;  
  output fwe;
  //
  //.....  
endmodule  

module readpointer(rptr,frd,rd,fempty,clk,rst_n);  
  input rd,fempty,clk,rst_n;  
  output[4:0] rptr;  
  output frd; 
  //
  //..... 
endmodule

module memory_array(data_out, data_in, clk,fwe, wptr,rptr);  
  input[7:0] data_in;  
  input clk,fwe;  
  input[4:0] wptr,rptr;  
  output[7:0] data_out; 
  //
  //..... 
endmodule

module status_signal(ffull, fempty, fthreshold, foverflow, funderflow, wr, rd, fwe, frd, wptr,rptr,clk,rst_n);  
  input wr, rd, fifo_we, fifo_rd,clk,rst_n;  
  input[4:0] wptr, rptr;
  output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;  
  //
  //.....
endmodule