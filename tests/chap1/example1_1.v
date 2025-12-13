//=============================================================================
// 
//=============================================================================
module example1_1;
//-----------------------------------------------------------------------------
  // Testbench signals
  logic [15:0] PAddr;
  logic [31:0] PWData;
  logic        PWrite;
  logic        PSel;
  logic        PEnable;
  logic [31:0] PRData;
  logic        Rst;
  logic        clk;
//-----------------------------------------------------------------------------
  // DUT instance 
  apb_mem dut (
    .PAddr (PAddr),
    .PWData(PWData),
    .PWrite(PWrite),
    .PSel  (PSel),
    .PEnable(PEnable),
    .PRData(PRData),
    .Rst   (Rst),
    .clk   (clk)
  );
//-----------------------------------------------------------------------------
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
//-----------------------------------------------------------------------------
  initial begin
    // Default values
    PAddr   = 0;
    PWData  = 0;
    PWrite  = 0;
    PSel    = 0;
    PEnable = 0;

    // Reset sequence
    Rst = 0;
    #100;
    Rst = 1;

    // Drive APB bus
    @(posedge clk);
      PAddr  <= 16'h50;
      PWData <= 32'h50;
      PWrite <= 1'b1;
      PSel   <= 1'b1;

    // APB enable phase
    @(posedge clk)
      PEnable <= 1'b1;
    @(posedge clk)
      PEnable <= 1'b0;

    // Check the result
    #10;
    if (dut.mem[16'h50] == 32'h50)
      $display("Success");
    else
      $display("Error, wrong value in memory");

    $finish;
  end
//-----------------------------------------------------------------------------
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end

endmodule
//=============================================================================