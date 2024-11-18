`timescale 1ns / 1ps

module Moore_Machine_tb();
    reg P1;
    reg clk;
    reg reset;
    wire z;
    
    Moore_Machine uut1 (P1, clk, reset, z);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    
    initial begin
        reset = 0;
        P1 = 0;
        #10 reset = 1;  // Apply reset
        #10 reset = 0;  // Deassert reset
        
        // Test case 1: Check the transition from S0 to S1 with P1 = 1
        #10 P1 = 1;  // P1 = 1 should transition to S1
        #10 P1 = 1;  // P1 = 1 should transition to S2
        #10 P1 = 0;  // P1 = 0 should transition to S3
        #10 P1 = 0;  // P1 = 0 should transition to S4
        #10 reset = 1;  // Apply reset
        #10 reset = 0;  // Deassert reset
        #15 P1 = 1;  // P1 = 1 should transition to S1
        #10 P1 = 1;  // P1 = 1 should transition to S2
        #10 P1 = 1;  
        #5 P1 = 0;  // P1 = 0 should transition to S3
        #10 P1 = 0;  // P1 = 0 should transition to S4
       
        #10 P1 = 1;  // P1 = 1 should transition to S1
        #10 P1 = 1;  // P1 = 1 should transition to S2
        #10 P1 = 0;  // P1 = 0 should transition to S3
        #10 P1 = 0;  // P1 = 0 should transition to S4
        
        // Finish simulation after some time
        #30 $finish;
    end
endmodule


