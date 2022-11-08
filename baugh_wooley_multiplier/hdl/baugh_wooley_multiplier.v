module baugh_wooley_multiplier (
	input  [3:0] x,
	input  [3:0] y,
	output [7:0] z
);

	wire carry_col_1      ;
	wire carry_col_2 [1:0];
	wire carry_col_3 [2:0];
	wire carry_col_4 [2:0];
	wire carry_col_5 [1:0];
	wire carry_col_6      ;

	wire s_row_1 [2:0]    ;
	wire s_row_2 [2:0]    ;

	assign z[0] = x[0] & y[0];

	full_adder fa1(
		.c_in  (1'b0       ),
		.a     (x[1] & y[0]),
		.b     (x[0] & y[1]),
		.s     (z[1]       ),
		.c_out (carry_col_1)
	);

	full_adder fa2(
		.c_in  (carry_col_1   ),
		.a     (x[1] & y[1]   ),
		.b     (x[2] & y[0]   ),
		.s     (s_row_1[0]    ),
		.c_out (carry_col_2[0])
	);

	full_adder fa3(
		.c_in  (1'b0          ),
		.a     (x[0] & y[2]   ),
		.b     (s_row_1[0]    ),
		.s     (z[2]          ),
		.c_out (carry_col_2[1])
	);

	full_adder fa4(
		.c_in  (carry_col_2[0]),
		.a     (x[2] & y[1]   ),
		.b     (~(x[3] & y[0])),
		.s     (s_row_1[1]    ),
		.c_out (carry_col_3[0])
	);

	full_adder fa5(
		.c_in  (carry_col_2[1]),
		.a     (s_row_1[1]    ),
		.b     (x[1] & y[2]   ),
		.s     (s_row_2[0]    ),
		.c_out (carry_col_3[1])
	);

	full_adder fa6(
		.c_in  (1'b0          ),
		.a     (s_row_2[0]    ),
		.b     (~(x[0] & y[3])),
		.s     (z[3]          ),
		.c_out (carry_col_3[2])
	);

	full_adder fa7(
		.c_in  (carry_col_3[0]),
		.a     (1'b1          ),
		.b     (~(x[3] & y[1])),
		.s     (s_row_1[2]    ),
		.c_out (carry_col_4[0])
	);
	
	full_adder fa8(
		.c_in  (carry_col_3[1]),
		.a     (s_row_1[2]    ),
		.b     (x[2] & y[2]   ),
		.s     (s_row_2[1]    ),
		.c_out (carry_col_4[1])
	);

	full_adder fa9(
		.c_in  (carry_col_3[2]),
		.a     (s_row_2[1]    ),
		.b     (~(x[1] & y[3])),
		.s     (z[4]          ),
		.c_out (carry_col_4[2])
	);

	full_adder fa10(
		.c_in  (carry_col_4[0]),
		.a     (carry_col_4[1]),
		.b     (~(x[3] & y[2])),
		.s     (s_row_2[2]    ),
		.c_out (carry_col_5[0])
	);

	full_adder fa11(
		.c_in  (carry_col_4[2]),
		.a     (s_row_2[2]    ),
		.b     (~(x[2] & y[3])),
		.s     (z[5]          ),
		.c_out (carry_col_5[1])
	);

	full_adder fa12(
		.c_in  (carry_col_5[0]),
		.a     (carry_col_5[1]),
		.b     (x[3] & y[3]   ),
		.s     (z[6]          ),
		.c_out (carry_col_6   )
	);
	full_adder fa13(
		.c_in  (1'b0          ),
		.a     (carry_col_6   ),
		.b     (1'b1          ),
		.s     (z[7]          ),
		.c_out (              )
	);
endmodule