module exdcr(
    input x, y, bin
    output diff, bout
);
    wire t1, t2, t3;
    supply1 vdd;
    supply0 gnd;
    pmos q1 (t1, vdd, x);
    nmos q2 (t1, gnd, x);
    pmos q3 (t2, x, y);
    nmos q4 (t2, t1, y);
    pmos q5 (t3, vdd, t2);
    nmos q6 (t3, gnd, t2);
    pmos q7 (diff, t2, bin);
    nmos q8 (diff, t3, bin);
    pmos q9 (bout, y, t2);
    nmos q10 (bout, bin, t2);
endmodule

module axscr_1(
    input x, y, bin
    output diff, bout
);
    wire t1, t2;
    supply1 vdd;
    supply0 gnd;
    pmos q1 (t1, vdd, x);
    nmos q2 (t1, gnd, x);
    pmos q3 (t2, x, y);
    nmos q4 (t2, t1, y);
    pmos q5 (bout, bin, t2);
    nmos q6 (bout, y, t2);
    pmos q7 (diff, bin, t2);
    nmos q8 (diff, t2, t2);
endmodule

module axscr_2(
    input x, y, bin
    output diff, bout
);
    wire t1, t2, t3;
    supply1 vdd;
    supply0 gnd;
    pmos q1 (t1, vdd, x);
    nmos q2 (t1, gnd, x);
    pmos q3 (t2, x, y);
    nmos q4 (t2, t1, y);
    pmos q5 (t3, vdd, t2);
    nmos q6 (t3, gnd, t2);
    pmos q7 (diff, t2, bin);
    nmos q8 (diff, t3, bin);
    assign bout = diff;
endmodule

module axscr_3(
    input x, y, bin
    output diff, bout
);
    wire t1, t2;
    supply1 vdd;
    supply0 gnd;
    pmos q1 (t1, vdd, x);
    nmos q2 (t1, gnd, x);
    pmos q3 (t2, x, y);
    nmos q4 (t2, t1, y);
    pmos q5 (diff, y, t2);
    nmos q6 (diff, bin, t2);
endmodule

// exact, axscr_1

module exact (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    exdcr mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    exdcr mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    exdcr mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    exdcr mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    exdcr mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    exdcr mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_1 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    exdcr mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    exdcr mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    exdcr mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    exdcr mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    exdcr mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_2 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    exdcr mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    exdcr mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    exdcr mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    exdcr mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_3 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    axscr_1 mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    exdcr mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    exdcr mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    exdcr mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_4 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    axscr_1 mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    axscr_1 mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    exdcr mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    exdcr mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_5 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    axscr_1 mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    axscr_1 mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    axscr_1 mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    exdcr mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_6 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    axscr_1 mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    axscr_1 mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    axscr_1 mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    axscr_1 mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    exdcr mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_7 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    axscr_1 mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    axscr_1 mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    axscr_1 mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    axscr_1 mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    axscr_1 mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    exdcr mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module app_8 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    wire d1, d2, d3, d4, d5, d6, d7, d8;
    axscr_1 mut1 (.x(x[0]), .y(y[0]), .bin(bin), .bout(i1), .diff(d1));
    axscr_1 mut2 (.x(x[1]), .y(y[1]), .bin(i1), .bout(i2), .diff(d2));
    axscr_1 mut3 (.x(x[2]), .y(y[2]), .bin(i2), .bout(i3), .diff(d3));
    axscr_1 mut4 (.x(x[3]), .y(y[3]), .bin(i3), .bout(i4), .diff(d4));
    axscr_1 mut5 (.x(x[4]), .y(y[4]), .bin(i4), .bout(i5), .diff(d5));
    axscr_1 mut6 (.x(x[5]), .y(y[5]), .bin(i5), .bout(i6), .diff(d6));
    axscr_1 mut7 (.x(x[6]), .y(y[6]), .bin(i6), .bout(i7), .diff(d7));
    axscr_1 mut8 (.x(x[7]), .y(y[7]), .bin(i7), .bout(i8), .diff(d8));
    assign qs = ~i8 | x[8];
    nmos t1 (rout[0], d1, qs);
    pmos t2 (rout[0], x[0], qs);
    nmos t3 (rout[1], d2, qs);
    pmos t4 (rout[1], x[1], qs);
    nmos t5 (rout[2], d3, qs);
    pmos t6 (rout[2], x[2], qs);
    nmos t7 (rout[3], d4, qs);
    pmos t8 (rout[3], x[3], qs);
    nmos t9 (rout[4], d5, qs);
    pmos t10 (rout[4], x[4], qs);
    nmos t11 (rout[5], d6, qs);
    pmos t12 (rout[5], x[5], qs);
    nmos t13 (rout[6], d7, qs);
    pmos t14 (rout[6], x[6], qs);
    nmos t15 (rout[7], d8, qs);
    pmos t16 (rout[7], x[7], qs);
endmodule

module array(
    input [15:0]x,
    input [7:0]y,
    input bin,
    output [7:0]q,
    output [7:0]r
);
    wire [8:0] rout1;
    exact uut1 (.x(x[15:7]), .y(y), .qs(q[7]), .rout(rout1[8:1]), .bin(bin));
    wire [8:0] rout2;
    assign rout1[0] = x[6];
    exact uut2 (.x(rout1), .y(y), .qs(q[6]), .rout(rout2[8:1]), .bin(bin));
    wire [8:0] rout3;
    assign rout2[0] = x[5];
    exact uut3 (.x(rout2), .y(y), .qs(q[5]), .rout(rout3[8:1]), .bin(bin));
    wire [8:0] rout4;
    assign rout3[0] = x[4];
    exact uut4 (.x(rout3), .y(y), .qs(q[4]), .rout(rout4[8:1]), .bin(bin));
    wire [8:0] rout5;
    assign rout4[0] = x[3];
    exact uut5 (.x(rout4), .y(y), .qs(q[3]), .rout(rout5[8:1]), .bin(bin));
    wire [8:0] rout6;
    assign rout5[0] = x[2];
    exact uut6 (.x(rout5), .y(y), .qs(q[2]), .rout(rout6[8:1]), .bin(bin));
    wire [8:0] rout7;
    assign rout6[0] = x[1];
    exact uut7 (.x(rout6), .y(y), .qs(q[1]), .rout(rout7[8:1]), .bin(bin));
    assign rout7[0] = x[0];
    exact uut8 (.x(rout7), .y(y), .qs(q[0]), .rout(r), .bin(bin));
endmodule
















// module xor_4t(
//     output out,
//     input x, y
// ); // 4 transistor xor gate
//     wire xb;
//     supply0 vss;
//     supply1 vdd;
//     pmos t1 (xb, vdd, x);
//     pmos t2 (xb, vss, x);
//     pmos t3 (out, x, y);
//     nmos t4 (out, xb, y);
// endmodule

// module xnor_4t(
//     output x_nor,
//     input x, y
// ); // 4 transistor xnor gate
//     wire xb;
//     supply1 vdd;
//     supply0 vss;
//     pmos t1 (xb, vdd, x);
//     pmos t2 (x_nor, xb, y);
//     nmos t3 (x_nor, x, y);
//     nmos t4 (x_nor, y, x);
// endmodule

// module xor_3t(
//     output out,
//     input x, y
// ); // 3 transistor xor gate
//     supply0 gnd;
//     pmos t1 (out, y, x);
//     pmos t2 (out, x, y);
//     nmos t3 (out, gnd, x);
// endmodule

// module exsc_4t(
//     input x, y, bin
//     output d, bout
// ); // 4 transistor exsc 
//     wire t1;
//     xnor_4t uut1 (.x(x), .y(y), .x_nor(t1));
//     xnor_4t uut2 (.x(t1), .y(bin), .x_nor(d)));
//     pmos t9 (bout, y, t1);
//     nmos t10 (bout, bin, t1);
// endmodule

// module exsc_3t(
//     input x, y, bin
//     output d, bout
// ); // 3 transistor exsc
//     wire t1;
//     xor_3t uut1 (.x(x), .y(y), .out(t1));
//     xor_3t uut2 (.x(t1), .y(bin), .out(d)));
//     pmos t9 (bout, y, t1);
//     nmos t10 (bout, bin, t1);
// endmodule

// module axsc_1(
//     input x, y, bin
//     output d, bout
// ); // approximation 1
//     wire t1;
//     xor_4t uut1 (.x(x), .y(y), .out(t1));
//     pmos t6 (bout, bin, t1);
//     nmos t5 (bout, y, t1);
//     pmos t8 (d, bin, t1);
//     pmos t7 (d, t1, t1);
// endmodule

// module axsc_2(
//     input x, y, bin
//     output d, bout
// ); // approximation 2
//     wire t1;
//     xnor_4t uut1 (.x(x), .y(y), .x_nor(t1));
//     xnor_4t uut2 (.x(t1), .y(bin), .x_nor(d));
//     assign bout = d;
// endmodule

// module axsc_3(
//     input x, y, bin
//     output d, bout
// ); // approximation 3
//     wire t1;
//     xnor_4t uut1(.x(x), .y(y), .x_nor(t1));
//     pmos q1 (bout, y, t1);
//     nmos q2 (bout, bin, t1);
//     assign d = bout;
// endmodule

// module exdcr(
//     input x, y, bin//, qs
//     output bout, diff//, rout
// );
//     exsc_4t uut1(.x(x), .y(y), .d(diff), .bout(bout), .bin(bin));
//     // nmos t1 (rout, diff, qs);
//     // pmos t2 (rout, x, qs);
// endmodule

// module axscr_1(
//     input x, y, bin//, qs
//     output bout, diff//, rout
// );
//     axsc1(.x(x), .y(y), .d(diff), .bout(bout), .bin(bin));
//     // nmos t1 (rout, diff, qs);
//     // pmos t2 (rout, x, qs);
// endmodule

// module axscr_2(
//     input x, y, bin//, qs
//     output bout, diff//, rout
// );
//     axsc2(.x(x), .y(y), .d(diff), .bout(bout), .bin(bin));
//     // nmos t1 (rout, diff, qs);
//     // pmos t2 (rout, x, qs);
// endmodule

// module axscr_3(
//     input x, y, bin//, qs
//     output bout, diff//, rout
// );
//     axsc3(.x(x), .y(y), .d(diff), .bout(bout), .bin(bin));
//     // nmos t1 (rout, diff, qs);
//     // pmos t2 (rout, x, qs);
// endmodule

