`timescale 1ns / 1ps

module fsm(
    input clk,
    input reset,
    output[3:0] out_en
    );
    localparam DIGIT_0 = 4'b1110;
    localparam DIGIT_1 = 4'b1101;
    localparam DIGIT_2 = 4'b1011;
    
    reg [3:0] state, state_next;

always@(posedge clk,posedge reset) begin
    if(reset == 1)
        state <=  DIGIT_0;
    else
        state <= state_next;
end

always@(*) begin
    state_next = state;
    case(state)
        DIGIT_0: begin
                state_next = DIGIT_1;
            end
        DIGIT_1: begin
                state_next = DIGIT_2;
            end
        DIGIT_1: begin
                state_next = DIGIT_0;
            end
        default: state_next = DIGIT_0;
	endcase
end
assign out_en = state;
endmodule
