module exdcr(
    output bout, diff,
    input x, y, bin
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

// module axscr_3(
//     input x, y, bin
//     output diff, bout
// );
//     wire t1, t2;
//     supply1 vdd;
//     supply0 gnd;
//     pmos q1 (t1, vdd, x);
//     nmos q2 (t1, gnd, x);
//     pmos q3 (t2, x, y);
//     nmos q4 (t2, t1, y);
//     pmos q5 (diff, y, t2);
//     nmos q6 (diff, bin, t2);
// endmodule

