module GameModule(
    input wire clk,
    input wire rst,
    input wire hintSwitch,
    input wire [6:0] hex0,
    output reg [6:0] hex5, hex4, hex3, hex2,
	 output [6:0] hex1,
    output wire [9:0] ledS,
    input clk2
);
 
    assign hex1 = 7'b1111111;
	 
    // State and state register
    reg [6:0] state = 0 , next_state, p_state;
	 
	 reg [27:0] words [15:0];
	 reg [31:0] selectedWord;
	 reg [6:0] hintValue;
	 initial begin
	 
	     // stored words	
        words[0] = 28'b0000011_1000000_1000111_0100001; //bold
        words[1] = 28'b0000110_0001000_1001110_0010010; //mars
        words[2] = 28'b1110001_0001000_0100100_0100100; //jazz
        words[3] = 28'b0000011_1000111_1000001_0000100; //blue
        words[4] = 28'b0010010_0000111_0001000_1001110; //star
        words[5] = 28'b0010010_0000111_0001000_1001110; //star 
        words[6] = 28'b1001110_0001000_1111001_1001000; //rain
        words[7] = 28'b0000011_0000100_0001000_1001110; //bear
        words[8] = 28'b1000111_0001000_0000110_0001100; //lamp
        words[9] = 28'b0110000_1000000_1000111_0001110; //wolf
        words[10] = 28'b0000010_1111001_0000111_0000100; //kite
        words[11] = 28'b1001000_0000100_1000000_1001000; //neon
        words[12] = 28'b0001011_1111001_0000010_0000100; //hike
        words[13] = 28'b0010000_1000000_1000111_0100001; //gold
        words[14] = 28'b0001110_1000111_1111001_0001100; //flip
        words[15] = 28'b0000110_1000000_1000000_1001000; //moon
		  
		  end
		  
		  wire [3:0] randomIndex;
		  reg result = 0;
        wire flag_60_seconds;
       
        // randompick call
        randompick lfsr(
            .clk(clk),
            .num(randomIndex)
        );
	 
  // Instantiate the Timer module
  Timer timer_inst (
    .clk(clk2),
    .rst(rst),
    .flag(flag_60_seconds),
	 .led(ledS)
  );
  
//assign ledS[6:0] = state;
  
always @ (next_state, rst)
begin

if (~rst) begin
state <= 0;
end
else begin
p_state <= state;
state <= next_state;

end

end	 
	 
    always @ (posedge clk2) begin
		case(state)
		////////////////////////////////////////////////////////////////////////////////////////////////////////
			0: begin
			
			// underscores
         hex2 <= 7'b1110111;
         hex3 <= 7'b1110111;
         hex4 <= 7'b1110111;
         hex5 <= 7'b1110111;
				
			 selectedWord = words[randomIndex];
			
			 next_state = 1;
		  end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		  1: begin
		 
	  // Update based on user input
     if (hex0 == selectedWord[6:0]) begin
         hex2 = selectedWord[6:0];
     end else if (hex0 == selectedWord[13:7]) begin
         hex3 = selectedWord[13:7];
     end else if (hex0 == selectedWord[20:14]) begin
         hex4 = selectedWord[20:14];
     end else if (hex0 == selectedWord[27:21]) begin
         hex5 = selectedWord[27:21];
     end 
	  
	       if (flag_60_seconds) begin  
					result = 0;
					next_state = 4;	
         end
	  
			 if(hex2 ==selectedWord[6:0] && hex3  == selectedWord[13:7] &&  hex4 == selectedWord[20:14] && hex5 == selectedWord[27:21])
			 begin
			 result = 1'b1;
			 next_state = 4;
			 end else if (hintSwitch) begin
			 
			 if (hex5 != selectedWord[27:21]) begin
                   next_state <= 2;
						  
           end else if (hex4 != selectedWord[20:14]) begin
                    next_state <= 5;
				
          end  else if ( hex3 != selectedWord[13:7]) begin
                    next_state <= 6;
          end else if ( hex2 != selectedWord[6:0]) begin
                    next_state <= 7;
						 
                end
			 
          end
			 
			 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
			 2: begin
			    hex5 = selectedWord[27:21];
				 next_state = 3;
					
			 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
			3: begin
			
	  // Update based on user input
     if (hex0 == selectedWord[6:0]) begin
         hex2 <= selectedWord[6:0];
     end else if (hex0 == selectedWord[13:7]) begin
         hex3 <= selectedWord[13:7];
     end else if (hex0 == selectedWord[20:14]) begin
         hex4 <= selectedWord[20:14];
     end else if (hex0 == selectedWord[27:21]) begin
         hex5 <= selectedWord[27:21];
     end
	  
			  if(hex2 == selectedWord[6:0] && hex3 == selectedWord[13:7] &&  hex4 == selectedWord[20:14] && hex5 == selectedWord[27:21])
			 begin
			 result = 1'b1;
			 next_state = 4;
			 end
						
		   // Actions to be taken when 60 seconds have elapsed
         else if (flag_60_seconds) begin  
			result = 0;
			next_state = 4;	
         end
				
			 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
			 4: begin
			 
			 if(result)
			 begin
			 
    hex5 = 7'b0110000;
    hex4 = 7'b1000000;
    hex3 = 7'b1001000;
    hex2 = 7'b1111111;
			 
			 end
			 
			 else 
			 begin 
			 
	 hex5 = 7'b1000111;
    hex4 = 7'b1000000;
    hex3 = 7'b0010010;
    hex2 = 7'b 0000111;
			 end
			 
		 if (~rst) begin	
		   next_state = 0; 
		 end
		 
			 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
	5: begin
	      hex4 = selectedWord[20:14];
				 next_state = 3;
				 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
	6: begin
        hex3 = selectedWord[13:7];
				 next_state = 3;
				 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		
	7: begin
	          hex2 = selectedWord[6:0];
				 next_state = 3;
				 
	   end
		
			 endcase
			 end
		
endmodule 