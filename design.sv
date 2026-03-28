module risc_processor(
    input clk,
    input reset
);

// PROGRAM COUNTER
reg [3:0] pc;
always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 0;
    else
        pc <= pc + 1;
end

// INSTRUCTION MEMORY
reg [7:0] instr_mem [15:0];
wire [7:0] instruction;

assign instruction = instr_mem[pc];

// Decode
wire [3:0] opcode = instruction[7:4];
wire [1:0] r1 = instruction[3:2];
wire [1:0] r2 = instruction[1:0];

// REGISTER FILE
reg [3:0] reg_file [3:0];
wire [3:0] A = reg_file[r1];
wire [3:0] B = reg_file[r2];

// CONTROL
reg reg_write, mem_read, mem_write;
reg [2:0] alu_op;

always @(*) begin
    reg_write = 0;
    mem_read = 0;
    mem_write = 0;
    alu_op = 0;

    case(opcode)
        4'b0000: begin reg_write=1; alu_op=3'b000; end // ADD
        4'b0001: begin reg_write=1; alu_op=3'b001; end // SUB
        4'b0010: begin reg_write=1; alu_op=3'b010; end // AND
        4'b0011: begin reg_write=1; alu_op=3'b011; end // OR
        4'b0100: begin reg_write=1; mem_read=1; end   // LOAD
        4'b0101: begin mem_write=1; end              // STORE
    endcase
end

// ALU
reg [3:0] alu_result;
always @(*) begin
    case(alu_op)
        3'b000: alu_result = A + B;
        3'b001: alu_result = A - B;
        3'b010: alu_result = A & B;
        3'b011: alu_result = A | B;
        default: alu_result = 0;
    endcase
end

// DATA MEMORY
reg [3:0] data_mem [15:0];

// EXECUTE
always @(posedge clk) begin
    if (reg_write && !mem_read)
        reg_file[r1] <= alu_result;

    if (mem_read)
        reg_file[r1] <= data_mem[r2];

    if (mem_write)
        data_mem[r2] <= reg_file[r1];
end

// INIT
initial begin
    reg_file[0]=2; reg_file[1]=3; reg_file[2]=1; reg_file[3]=0;

    instr_mem[0]=8'b00000001;
    instr_mem[1]=8'b00010110;
    instr_mem[2]=8'b00101001;
    instr_mem[3]=8'b00111100;
    instr_mem[4]=8'b01010011;
    instr_mem[5]=8'b01000111;
end

endmodule
