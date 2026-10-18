`timescale 1ns/1ps
`include "full_sub.v"

module tb_full_sub();

reg tb_a, tb_b, tb_bin;
wire tb_diff, tb_bout;

full_sub dut (.a(tb_a), .b(tb_b), .bin(tb_bin), .diff(tb_diff), .bout(tb_bout));

initial begin 
    $monitor("%t, %b, %b, %b, | %b, %b", $time, tb_a, tb_b, tb_bin, tb_diff, tb_bout);
    tb_a = 0; tb_b = 0; tb_bin = 0; #10
    tb_a = 0; tb_b = 0; tb_bin = 1; #10
    tb_a = 0; tb_b = 1; tb_bin = 0; #10
    tb_a = 0; tb_b = 1; tb_bin = 1; #10
    tb_a = 1; tb_b = 0; tb_bin = 0; #10
    tb_a = 1; tb_b = 0; tb_bin = 1; #10
    tb_a = 1; tb_b = 1; tb_bin = 0; #10
    tb_a = 1; tb_b = 1; tb_bin = 1; #10
    $finish;
end

endmodule 