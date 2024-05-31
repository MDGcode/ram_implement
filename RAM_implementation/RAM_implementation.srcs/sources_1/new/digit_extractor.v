`timescale 1ns / 1ps

module digit_extractor(
        input [7:0] in,
        input [3:0] sel,
        
        output reg [3:0] out
    );
    
    integer temp;
    reg [3:0] hundreds_digit;
    reg [3:0] tens_digit;
    reg [3:0] units_digit;

    always @(*) begin
        // Assign input to temporary variable for calculations
        temp = in;
        
        // extract the units digit
        units_digit = temp % 10;
        
        // To do: extract the tens digit
        tens_digit = temp/10 %10;

        // To do: extract the hundreds digit
	    hundreds_digit = temp / 100;
    end
    
    always @(*) begin
        case (sel)
            4'b1110: out = units_digit;
            4'b1101: out = tens_digit;
            4'b1011: out = hundreds_digit;
        endcase
    end
    
endmodule