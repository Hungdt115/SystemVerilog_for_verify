module my_dff (
  output reg  q,
  input  wire d, 
  input  wire clk,
  input  wire rst_l 
);

always @(posedge clk or negedge rst_l) begin
  if(!rst_l) begin
    q <= 1'b0;
  end else begin
    q <= d;
  end
end

endmodule
