// test bench of adder 8 bit
module test_bench;  
    // 1. Declare testbench variables  
    reg [7:0] a;  
    reg [7:0] b;  
    reg ci;  
    wire [7:0] s;  
    wire co, os;
    integer i;  

    // 2. Instantiate the design and connect to testbench variables  
    adder_8 csa0 (s, co, os, a, b, ci); 

    // 3. Dumpfile for EPWave viewing
    initial begin
        $dumpfile("waveform.vcd"); // Name of the VCD file
        $dumpvars(0, test_bench);  // Dump everything in this module
    end

    // 4. Provide stimulus to test the design  
    initial begin  
        a <= 0;  
        b <= 4;  
        ci <= 0;    

        // Use a for loop to apply random values to the input  
        for (i = 0; i < 5; i = i+1) begin  
            #10 a <= $random;  
                b <= $random;  
                ci <= $random;  
        end  

        #10;
        a <= 8'hF6;
        b <= 8'h0A; 
        ci <= 0;

        #10 $finish; // End simulation after the test
    end  
endmodule
