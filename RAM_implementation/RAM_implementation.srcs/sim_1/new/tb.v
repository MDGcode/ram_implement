`timescale 1ns / 1ps

module tb();
    
reg[7:0] data_in;
reg[7:0] addr;
reg we;
reg reset;
reg clk_100MHz;
wire[6:0] out_7seg_data;
wire[6:0] out_7seg_addr;
wire[3:0] en_7seg_data;
wire[3:0] en_7seg_addr;
    

initial begin
    clk_100MHz = 0;
    forever #5 clk_100MHz = ~clk_100MHz;
end

top dut(
    .data_in(data_in),
    .addr(addr),
    .we(we),
    .reset(reset),
    .clk_100MHz(clk_100MHz),
    .out_7seg_data(out_7seg_data),
    .out_7seg_addr(out_7seg_addr),
    .en_7seg_data(en_7seg_data),
    .en_7seg_addr(en_7seg_addr)
);

initial begin
    reset = 1;
    data_in = 8'd0;
    addr = 8'd0;
    we = 0;
    #5 reset = 0;
    #20 data_in = 8'd250; we = 1;
    #10 data_in = 8'd185; addr = 8'd25;
    #10 data_in = 8'd131; addr = 8'd12;
    #10 we=0; addr = 8'd0;
    #30 addr = 8'd25;
    #30 addr = 8'd12;
    #95 $stop;
end

endmodule
