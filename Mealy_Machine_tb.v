`timescale 1ns / 1ps

module Mealy_Machine_tb();
    
    reg P1;
    reg clk;
    reg reset;
    // Outputs
    wire z;
    // Instantiate the Unit Under Test (UUT)
    Mealy_Machine uut (
        .P1(P1), 
        .clk(clk), 
        .reset(reset), 
        .z(z)
    );
initial
    begin
        clk = 1'b0;
        reset = 1'b1;
        #10 reset = 1'b0;
    end

always #5 clk = ~ clk;  

initial begin
        #10  P1=1;
        #10  P1=1;
        #10  P1=0;
        #15  P1=1; //z = 1 and go to 
        
        #10  P1=1; 
        #5  P1=0;
        #10  P1=1;
        #10  P1=0;
        #10 $finish;
    end

endmodule


