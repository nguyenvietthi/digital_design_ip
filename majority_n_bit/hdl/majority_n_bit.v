module majority_n_bit #(parameter N = 4) (
	input [N - 1:0] in ,
	output          out
);
	parameter AVERAGE = N / 2;

	wire [$clog2(N):0] sum [N - 1:0] ;

	assign sum[0] = in[0];

	generate
		genvar i;
		for (i = 1; i < N; i = i + 1) begin
			assign sum[i] = in[i] + sum[i - 1]; 
		end
	endgenerate

	assign out = sum[N - 1] < AVERAGE ? 1'b0 : 1'b1;

endmodule