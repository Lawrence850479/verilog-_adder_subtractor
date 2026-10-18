`timescale 1ns/1ps
`include "four_bit_full_adder.v"

module tb_four_bit_full_adder();

reg[3:0] tb_a, tb_b;
reg tb_cin;
wire [3:0] tb_sum;
wire tb_cout;

four_bit_full_adder dut (.a(tb_a), .b(tb_b), .cin(tb_cin), .sum(tb_sum), .cout(tb_cout));

initial begin 

    $monitor("%t,| A = %b, B = %b, Cin = %b, |, SUM = %b, Cout = %b", $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);
    tb_a = 4'b0101; tb_b = 4'b0011; tb_cin = 0; #10;
    tb_a = 4'b1111; tb_b = 4'b0001; tb_cin = 0; #10;
    tb_a = 4'b0010; tb_b = 4'b0100; tb_cin = 0; #10;
    $finish;
end
endmodule 
