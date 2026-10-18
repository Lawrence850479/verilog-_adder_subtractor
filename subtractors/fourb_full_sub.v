`timescale 1ns/1ps
`include "full_sub.v"

module fourb_full_sub
(
   input [3:0] a, b, 
   input bin, 
   output [3:0] diff, 
   output bout
);

wire b1, b2, b3;
//FS0
full_sub FS0 (a[0], b[0], bin, diff[0], b1);
//FS1
full_sub FS1 (a[1], b[1], b1, diff[1], b2);
//FS2
full_sub FS2 (a[2], b[2], b2, diff[2], b3);
//FS3
full_sub FS3 (a[3], b[3], b3, diff[3], bout);

endmodule 