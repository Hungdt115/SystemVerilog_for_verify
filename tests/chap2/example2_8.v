module example2_8;

  // Declare arrays at module scope
  bit [31:0] src [0:4];
  bit [31:0] dst [0:4];

  // Initialize source array
  initial begin
    foreach (src[i]) begin
      src[i] = i;
    end
  end

  // Compute destination array
  initial begin
    foreach (dst[j]) begin
      dst[j] = src[j] * 2;  // dst doubles src values
    end
  end

  // Display results
  initial begin
    #1;
    foreach (src[i]) begin
      $display("src[%0d] = %0d, dst[%0d] = %0d",
               i, src[i], i, dst[i]);
    end
    #1 $finish;
  end

  // Dump waveform
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end

endmodule
