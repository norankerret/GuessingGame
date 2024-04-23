// Displaying letters on the board

module alphabet(x1, x2, x3, x4, x5, a, b, c, d, e, f, g);

input x1, x2, x3, x4, x5;
output a, b, c, d, e, f, g;

assign a = (~x1&~x2&~x3&~x4&x5) | (~x1&~x2&~x3&x4&x5) | (~x1&~x2&x3&x4&x5) | (~x1&x2&~x3&~x4&~x5) | (~x1&x2&~x3&~x4&x5) 
			| (~x1&x2&~x3&x4&x5) | (x1&~x2&~x3&x4&x5) | (x1&~x2&x3&~x4&~x5) | (x1&~x2&x3&~x4&x5) | (x1&x2&~x3&~x4&~x5);
			
assign b = (~x1&~x2&~x3&~x4&x5) | (~x1&~x2&~x3&x4&~x5) | (~x1&~x2&x3&~x4&x5) | (~x1&~x2&x3&x4&x5) | (~x1&x2&~x3&x4&~x5)
			| (~x1&x2&~x3&x4&x5) | (~x1&x2&x3&~x4&~x5) | (x1&~x2&~x3&~x4&x5) | (x1&~x2&~x3&x4&~x5) | (x1&~x2&~x3&x4&x5);
			
assign c = (~x1&~x2&~x3&x4&~x5) | (~x1&~x2&x3&~x4&~x5) | (~x1&~x2&x3&~x4&x5) | (~x1&x2&~x3&x4&x5) | (~x1&x2&x3&~x4&~x5)
			| (~x1&x2&x3&x4&x5) | (x1&~x2&~x3&~x4&x5) | (x1&~x2&~x3&x4&x5) | (x1&~x2&x3&~x4&x5) | (x1&x2&~x3&~x4&x5);
			
assign d = (~x1&~x2&~x3&~x4&~x5) | (~x1&~x2&x3&~x4&x5) | (~x1&~x2&x3&x4&x5) | (~x1&x2&~x3&~x4&~x5) | (~x1&x2&x3&~x4&x5)
			| (~x1&x2&x3&x4&x5) | (x1&~x2&~x3&~x4&~x5) | (x1&~x2&~x3&~x4&x5) | (x1&~x2&x3&~x4&x5);
			
assign e = (~x1&~x2&x3&x4&~x5) | (~x1&x2&~x3&~x4&~x5) | (~x1&x2&~x3&~x4&x5) | (x1&~x2&~x3&~x4&~x5) | (x1&~x2&~x3&x4&~x5)
			| (x1&~x2&x3&~x4&x5) | (x1&~x2&x3&x4&~x5) | (x1&x2&~x3&~x4&~x5);
			
assign f = (~x1&~x2&~x3&x4&x5) | (~x1&x2&~x3&~x4&~x5) | (~x1&x2&~x3&~x4&x5) | (x1&~x2&x3&x4&~x5) | (x1&x2&~x3&~x4&x5);

assign g = (~x1&~x2&~x3&x4&~x5) | (~x1&x2&~x3&~x4&~x5) | (~x1&x2&~x3&~x4&x5) | (~x1&x2&~x3&x4&x5) | (~x1&x2&x3&~x4&x5)
			| (~x1&x2&x3&x4&~x5) | (x1&~x2&~x3&~x4&x5) | (x1&~x2&x3&~x4&~x5);
			
endmodule