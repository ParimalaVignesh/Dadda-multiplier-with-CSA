module dadda_8(A, B, y);
    input  [7:0] A, B;
    output [15:0] y;
    
    // Generate the 8 partial products.
    // Each partial product is an 8-bit AND of A and one bit of B,
    // shifted left by the bit index.
    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;
    
    assign pp0 = {8'b0, A & {8{B[0]}}};
    assign pp1 = {7'b0, A & {8{B[1]}}, 1'b0};
    assign pp2 = {6'b0, A & {8{B[2]}}, 2'b0};
    assign pp3 = {5'b0, A & {8{B[3]}}, 3'b0};
    assign pp4 = {4'b0, A & {8{B[4]}}, 4'b0};
    assign pp5 = {3'b0, A & {8{B[5]}}, 5'b0};
    assign pp6 = {2'b0, A & {8{B[6]}}, 6'b0};
    assign pp7 = {1'b0, A & {8{B[7]}}, 7'b0};
    
    // First level: add the partial products pairwise using 16-bit adders.
    wire [15:0] sum0, sum1, sum2, sum3;
    adder_16 add0(.s(sum0), .co(), .os(), .a(pp0), .b(pp1));
    adder_16 add1(.s(sum1), .co(), .os(), .a(pp2), .b(pp3));
    adder_16 add2(.s(sum2), .co(), .os(), .a(pp4), .b(pp5));
    adder_16 add3(.s(sum3), .co(), .os(), .a(pp6), .b(pp7));
    
    // Second level: add the results of the first level.
    wire [15:0] sumA, sumB;
    adder_16 addA(.s(sumA), .co(), .os(), .a(sum0), .b(sum1));
    adder_16 addB(.s(sumB), .co(), .os(), .a(sum2), .b(sum3));
    
    // Final level: add the two results to get the final product.
    adder_16 addFinal(.s(y), .co(), .os(), .a(sumA), .b(sumB));
    
endmodule
