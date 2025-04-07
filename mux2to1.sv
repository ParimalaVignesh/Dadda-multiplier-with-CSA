module mux2to1(in0, in1, sel, out);
   
    output out;
    input  in0, in1, sel;
    assign out = sel? in1:in0;
   
endmodule 