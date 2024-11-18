`timescale 1ns / 1ps


module Switch_Debouncer_tb();

reg raw;
reg clk;
wire clean;

Switch_Debouncer uut1 (raw,clk,clean);

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
    #10 raw = 1'b0;
    #20 raw = 1'b1;
    #20 raw = 1'b0;
    #20 raw = 1'b1;
    #200 raw = 1'b0;
    #20 raw = 1'b1;
    #200 raw = 1'b0;
end 

endmodule
