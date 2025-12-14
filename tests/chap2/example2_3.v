module example2_3;

  logic [31:0] iport;    

  initial begin
    #10 iport = 32'h0000_xxxx;
    repeat(100) void'(std::randomize(iport)); 
  end
  
  initial begin
    if ($isunknown(iport))
      $display("@%0d: 4-state value detected on input port",
               $time, iport);
  end
  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end
 
endmodule
