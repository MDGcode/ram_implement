`timescale 1ns / 1ps


module freq_div(
    input reset,
    input clk_100MHz,
    output reg clk_50Hz
    );
    reg[19:0] counter;
    always @(posedge clk_100MHz,posedge reset)begin
        if(reset == 1)begin
            clk_50Hz <= 0;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
            if(counter == 20'd999999)begin
                counter<=0;
                clk_50Hz = ~clk_50Hz;
            end
                
        end
        
    end
    
endmodule
