`timescale 1ns / 1ps

module tb_vending_machine;

    // Inputs to the Unit Under Test (UUT)
    reg clk;
    reg rst;
    reg in_5;
    reg in_10;

    // Outputs from the UUT
    wire dispense;

    // Instantiate the Unit Under Test
    vending_machine uut (
        .clk(clk),
        .rst(rst),
        .in_5(in_5),
        .in_10(in_10),
        .dispense(dispense)
    );

    // Clock Generation (10ns period / 100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        in_5 = 0;
        in_10 = 0;

        // Wait for global reset
        #100;
        rst = 0;

        // --------------------------------------------------
        // TEST CASE 1: Insert 5 Rs, then 10 Rs (Total 15)
        // --------------------------------------------------
        #20 in_5 = 1;  // Insert 5
        #10 in_5 = 0;
        
        #20 in_10 = 1; // Insert 10
        #10 in_10 = 0;
        
        #30; // Wait to observe dispense signal

        // --------------------------------------------------
        // TEST CASE 2: Insert 5 Rs three times (Total 15)
        // --------------------------------------------------
        #20 in_5 = 1; // 1st 5 Rs
        #10 in_5 = 0;
        
        #20 in_5 = 1; // 2nd 5 Rs
        #10 in_5 = 0;
        
        #20 in_5 = 1; // 3rd 5 Rs
        #10 in_5 = 0;
        
        #30; // Wait to observe dispense signal

        // --------------------------------------------------
        // TEST CASE 3: Insert 10 Rs, then 10 Rs (Overpay)
        // --------------------------------------------------
        #20 in_10 = 1; // 1st 10 Rs
        #10 in_10 = 0;
        
        #20 in_10 = 1; // 2nd 10 Rs
        #10 in_10 = 0;
        
        #30;

        $stop; // End simulation
    end
      
endmodule