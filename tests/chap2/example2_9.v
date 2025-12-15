module example2_9;

  int md [0:1][0:2] = '{
    '{1, 2, 3},
    '{4, 5, 6}
  };

  initial begin
    $display("Initial value:");
    foreach (md[i,j])
      $display("md[%0d][%0d] = %0d", i, j, md[i][j]);

    $display("New value:");
    md = '{
      '{9, 8, 7},
      '{5, 5, 5}
    };

    foreach (md[i,j])
      $display("md[%0d][%0d] = %0d", i, j, md[i][j]);

    #1 $finish;
  end

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, example2_9);
  end

endmodule
