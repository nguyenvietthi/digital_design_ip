module full_adder_n_bit #(parameter N = 4) (
  input            c_in ,
  input  [N - 1:0] a    ,
  input  [N - 1:0] b    ,
  output [N - 1:0] s    ,
  output           c_out 
);
  
  wire  [N:0] carry;
  generate
    genvar i;
    for (i = 0; i < N; i = i+ 1) begin
      full_adder inst(
        .c_in  (carry[i]  ),
        .a     (a[i]      ),
        .b     (b[i]      ),
        .s     (s[i]      ),
        .c_out (carry[i+1])
      );
    end
  endgenerate

  assign c_out = carry[N];
  assign carry[0] = c_in   ;

endmodule