module apb_mem (
    input  logic [15:0] PAddr,
    input  logic [31:0] PWData,
    input  logic        PWrite,
    input  logic        PSel,
    input  logic        PEnable,
    output logic [31:0] PRData,
    input  logic        Rst,
    input  logic        clk
);

  // Simple memory 256 x 32-bit
  logic [31:0] mem [0:255];

  // Read logic (combinational)
  always_comb begin
    if (PSel && !PWrite)
      PRData = mem[PAddr];
    else
      PRData = '0;
  end

  // Write logic (synchronous)
  always_ff @(posedge clk or negedge Rst) begin
    if (!Rst) begin
      integer i;
      for (i = 0; i < 256; i++)
        mem[i] <= 32'h0;
    end else begin
      if (PSel && PEnable && PWrite) begin
        mem[PAddr] <= PWData;
      end
    end
  end

endmodule
