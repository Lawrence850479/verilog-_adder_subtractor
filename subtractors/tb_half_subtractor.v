`timescale 1ns/1ps
`include "half_subtractor.v"

module tb_half_subtractor();

reg tb_a, tb_b;
wire tb_diff, tb_bout;

half_subtractor dut(.a(tb_a), .b(tb_b), .diff(tb_diff), .bout(tb_bout));

initial begin 

    $monitor("%t, %b, %b,| %b, %b", $time, tb_a, tb_b, tb_diff, tb_bout);
    tb_a = 0; tb_b = 0; #10;
    tb_a = 0; tb_b = 1; #10;
    tb_a = 1; tb_b = 0; #10;
    tb_a = 1; tb_b = 1;  #10;
    $finish;
end
endmodule 