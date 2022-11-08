module full_adder (
  input  c_in ,
  input  a    ,
  input  b    ,
  output s    ,
  output c_out
);

  assign s = a ^ b ^ c_in;
  assign c_out = a & b | (a ^ b) & c_in;

endmodule