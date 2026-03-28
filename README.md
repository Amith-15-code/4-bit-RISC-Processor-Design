🔧 4-bit RISC Processor Design (Verilog)
📌 Overview

This project implements a basic 4-bit RISC (Reduced Instruction Set Computer) Processor using Verilog. The processor includes essential components such as an ALU, control unit, register file, and memory to simulate a simple CPU capable of executing instructions.

🎯 Objectives
Design a 4-bit processor architecture
Implement ALU for arithmetic and logic operations
Develop a control unit for instruction decoding
Execute basic instructions like load, store, and arithmetic
Simulate processor behavior using ModelSim / EDA Playground
⚙️ Features
4-bit ALU (ADD, SUB, AND, OR)
Control Unit for opcode decoding
Register File (4 registers)
Instruction Memory (8-bit instructions)
Data Memory for LOAD/STORE operations
Program Counter (PC) for instruction sequencing
🧠 Instruction Set
Opcode	Instruction	Description
0000	ADD	R1 = R1 + R2
0001	SUB	R1 = R1 - R2
0010	AND	Bitwise AND
0011	OR	Bitwise OR
0100	LOAD	Load from memory
0101	STORE	Store to memory
🏗️ Architecture
Program Counter fetches instruction
Instruction Memory provides opcode
Control Unit decodes instruction
ALU performs operation
Register File stores results
Data Memory used for load/store
🧪 Simulation
Tool Used: ModelSim / EDA Playground
Waveforms analyzed using VCD dump
Verified:
Instruction execution cycle-by-cycle
ALU operations
Register updates
Memory read/write
▶️ How to Run
Open EDA Playground
Paste design and testbench files
Select simulator (ModelSim/Questa)
Run simulation
Open EPWave to view waveforms
📁 Project Structure
├── design.v        # Processor implementation
├── testbench.v     # Simulation testbench
├── README.md       # Project documentation
🚀 Future Improvements
Add pipeline architecture
Implement flags (Zero, Carry)
Expand instruction set
FSM-based control unit
Interrupt handling
📚 Learning Outcomes
Understanding of CPU architecture
Verilog HDL design and simulation
Instruction decoding and execution
Digital system design concepts
👨‍💻 Author

Amith A V
