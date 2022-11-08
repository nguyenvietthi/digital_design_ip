`timescale 1ns/1ps

module full_adder_n_bit_tb ();
  reg             c_in ;
  reg  [16 - 1:0] a    ;
  reg  [16 - 1:0] b    ;
  wire [16 - 1:0] s    ;
  wire            c_out;

  full_adder_n_bit #(.N(16)) full_adder_n_bit_ins(
    .c_in  (c_in ),
    .a     (a    ),
    .b     (b    ),
    .s     (s    ),
    .c_out (c_out)
  );


  initial begin 
    repeat(100000) begin 
      c_in = $random();
      a    = $random();
      b    = $random();
      #10;
    end
    $finish;
  end

  always @(a, b, c_in) begin 
    if ({c_out, s} == a + b + c_in) begin 
      $display("PASS at %t: a = %d, b = %d, c_in = %d", $realtime(), a, b, c_in);
    end 
    else begin 
      $display("ERROR at %t: a = %d, b = %d, c_in = %d", $realtime(), a, b, c_in);
    end
  end
  
endmodule