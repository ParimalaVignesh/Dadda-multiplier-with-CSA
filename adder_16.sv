module adder_16(s, co, os, a, b);
    output [15:0] s;
    output        co, os;
    input  [15:0] a, b;
    wire co_low, os_low;
    wire [7:0] sum_low, sum_high;
    
    // Lower 8 bits (no carry-in)
    adder_8 lower(.s(sum_low), .co(co_low), .os(os_low), .a(a[7:0]), .b(b[7:0]), .ci(1'b0));
    // Upper 8 bits with carry-in from lower adder
    adder_8 upper(.s(sum_high), .co(co), .os(os), .a(a[15:8]), .b(b[15:8]), .ci(co_low));
    
    assign s = {sum_high, sum_low};
endmodule