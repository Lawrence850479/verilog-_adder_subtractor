`timescale 1ns/1ps
`include "full_adder.v"

module tb_full_adder();

reg tb_a, tb_b, tb_cin;
wire tb_sum, tb_cout;

full_adder dut (.a(tb_a), .b(tb_b), .cin(tb_cin), .sum(tb_sum), .cout(tb_cout));

initial begin 
    $monitor("%t, %b, %b, %b, | %b, %b", $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);
    tb_a = 0; tb_b = 0; tb_cin = 0; #10
    tb_a = 0; tb_b = 0; tb_cin = 1; #10
    tb_a = 0; tb_b = 1; tb_cin = 0; #10
    tb_a = 0; tb_b = 1; tb_cin = 1; #10
    tb_a = 1; tb_b = 0; tb_cin = 0; #10
    tb_a = 1; tb_b = 0; tb_cin = 1; #10
    tb_a = 1; tb_b = 1; tb_cin = 0; #10
    tb_a = 1; tb_b = 1; tb_cin = 1; #10
    $finish;
end

endmodule 