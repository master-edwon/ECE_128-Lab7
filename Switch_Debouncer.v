`timescale 1ns / 1ps

module Switch_Debouncer(
    input raw,
    input clk,
    output reg clean
    );
    reg [2:0] counter;
    wire TC;
    
    always @ (posedge clk)
    begin
        if(~raw)
            counter <= 3'b000;
        else
            #10 counter <= counter + 3'b001;
    end
    
    assign TC = (counter == 3'b111);
    always @ (posedge clk) 
    begin
        if(~raw)
            clean <= 1'b0;
        else if(TC)
            clean <= 1'b1;
    end
endmodule

