// Code your design here

module adder(s, co, a, b, ci);

    output s, co;
    input  a, b, ci;
   
//    wire [1:0] Result;
//    assign Result = a + b + ci;
//    assign s = Result[0];
//    assign co = Result[1];
 
    assign {co,s} = a + b + ci;  
endmodule // adder
