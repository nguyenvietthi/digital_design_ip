module carry_look_ahead_adder_4_bit_tb ();
  wire [3:0]  sum  ;
  wire        c_out;
  reg  [3:0]  a    ;
  reg  [3:0]  b    ;
  reg         c_in ;

  carry_look_ahead_adder_4_bit ins (
    .sum   (sum  ),
    .c_out (c_out),
    .a     (a    ),
    .b     (b    ),
    .c_in  (c_in )
  );

  initial begin 
    repeat(30) begin 
      {a, b, c_in} = $random();
      #10;
    end
    $finish;
  end
endmodule