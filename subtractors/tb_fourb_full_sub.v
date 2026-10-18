`timescale 1ns/1ps
`include "fourb_full_sub.v"

module tb_fourb_full_sub();

   reg [3:0] tb_a, tb_b;
   reg tb_bin;
   wire [3:0] tb_diff; 
   wire tb_bout;



fourb_full_sub dut (.a(tb_a), .b(tb_b), .bin(tb_bin), .diff(tb_diff), .bout(tb_bout));

initial begin 
    $monitor("%t, A = %b, B = %b, bin = %b,| diff = %b, bout = %b", $time, tb_a, tb_b, tb_bin, tb_diff, tb_bout);

// 7 - 2 = 5
tb_a = 4'b0111; tb_b = 4'b0010; tb_bin = 0; #10;
// 8 - 1 = 7 
tb_a = 4'b1000; tb_b = 4'b0001; tb_bin = 0; #10;
// 6 - 7 = -1
tb_a = 4'b0110; tb_b = 4'b0111; tb_bin = 0; #10;
// 15 - 8 = 7
tb_a = 4'b1111; tb_b = 4'b1000; tb_bin = 0; #10;
// 8 - 3 - 1 = 4
tb_a = 4'b1000; tb_b = 4'b0011; tb_bin = 1; #10;
// 0 - 1 = -1
tb_a = 4'b0000; tb_b = 4'b0001; tb_bin = 0; #10;    /
   $finish;
end

endmodule 