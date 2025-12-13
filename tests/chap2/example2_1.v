module example2_1(input logic rst_h);
  parameter CYCLE = 20;
  logic q, q_l, d, clk, rst_l; 
  initial begin
    clk = 0;                  // Procedural assignment
    forever #(CYCLE/2) clk = ~clk; 
  end
  assign rst_l = ~rst_h;       // Continuous assignment 
  not n1(q_l, q);              // q_l is driven by gate
  my_dff d1(q, d, clk, rst_l); // d is driven by module
  
  initial begin
    repeat(100) @(posedge clk);
    $finish;
  end
    
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end
 
endmodule
