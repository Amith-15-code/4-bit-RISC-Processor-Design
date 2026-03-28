module tb;

reg clk = 0;
reg reset = 1;

risc_processor uut(clk, reset);

// Clock
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");   // REQUIRED for waveform
    $dumpvars(0, tb);        // Dump all signals

    #10 reset = 0;
    #100 $finish;
end

endmodule
