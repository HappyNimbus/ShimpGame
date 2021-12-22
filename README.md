# ShimpGame

Design Description:
The game has 4 turns which continues looping
	Turn 1: Player 1 chooses a number to bet
	Turn 2: Player 2 chooses a number to bet and guesses whether Player 1 bet an 
		even or odd number.
If player 2 guessed right, player 2 receives double their bet back, while 
player 1 loses the same amount of marbles.
		If player 2 guessed wrong, player 1 receives double their bet back, 
while player player 2 loses the same amount of marbles.
	Turn 3: Player 2 chooses a number to bet
	Turn 4: Player 1 chooses a number to bet and guesses whether Player 2 bet an
		 even or odd number.
			If player 1 guessed right, player 1 receives double their bet back, while 
player 2 loses the same amount of marbles.
		If player 1 guessed wrong, player 2 receives double their bet back, 
while player player 2 loses the same amount of marbles
	Game Continues Until a Player Wins (A player has 20 marbles)

Restrictions: 
Players may only bet up to the amount of marbles they have: If players bet more than they have, the number they bet will automatically be equal to the number or marbles they currently have.
Players may not bet no marbles: If players bet 0 marbles, the number they bet will automatically equal 1.


References/Sources:
Button Counter for Metastability:
https://stackoverflow.com/questions/43636939/keeping-count-of-button-clicks-in-verilog

Squid Game Marble Game:
https://www.youtube.com/watch?v=JrXBy7uP5_k
We based our game off of the Marble Game that was in Squid game which involved each player betting a number of marbles and taking turns guessing whether the other person’s bet was odd or even. 

Link to Video:
	https://www.youtube.com/watch?v=QrQb TMmM
