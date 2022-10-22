`include "numero.v"
 module testbench();
    reg reset, ready, a, b, c, d;
    wire out_v, out_w, out_x, out_y, out_z;
    
    numero U1 (.reset(reset), .ready(ready), .a(a), .b(b), .c(c), .d(d), .out_v(out_v), .out_w(out_w), .out_x(out_x), .out_y(out_y),
    .out_z(out_z));
    
    initial begin
        $dumpfile("numero.vcd");
        $dumpvars(0, testbench);
        $display("ENTRADA  RESET READY   SAÍDA");
        $monitor("%b%b%b%b     %b      %b      %b%b%b%b%b", a, b, c, d, reset, ready, out_v, out_w, out_x, out_y, out_z);
    end
    
    initial begin
        reset = 1;
    #1; reset = 0;
    #1; ready = 0; a = 0; b = 0; c = 0; d = 0; ready = 1;
    #1; ready = 0; a = 0; b = 0; c = 0; d = 1; ready = 1;
    #1; ready = 0; a = 0; b = 0; c = 1; d = 0; ready = 1;
    #1; ready = 0; a = 0; b = 0; c = 1; d = 1; ready = 1;
    #1; ready = 0; a = 0; b = 1; c = 0; d = 0; ready = 1;
    #1; ready = 0; a = 0; b = 1; c = 0; d = 1; ready = 1;
    #1; ready = 0; a = 0; b = 1; c = 1; d = 0; ready = 1;
    #1; ready = 0; a = 0; b = 1; c = 1; d = 1; ready = 1;
    #1; ready = 0; a = 1; b = 0; c = 0; d = 0; ready = 1;
    #1; ready = 0; a = 1; b = 0; c = 0; d = 1; ready = 1;
    #1 $finish;
    end
endmodule
