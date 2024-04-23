module Timer(
  input wire clk,
  input wire rst,
  output reg flag,
  output reg [9:0] led
);

  reg [31:0] count = 0;

  always @(posedge clk or negedge rst) begin
    if (~rst) begin
      count <= 0;
      flag <= 0;
      led <= 0;
    end else begin
      count <= count + 1; // Increment

      if (count == 32'd1_500_000_000) begin // 30 seconds
        // Set the flag when 60 seconds have elapsed
        flag <= 1;
      end
     
      if (count == 32'd999_999_950) begin // The last 10 seconds
        // Toggle all 10 LEDs during the last seconds
        led <= ~led;
      end
    end
  end

endmodule