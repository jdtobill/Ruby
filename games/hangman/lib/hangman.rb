require_relative "view.rb"
require "csv"

class Hangman
  def initialize(hits =[],miss = [" "],word_letters = nil)
    @valid_input = ("a".."z").to_a << "save"
    @miss = miss
    @hits = hits
    @word_list = "5desk.txt"
    if word_letters
      puts "\n Your saved game has been loaded."
      @word_letters = word_letters
      @word = @word_letters.join("")
      display
    else
      welcome
      secret_word
      process_word
    end
  end

  def welcome
    puts "___________________________________________________________"
    puts "HANGMAN"
    puts "Welcome and thanks for playing Hangman!"
  end

  def secret_word
    @word = File.open(@word_list,"r").readlines.sample.downcase
    if @word.size < 5 || @word.size > 12
      secret_word
    else
      @word
    end
  end

  def process_word
    @word_letters = @word.split("").to_a
    (@word.length - 1).times { @hits << "_"}
  end

  def player_guess
    puts "__________________________________"
    puts "Enter a letter or 'save' \nto save the game "
    @input = gets.chomp.downcase
    puts "__________________________________"
  end

  def check_guess
    if !@valid_input.include?(@input)
      puts "Invalid guess. Please enter a single letter."
      player_guess
    elsif @miss.include?(@input) || @hits.include?(@input)
      puts "You already guessed that letter."
      puts "Please pick another letter."
      player_guess
    elsif @input == "save"
      save
    else
      @input
    end
  end

  def reset?
    puts "Do you wish to play another round? Yes or No."
    answer = gets.chomp.downcase
    case answer
      when "yes" || "Yes"
        Hangman.new.play
      when "no" || "No"
        puts "Thank you for playing!"
        exit
      else
        puts "That was an invalid answer."
        puts "Please choose yes or no."
        reset?
    end
  end

  def check_win
    if @hits.all? {|x| @valid_input.include?(x)}

      puts "/n YOU GUESSED IT!"
      reset?
    end
  end

  def display
    view
    puts "\nWrong Guesses:"
    @miss.each {|miss| print miss + " "}
    puts "\n\nCorrect Guesses:"
    @hits.each {|hit| print "#{hit} "}
    puts " "
  end

  def check_word
    if @word_letters.include?(@input)
      @word_letters.each_with_index { |letter, index| @hits[index] = @input if letter == @input }
      puts "Correct! '#{@input}' is in the word!"
    elsif !@miss.include?(@input)
      @miss << @input
      puts "Sorry! '#{@input}' is not in the word!"
    end
    display
    check_win
  end

  def play
    while @miss.size != 11
      player_guess
      check_guess
      check_word
      puts " \n "
    end
    puts "You Lose!"
    puts "The word was '#{@word}'"
    reset?
  end

  def save
    puts "Please name your game!"
    name = gets.chomp.downcase
    file = File.open('saved_games/saves.csv', 'ab')
    file.write("#{name},#{@hits.join("")},#{@miss.join("")},#{@word_letters.join("")}")
    file.close
    reset?
  end

  def start
    puts "\nPlease enter 'Load' to load a saved game, or 'New' to start a new game!"
    answer = gets.chomp.downcase
    if answer == 'new'
      Hangman.new.play.display
    elsif answer == 'load'
      load
    else
      puts "\n Invalid entry."
      start
    end
  end

  def load
    if File.open('saved_games/saves.csv','r').size == 0
      puts "There are no saved games.\n Beginning a new game."
      Hangman.new.play
    else
        puts "\nSaved Games:\n"
        saves = 'saved_games/saves.csv'
        CSV.foreach(saves) do |row|
          puts row[0]
        end
        puts "\nPlease choose a game to continue"
        choice = gets.chomp.downcase
        CSV.foreach(saves) do |row|
          if choice == row[0]
            puts " \n Retrieving file \n "
            4.times do
              puts ". "
              sleep(1)
            end
            Hangman.new(row[1].split(""), row[2].split(""),row[3].split("")).play
          else
            puts "This game does not exist"
            start
          end
        end
    end
  end

end

a = Hangman.new.start