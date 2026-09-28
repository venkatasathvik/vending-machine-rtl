# Automated Vending Machine Controller

A digital transaction controller modeled for an automated vending machine. The design utilizes synchronous sequential logic to process coin dispensing and inventory tracking seamlessly.

###  Tools & Technologies
* **Hardware Description Language:** Verilog HDL
* **Synthesis & Simulation:** Xilinx Vivado
* **Circuit Modeling:** NI Multisim

###  System Architecture
* **Modular RTL Design:** Architected with a distinct separation between the datapath and control unit to reduce resource consumption and improve code reusability.
* **State Transition Logic:** Driven by comprehensive state transition tables mapping every possible user input, coin denomination, and inventory level.
* **Circuit Implementation:** Logic gate mapping and circuit-level implementation modeled and verified using Multisim.

###  Verification & Testing
* **Directed Test Vectors:** Conducted functional verification covering boundary transaction failures (e.g., insufficient funds) and asynchronous resets.
* **Waveform Analysis:** *(Note: Insert a screenshot of your Vivado timing waveforms here)*
* **Circuit Schematic:** *(Note: Insert a screenshot of your Multisim circuit here)*
