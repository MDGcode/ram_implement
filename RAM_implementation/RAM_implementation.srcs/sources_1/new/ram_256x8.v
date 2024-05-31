`timescale 1ns / 1ps

module ram256x8 
	(
		  input clk,
			input [7:0] addr,
			output reg [7:0] data_out,
			input we,
			input [7:0] data_in
    );
    
reg [7:0] memorie_efectiva [0:256];  

always@(*)
begin
	data_out = memorie_efectiva[addr]; 
end

always@(posedge clk)
begin    
    if(we == 1)
    	begin
    	memorie_efectiva[addr] <= data_in; 
    	end 
end    
    
endmodule
