`timescale 1ns/1ps

module gray_counter_tb ();
  parameter N = 4;
  reg        clk       ;  
  reg        enable    ; 
  reg        reset     ;
  wire [N - 1:0] gray_count;

  gray_counter #(.N(N)) inst(
    .clk        (clk       ),
    .enable     (enable    ),
    .reset      (reset     ),
    .gray_count (gray_count)
  );

  always #10 clk = ~clk;


  initial begin 
    clk = 0;
    reset = 0;
    enable = 0;
    @(negedge clk);
    reset = 1; 
    @(negedge clk);
    enable = 1;


    repeat(30) @(negedge clk);
    $finish;
  end
  
endmodule