module Lab1(clock,hex0, hex1, hex2, hex3, hex4, hex5, save, bet, reset, betNum);
reg [4:0] p1= 5'd10; //player 1 marble           
reg [4:0] p2= 5'd10; //player 2 marble
reg [4:0] b1= 5'd0; //player 1 bets               
reg [4:0] b2= 5'd0; //player 2 bets
reg betS;  //player odd even save
reg [2:0] saveCounter=0; //tracks saves
reg [2:0] turnCounter=0; //tracks turn
reg [4:0] pS; //player marble save
reg [3:0] bS; //saves bet
input clock;
//save button
input save;

//odd or even switch
input bet;

//reset button
input reset;

//bet number
input [3:0] betNum;


output reg[6:0] hex3; //this is the odd or even bet display
output reg[6:0] hex2; //this shows which player is guessing

wire [4:0] s1,s2,s3,s4;
reg[4:0] sum1;
reg[4:0] sum2;

//display double digit player marbles
assign s1 = pS%5'd10;
assign s2 = pS/5'd10;

assign s3 = betNum%5'd10;
assign s4 = betNum/5'd10;

reg cout;
reg[31:0] count;
//switches for player hand first digit
output[6:0] hex4;

    assign hex4[0] = (~s1[3]&~s1[2]&~s1[1]&s1[0]) | (~s1[3]&s1[2]&~s1[1]&~s1[0]);
    assign hex4[1] = (~s1[3]&s1[2]&~s1[1]&s1[0]) | (~s1[3]&s1[2]&s1[1]&~s1[0]);
    assign hex4[2] = (~s1[3]&~s1[2]&s1[1]&~s1[0]);
    assign hex4[3] = (~s1[3]&~s1[2]&~s1[1]&s1[0]) | (~s1[3]&s1[2]&~s1[1]&~s1[0]) | (~s1[3]&s1[2]&s1[1]&s1[0]);
    assign hex4[4] = (~s1[3]&~s1[2]&~s1[1]&s1[0]) | (~s1[3]&~s1[2]&s1[1]&s1[0]) | (~s1[3]&s1[2]&~s1[1]&~s1[0]) | (~s1[3]&s1[2]&~s1[1]&s1[0]) | (~s1[3]&s1[2]&s1[1]&s1[0]) | (s1[3]&~s1[2]&~s1[1]&s1[0]);
    assign hex4[5] = (~s1[3]&~s1[2]&~s1[1]&s1[0]) | (~s1[3]&~s1[2]&s1[1]&~s1[0]) | (~s1[3]&~s1[2]&s1[1]&s1[0]) | (~s1[3]&s1[2]&s1[1]&s1[0]);
    assign hex4[6] = (~s1[3]&~s1[2]&~s1[1]&~s1[0]) | (~s1[3]&~s1[2]&~s1[1]&s1[0]) | (~s1[3]&s1[2]&s1[1]&s1[0]);


//switches for player hand second digit
output[6:0] hex5;

    assign hex5[0] = (~s2[3]&~s2[2]&~s2[1]&s2[0]) | (~s2[3]&s2[2]&~s2[1]&~s2[0]);
    assign hex5[1] = (~s2[3]&s2[2]&~s2[1]&s2[0]) | (~s2[3]&s2[2]&s2[1]&~s2[0]);
    assign hex5[2] = (~s2[3]&~s2[2]&s2[1]&~s2[0]);
    assign hex5[3] = (~s2[3]&~s2[2]&~s2[1]&s2[0]) | (~s2[3]&s2[2]&~s2[1]&~s2[0]) | (~s2[3]&s2[2]&s2[1]&s2[0]);
    assign hex5[4] = (~s2[3]&~s2[2]&~s2[1]&s2[0]) | (~s2[3]&~s2[2]&s2[1]&s2[0]) | (~s2[3]&s2[2]&~s2[1]&~s2[0]) | (~s2[3]&s2[2]&~s2[1]&s2[0]) | (~s2[3]&s2[2]&s2[1]&s2[0]) | (s2[3]&~s2[2]&~s2[1]&s2[0]);
    assign hex5[5] = (~s2[3]&~s2[2]&~s2[1]&s2[0]) | (~s2[3]&~s2[2]&s2[1]&~s2[0]) | (~s2[3]&~s2[2]&s2[1]&s2[0]) | (~s2[3]&s2[2]&s2[1]&s2[0]);
    assign hex5[6] = (~s2[3]&~s2[2]&~s2[1]&~s2[0]) | (~s2[3]&~s2[2]&~s2[1]&s2[0]) | (~s2[3]&s2[2]&s2[1]&s2[0]);
	 
	 
//Switches for first digit bet
output[6:0] hex0;

    assign hex0[0] = (~s3[3]&~s3[2]&~s3[1]&s3[0]) | (~s3[3]&s3[2]&~s3[1]&~s3[0]);
    assign hex0[1] = (~s3[3]&s3[2]&~s3[1]&s3[0]) | (~s3[3]&s3[2]&s3[1]&~s3[0]);
    assign hex0[2] = (~s3[3]&~s3[2]&s3[1]&~s3[0]);
    assign hex0[3] = (~s3[3]&~s3[2]&~s3[1]&s3[0]) | (~s3[3]&s3[2]&~s3[1]&~s3[0]) | (~s3[3]&s3[2]&s3[1]&s3[0]);
    assign hex0[4] = (~s3[3]&~s3[2]&~s3[1]&s3[0]) | (~s3[3]&~s3[2]&s3[1]&s3[0]) | (~s3[3]&s3[2]&~s3[1]&~s3[0]) | (~s3[3]&s3[2]&~s3[1]&s3[0]) | (~s3[3]&s3[2]&s3[1]&s3[0]) | (s3[3]&~s3[2]&~s3[1]&s3[0]);
    assign hex0[5] = (~s3[3]&~s3[2]&~s3[1]&s3[0]) | (~s3[3]&~s3[2]&s3[1]&~s3[0]) | (~s3[3]&~s3[2]&s3[1]&s3[0]) | (~s3[3]&s3[2]&s3[1]&s3[0]);
    assign hex0[6] = (~s3[3]&~s3[2]&~s3[1]&~s3[0]) | (~s3[3]&~s3[2]&~s3[1]&s3[0]) | (~s3[3]&s3[2]&s3[1]&s3[0]);

	 
//Switches for second digit bet
output[6:0] hex1;

    assign hex1[0] = (~s4[3]&~s4[2]&~s4[1]&s4[0]) | (~s4[3]&s4[2]&~s4[1]&~s4[0]);
    assign hex1[1] = (~s4[3]&s4[2]&~s4[1]&s4[0]) | (~s4[3]&s4[2]&s4[1]&~s4[0]);
    assign hex1[2] = (~s4[3]&~s4[2]&s4[1]&~s4[0]);
    assign hex1[3] = (~s4[3]&~s4[2]&~s4[1]&s4[0]) | (~s4[3]&s4[2]&~s4[1]&~s4[0]) | (~s4[3]&s4[2]&s4[1]&s4[0]);
    assign hex1[4] = (~s4[3]&~s4[2]&~s4[1]&s4[0]) | (~s4[3]&~s4[2]&s4[1]&s4[0]) | (~s4[3]&s4[2]&~s4[1]&~s4[0]) | (~s4[3]&s4[2]&~s4[1]&s4[0]) | (~s4[3]&s4[2]&s4[1]&s4[0]) | (s4[3]&~s4[2]&~s4[1]&s4[0]);
    assign hex1[5] = (~s4[3]&~s4[2]&~s4[1]&s4[0]) | (~s4[3]&~s4[2]&s4[1]&~s4[0]) | (~s4[3]&~s4[2]&s4[1]&s4[0]) | (~s4[3]&s4[2]&s4[1]&s4[0]);
    assign hex1[6] = (~s4[3]&~s4[2]&~s4[1]&~s4[0]) | (~s4[3]&~s4[2]&~s4[1]&s4[0]) | (~s4[3]&s4[2]&s4[1]&s4[0]);

parameter D = 32 'd2500000;
	 
always @(posedge clock)begin//change cout every 0.25 sec
   count <= count + 32'd1;
      if (count >= (D-1)) begin
         cout <= ~cout;
         count <= 32'd0;
      end		
end

reg saver;
reg resetter;
always@(posedge cout)
begin
saver<=save;
resetter<=reset;

//One player wins the game
	if((reset==1)&&(resetter==0))
	begin
		saveCounter=0;
		turnCounter=0;
		p1 <= 5'd10;
		p2 <= 5'd10;
		b1 <= 5'd0;
		b2 <= 5'd0;
	end

	else if(p1>5'd19 || p2 >= 5'd19)
	begin
	//win condition
		if((p1>5'd19))
		begin
		pS<=0;

		hex2[0] = 1;
		hex2[1] = 0;
		hex2[2] = 0;
		hex2[3] = 1;
		hex2[4] = 1;
		hex2[5] = 1;
		hex2[6] = 1;

		hex3[0] = 0;
		hex3[1] = 0;
		hex3[2] = 1;
		hex3[3] = 1;
		hex3[4] = 0;
		hex3[5] = 0;
		hex3[6] = 0;
	end

	if((p2>5'd19))
	begin
		pS<=0;

		hex2[0] = 0;
		hex2[1] = 0;
		hex2[2] = 1;
		hex2[3] = 0;
		hex2[4] = 0;
		hex2[5] = 1;
		hex2[6] = 0;

		hex3[0] = 0;
		hex3[1] = 0;
		hex3[2] = 1;
		hex3[3] = 1;
		hex3[4] = 0;
		hex3[5] = 0;
		hex3[6] = 0;

	end
end
	else
	begin
		if ((save==1)&&(saver==0))
		begin
			saveCounter = saveCounter+ 3'b1;
		end
		else
		begin
			if (turnCounter == 0)
			begin

				//display player number
				hex2[0] = 1;
				hex2[1] = 0;
				hex2[2] = 0;
				hex2[3] = 1;
				hex2[4] = 1;
				hex2[5] = 1;
				hex2[6] = 1;

				//display number of p1 marbles on hex5 and hex4
				pS <= p1;
				//odd or even (hex3) should be off
				hex3[0] = 1;
				hex3[1] = 1;
				hex3[2] = 1;
				hex3[3] = 1;
				hex3[4] = 1;
				hex3[5] = 1;
				hex3[6] = 1;
				//player 1 bets first by using switches to pick a number, this is displayed on hex0 and hex1

				b1 <= betNum;
					//prevents bets larger than player marbles
					if(betNum > p1)begin
					
					b1 <= p1;
				
					end
					if(betNum == 0)begin
		
					b1 <= 1;
	
					end
					//player 1 presses save button
					if(saveCounter == 1)
					begin

	
				

					turnCounter = turnCounter+ 3'b1;
					end
			end
			if (turnCounter == 1)
			begin
				//player 2 turn
				//display number of p2 marbles on hex5 and hex4
				pS <= p2;
				//display player number on hex2
				hex2[0] = 0;
				hex2[1] = 0;
				hex2[2] = 1;
				hex2[3] = 0;
				hex2[4] = 0;
				hex2[5] = 1;
				hex2[6] = 0;
				//player 2 bets, display hex0 and hex1
				//if switch bet = 0, then odd. if switch bet = 1, then even. displayed on hex3
					if(bet==0)
					begin

						hex3[0] = 0;
						hex3[1] = 1;
						hex3[2] = 1;
						hex3[3] = 0;
						hex3[4] = 0;
						hex3[5] = 0;
						hex3[6] = 0;
					end
					if(bet==1)
					begin

						hex3[0] = 1;
						hex3[1] = 1;
						hex3[2] = 0;
						hex3[3] = 0;
						hex3[4] = 0;
						hex3[5] = 1;
						hex3[6] = 0;

					end
	b2 <= betNum;
		if(betNum > p2)
	begin
		
		b2 <= p2;
		end
		if(betNum == 0)begin
		
		b2 <= 1;
	
	end
//player 2 presses save button
//SAVE BUTTON: if saveCounter = 1: b2 = number of bet AND oeS
if(saveCounter == 2)begin

	//prevents bets larger than player marbles

	if(b1%5'd2==bet)

begin

p2 <= p2 + b2*2;

p1 <= p1 - b2*2;
	
end

else
begin
p2 <= p2 - b1*2;

p1 <= p1 + b1*2;
	
end
turnCounter = turnCounter+ 3'b1;
	end

end
if (turnCounter ==2)
begin

//player 2 turn
//display number of p2 marbles on hex5 and hex4
pS<=p2;
//display player number on hex2
hex2[0] = 0;
hex2[1] = 0;
hex2[2] = 1;
hex2[3] = 0;
hex2[4] = 0;
hex2[5] = 1;
hex2[6] = 0;
//odd or even (hex3) should be off
hex3[0] = 1;
hex3[1] = 1;
hex3[2] = 1;
hex3[3] = 1;
hex3[4] = 1;
hex3[5] = 1;
hex3[6] = 1;
//player 2bets first by using switches to pick a number, this is displayed on hex0 and hex1
//player 2 presses save button
b2 <= betNum;
	if(betNum > p2)begin
		
		b2 <= p2;
	end
		if(betNum == 0)begin
		
		b2 <= 1;
	
	end
//SAVE BUTTON: if saveCounter = 2: b2 = number of bet
if(saveCounter == 3)
begin
	
	
	
	//prevents bets larger than player marbles

	turnCounter=turnCounter+1;
	
end	
end

if(turnCounter==3)
begin
//player 1 turn
//display number of p1 marbles on hex5 and hex4
pS <= p1;
//display player number on hex2
hex2[0] = 1;
hex2[1] = 0;
hex2[2] = 0;
hex2[3] = 1;
hex2[4] = 1;
hex2[5] = 1;
hex2[6] = 1;
//player 1 bets, display hex0 and hex1
//if switch bet = 0, then odd. if switch bet = 1, then even. displayed on hex3

//player 1 presses save button

if(bet==0)
begin

hex3[0] = 0;
hex3[1] = 1;
hex3[2] = 1;
hex3[3] = 0;
hex3[4] = 0;
hex3[5] = 0;
hex3[6] = 0;
end
if(bet==1)
begin

hex3[0] = 1;
hex3[1] = 1;
hex3[2] = 0;
hex3[3] = 0;
hex3[4] = 0;
hex3[5] = 1;
hex3[6] = 0;
end
////if (oe == 0)
////oeS = 0
////else
////oeS = 1
//GAME gets % of p1 bet
//odd : %2 = 1. even : %2 = 0.
//if %p2 bet = p1 guess
//SAVE BUTTON: if saveCounter = 3: b1 = number of bet AND betS
	b1 <= betNum;
		if(betNum > p1)begin
		
		b1 <= p1;
		end
		if(betNum == 0)begin
		
		b1 <= 1;
	
	end
if(saveCounter == 4)begin


	//prevents bets larger than player marbles

	if(b2%5'd2==bet)

begin
p2 <= p2 - b1*2;

p1 <= p1 + b1*2;
end

else
begin
p2 <= p2 + b2*2;

p1 <= p1 - b2*2;


end
saveCounter = 0;
turnCounter = 0;
end
	
end
end
end
end

endmodule