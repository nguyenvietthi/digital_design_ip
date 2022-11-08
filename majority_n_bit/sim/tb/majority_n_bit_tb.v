`timescale 1ns/1ps

module majority_n_bit_tb ();

  parameter N = 16;
  parameter AVERAGE = N / 2;

  reg [N - 1:0] in ;
  wire          out;
  
  majority_n_bit #(.N(N)) majority_n_bit_inst(
    .in  (in ),
    .out (out)
  );


  initial begin 
    repeat(100000) begin 
      in = $random();
      #10;
    end
    $finish;
  end

//==================== Check function ======================================

  integer bit_sum;
  integer i;
  reg check;

  always @(in) begin
    bit_sum = 0;
    for (i = 0; i < N; i = i + 1) begin
      bit_sum = bit_sum + in[i];
    end

    check = bit_sum < AVERAGE ? 0 : 1;
  end

  always @(in) begin 
    if (check != out) begin 
      $display("ERROR @%d", $realtime());
    end 
    else begin 
      $display("PASS");
    end
  end
  
endmodule