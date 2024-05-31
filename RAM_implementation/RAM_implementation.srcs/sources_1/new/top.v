`timescale 1ns / 1ps

module top(
    input[7:0] data_in,
    input[7:0] addr,
    input we,
    input reset,
    input clk_100MHz,
    output[6:0] out_7seg_data,
    output[6:0] out_7seg_addr,
    output[3:0] en_7seg_data,
    output[3:0] en_7seg_addr
    );
    wire[7:0] out_ram;
    ram256x8 ram(
        .clk(clk_100MHz),
        .data_in(data_in),
        .addr(addr),
        .we(we),
        .data_out(out_ram)
    );
    wire out_clk;
    freq_div freq(
        .reset(reset),
        .clk_100MHz(clk_100MHz),
        .clk_50Hz(out_clk)
    );
    fsm fsm1(
        .clk(out_clk),//changed
        .reset(reset),
        .out_en(en_7seg_data)
    );
    fsm fsm2(
        .clk(out_clk),//changed
        .reset(reset),
        .out_en(en_7seg_addr)
    );
    wire[3:0] out_digit1;
    digit_extractor digit1(
        .in(out_ram),
        .sel(en_7seg_data),
        .out(out_digit1)
    );
    transcodor_7seg transcodor1(
        .in(out_digit1),
        .out(out_7seg_data)
    );
    
    wire[3:0] out_digit2;
    digit_extractor digit2(
        .in(addr),
        .sel(en_7seg_addr),
        .out(out_digit2)
    );
    transcodor_7seg transcodor2(
        .in(out_digit2),
        .out(out_7seg_addr)
    );
    
endmodule
