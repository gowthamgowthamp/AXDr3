// `include "axscr_1_exact.v"
`include "cell.v"
// `include "axscr1-app-2.v"
// `include "axscr1-app-4.v"
// `include "axscr1-app-6.v"
// `include "axscr1-app-8.v"
// `include "axscr1-app-10.v"
// `include "axscr1-app-12.v"
// `include "axscr1-app-14.v"
`timescale 1ns/1ns
 module general_tb ;
     reg [15:0]x;
     reg [7:0]y;
     reg bin;
     wire [7:0]q;
     wire [7:0]r;
     array error (.x(x), .y(y), .bin(bin), .q(q), .r(r));
     initial begin
         $dumpfile("general_tb.vcd");
         $dumpvars(0, general_tb);
         bin = 0;
         x = 8; y = 4;
         #20;
         x = 7; y = 3;
         #20;
         x = 5; y = 5;
         #20;
         x = 16; y = 4;
         #20
         x = 20; y = 5;
         #20;
         x = 15; y = 3;
         #20;
         x = 12; y = 5;
         #20;
         x = 40; y = 13;
         #20;
         x = 17; y = 5;
         #20;
         x = 199; y = 7;
         #20;
         x = 127; y = 5;
         #20;
     end
 endmodule


module general_tb;
    reg x, y, bin;
    wire diff, bout;
    exdcr uut1 (.x(x), .y(y), .bin(bin), .bout(bout), .diff(diff));
    initial begin
        $dumpfile("general_tb.vcd");
        $dumpvars(0, general_tb);
        x = 0; y = 0; bin = 0; #20;
        x = 0; y = 0; bin = 1; #20;
        x = 0; y = 1; bin = 0; #20;
        x = 0; y = 1; bin = 1; #20;
        x = 1; y = 0; bin = 0; #20;
        x = 1; y = 0; bin = 1; #20;
        x = 1; y = 1; bin = 0; #20;
        x = 1; y = 1; bin = 1; #20;
    end
endmodule