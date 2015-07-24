module Mastermind	
	##TODO:
	### create option for player to be the codemaker and computer to be the code breaker
	class Game
	attr_accessor :grid, :code, :choices, :turns, :count
		
		def initialize
			@grid = Array.new
			4.times {@grid << " "}
			@grid
			@turns = 10
			code_create
			welcome_player
		end
		
		def welcome_player
			puts "  __  __            _                     _           _ 
 |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
 | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
 |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
			puts "															 "
			puts "	  _____________________________________________________"
			puts "	  Hello and welcome!"
			puts "	  Thank you for playing Mastermind!"
			puts "	  4 letters between A and F were chosen to make a code."
			puts "	  You have 10 turns to guess what these letters are and" 
			puts "	  the sequence they were put in. A single letter can be"
			puts "	  used more than once so the sequence can be anything "
			puts "	  from 4 different letters up to 4 of the same letter."
			puts "	  _____________________________________________________"
			puts "	  Hints are given after each guess"
			puts "	  O = Correct letter in the correct position."
			puts "	  X = Letter is not found in the secret code."
			puts "	  - = Correct letter in the incorrect position."
			puts "	  _____________________________________________________"
			puts "	  The hints' ordering is random and does not match"
			puts "	  the ordering of your guess."
			puts "															 "
		end			
		
		def code_create
			@code = Array.new
			4.times { @code << ('A'..'F').to_a[rand(0..5)] }
		    @code
		end
		
		def choice
			puts "Choose four letters between A and F."
			puts "Please use the following format: ACEF"
			input = gets.chomp.to_s.upcase
			@choices = input.split("")
			@choices
		end
		
		def hint
			@hit_arr=Array.new
			@choices.each_with_index do |letter, index|
				if @code.include?(letter)
					if @code[index] == @choices[index]
						@hit_arr[index] = "O"
					elsif (@choices[index - 1] != @code[index - 1]) && (@code[index - 1] == letter) 
						@hit_arr[index] = "-"
					elsif (@choices[index - 2] != @code[index - 2]) && (@code[index - 2] == letter) 
						@hit_arr[index] = "-"
					elsif (@choices[index - 3] != @code[index - 3]) && (@code[index - 3] == letter)
						@hit_arr[index] = "-"
					elsif (@choices[index - 1] == @code[index - 1]) || (@choices[index - 2] == @code[index - 2]) || (@choices[index - 3] == @code[index - 3])
						@hit_arr[index] = "X"
					end
				else
					@hit_arr[index] = "X"
				end
			end
			@hit_arr.sort!
		end
		
		def outer_line
			puts "---+---+---+---+-------"
		end
		
		def display_board
			outer_line 
			puts " #{@choices[0]} | #{@choices[1]} | #{@choices[2]} | #{@choices[3]} | #{@hit_arr[0]} #{@hit_arr[1]} #{@hit_arr[2]} #{@hit_arr[3]}"
			outer_line
			puts ""
		end
		
		def check
			@possible_choices = ("A".."F")
			while (@choices.length != 4) || (@choices.all? { |x| @possible_choices.include?(x)} == false) 
				puts "Invalid input."
				choice
			end
		end
		
		def game_reset
			initialize
		end
		
		def replay?
			puts "Do you wish to play again? Yes or no?"
			answer = gets.chomp.downcase
			case answer
			when "yes"
				game_reset
			when "no"
				exit
			else
				puts "Invalid answer"
				replay?
			end
		end

		def num_turns
			puts "You have #{@turns} turns remaining."
		end
		
		def win?
			if @choices == @code
				true
				puts "Congratulations! You cracked the code!"
				replay?
			else
				false
				puts "Try again"
				@turns -= 1
				num_turns
			end
		end
		
		def lose?
			if @turns < 1
				puts "Sorry. You lost."
				puts "The secret code was #{@code}"
				replay?
			end
		end
		
		def human_play
				choice
				check
				hint
				display_board
				win?
				lose?
				human_play
		end	
		
	end
end

a = Mastermind::Game.new
	a.human_play
	


	
	
	
	
	
	