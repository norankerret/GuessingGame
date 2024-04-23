module SlowClockDivider(cin,cout);
 // Based on (corrected) code from fpga4student.com
 // cin is the input clock; if from the DE10-Lite,
 // the input clock will be at 50 MHz
 // The clock divider toggles cout every 25 million
 // cycles of the input clock
 input cin;
 output reg cout;
 reg[31:0] count;


 //parameter D = 32'd25_000_000; // a second
 parameter D = 32'd1_500_000_000; // 30 seconds
 always @(posedge cin)
 begin
 count <= count + 32'd1;
 if (count >= (D-1)) begin
 cout <= ~cout;
 count <= 32'd0;
 end
 end
endmodule