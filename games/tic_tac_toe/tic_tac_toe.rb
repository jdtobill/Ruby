module TicTacToe

	class Player
		attr_reader :marker
		
		def initialize(marker)
			@marker = marker
		end
	end
		
	class Game
		attr_reader :player1, :player2 
		attr_accessor :grid, :turn
		
		def initialize
			@grid = Array.new
			9.times {@grid << " "}
			@player1 = Player.new("X")
			@player2 = Player.new("O")
			@turn = 1
		end
		
		#Reset Function
		def reset
			initialize
		end
		
		def new_game?
			puts "Do you want to play another round? Yes or No?"
			replay = gets.chomp
			case replay
			when "Yes","yes"
				reset
			when "No","no"
				abort("Thanks for playing!")
			else
				puts "Invalid Answer:"
				new_game?
			end
		end

		#Determine whose turn it is
		def whose_turn
			if turn.odd?
				puts "It is #{player1.marker}'s turn."
			else
				puts "It is #{player2.marker}'s turn."
			end
		end
		
		#Determine who the current player is
		def current_player
			@turn.odd? ? player1 : player2
		end			
		
		#Get move choice from player
		def choice
			puts "Which cell do you wish to mark?"
			display_grid
			@decision = gets.chomp.to_i
			if @decision.is_a?(Integer) && @decision <= 9
				@decision
			else
				puts "Please choose a cell number between 1 and 9"
				choice
			end
		end
		
		#Determine if player's choice is valid
		def check
			if grid[@decision - 1] == "X" || grid[@decision - 1] == "O"
				puts "That cell is taken. Please choose a different cell"
				choice
			else
				@decision
			end
		end
		
		#Mark player's choice on the board
		def mark_choice
			grid[@decision - 1] = current_player.marker
		end
		
		#Display the board to the players
		def display_grid
			puts "-----------"
			puts "#{grid[0]}  | #{grid[1]} | #{grid[2]}"
			puts "---+---+---"
			puts "#{grid[3]}  | #{grid[4]} | #{grid[5]}"
			puts "---+---+---"
			puts "#{grid[6]}  | #{grid[7]} | #{grid[8]}"
			puts "-----------"
		end
		
		#Define winning cases
		def win?
			case
			 when grid[0] == grid[1] && grid[1] == grid[2] && grid[0] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[3] == grid[4] && grid[4] == grid[5] && grid[3] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[6] == grid[7] && grid[7] == grid[8] && grid[6] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[0] == grid[3] && grid[3] == grid[6] && grid[0] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[1] == grid[4] && grid[4] == grid[7] && grid[1] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[2] == grid[5] && grid[5] == grid[8] && grid[2] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[0] == grid[4] && grid[4] == grid[8] && grid[0] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			when grid[2] == grid[4] && grid[4] == grid[6] && grid[2] != " "
				puts "#{current_player.marker} won the game!"
				display_grid
				true
				new_game?
			else
				false
			end
		end
		
		#Define a tie situation
		def tie?
			if (@turn > 10) && win? == false
				true
				puts "The game ended in a draw!"
				new_game?
			else
				false
			end
		end
		
		#Steps the program takes to run the game
		def play
			while (win? || tie?) == false
				whose_turn
				choice
				check
				mark_choice
				win?
				tie?
				@turn += 1
			end
		end	
	end
	
end
	a=TicTacToe::Game.new		
	a.play