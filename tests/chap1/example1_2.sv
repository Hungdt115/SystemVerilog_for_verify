//=============================================================================
// APB low level Verilog test apb write
//=============================================================================
module example1_2;
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
  // Task drive apb write
  task write(reg [15:0] addr, reg [31:0] data);
    // Drive Control bus 
    @(posedge clk)
    PAddr  <= addr; 
    PWData <= data; 
    PWrite <= 1'b1;
    PSel   <= 1'b1;
    // Toggle Penable 
    @(posedge clk)
      PEnable <= 1'b1; 
    @(posedge clk)
      PEnable <= 1'b0; 
  endtask

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

    write(16’h50, 32’h50);   // Write data into memory
    // Check the result
    if (top.mem.memory[16’h50] == 32’h50)
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