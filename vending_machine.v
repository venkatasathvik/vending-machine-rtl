`timescale 1ns / 1ps

module vending_machine (
    input wire clk,          // Clock signal
    input wire rst,          // Active-high reset
    input wire in_5,         // Sensor: 5 Rs coin inserted
    input wire in_10,        // Sensor: 10 Rs coin inserted
    output reg dispense      // Output: 1 = Dispense product
);

    // FSM State Encoding (2 bits for 4 states)
    parameter S_0  = 2'b00;  // 0 Rs accumulated
    parameter S_5  = 2'b01;  // 5 Rs accumulated
    parameter S_10 = 2'b10;  // 10 Rs accumulated
    parameter S_15 = 2'b11;  // 15 Rs accumulated (Dispense state)

    reg [1:0] current_state, next_state;

    // Sequential Logic: State Memory
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S_0;
        else
            current_state <= next_state;
    end

    // Combinational Logic: Next State and Output Logic
    always @(*) begin
        // Default assignments to prevent latches
        next_state = current_state;
        dispense = 1'b0;

        case (current_state)
            S_0: begin
                if (in_5)       next_state = S_5;
                else if (in_10) next_state = S_10;
            end

            S_5: begin
                if (in_5)       next_state = S_10;
                else if (in_10) next_state = S_15;
            end

            S_10: begin
                if (in_5 || in_10) next_state = S_15; 
            end

            S_15: begin
                dispense = 1'b1;   // Trigger dispense mechanism
                next_state = S_0;  // Auto-reset to initial state
            end
            
            default: next_state = S_0;
        endcase
    end
endmodule