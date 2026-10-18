`timescale 1ns/1ps
`include "half_adder.v"

module tb_half_adder();

reg tb_a, tb_b;
wire tb_sum, tb_c_out;

half_adder dut(.a(tb_a), .b(tb_b), .sum(tb_sum), .c_out(tb_c_out));

initial begin 

    $monitor("%t, %b, %b,| %b, %b", $time, tb_a, tb_b, tb_sum, tb_c_out);
    tb_a = 0; tb_b = 0; #10;
    tb_a = 0; tb_b = 1; #10;
    tb_a = 1; tb_b = 0; #10;
    tb_a = 1; tb_b = 1;  #10;
    $finish;
end
endmodule 