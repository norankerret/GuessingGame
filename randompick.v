module randompick(
  input clk,
  output reg [3:0] num
  //4-bit
);

reg [3:0] lfsr = 4'b1010; // Non-zero initial value

always @(negedge clk) begin
  lfsr = {lfsr[2:0], ~(lfsr[3] ^ lfsr[2])}; // LFSR update

  // Limit the output to the range of 0 to 15
  if (lfsr >= 16) begin
    num <= 4'b0101;
  end else begin
    num <= lfsr[3:0];
  end
end

endmodule