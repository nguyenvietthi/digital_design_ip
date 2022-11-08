`timescale 1ns/1ps

module baugh_wooley_multiplier_tb();

  reg  [3:0] x;
  reg  [3:0] y;
  wire [7:0] z;
  
  baugh_wooley_multiplier baugh_wooley_multiplier_inst(
    .x (x),
    .y (y),
    .z (z)
  );


  initial begin 
    repeat(100000) begin 
      x = $random();
      y = $random();
      #10;
    end
    $finish;
  end

//==================== Check function ====================================

  reg [7:0] _z;

  always @(x, y) begin
    _z = $signed(x) * $signed(y);
    if (z != _z) begin 
      $display("ERROR @%d", $realtime());
    end 
    else begin 
      $display("PASS");
    end
  end
endmodule