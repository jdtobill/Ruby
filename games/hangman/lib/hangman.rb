require_relative "view.rb"

class Hangman
  def initialize
    @valid_letters = ("a".."z").to_a
    @miss = []
    @hits = []
    @word_list = "5desk.txt"
    play
  end

  def welcome
    puts "___________________________________________________________"
    puts "HANGMAN"
    puts "Welcome and thanks for playing Hangman!"
    puts "You've got 10 turns to guess all the letters in the word!"
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
    puts "What is your guess?"
    @guess = gets.chomp.downcase
    puts "__________________________________"
  end

  def check_guess
    if @guess.length != 1 || @valid_letters.include?(@guess) == false
      puts "Invalid guess. Please enter a single letter."
      player_guess
    elsif @miss.include?(@guess) || @hits.include?(@guess)
      puts "You already guessed that letter."
      puts "Please pick another letter."
      player_guess
    else
      @guess
    end
  end

  def reset?
    puts "Do you wish to play again? Yes or No."
    answer = gets.chomp.downcase
    case answer
      when "yes" || "Yes"
        initialize
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
    if @hits.all? {|x| @valid_letters.include?(x)}
      puts "YOU GUESSED IT!"
      reset?
    end
  end

  def check_word
    if @word_letters.include?(@guess)
      @word_letters.each_with_index { |letter, index| @hits[index] = @guess if letter == @guess }
      view
    elsif !@miss.include?(@guess)
      @miss << @guess
      view
    end
    puts " "
    puts "Wrong Guesses:"
    @miss.each {|miss| print miss}
    puts " "
    puts " "
    puts "Correct Guesses:"
    @hits.each {|hit| print "#{hit} "}
    puts " "
    check_win
  end

  def play
    welcome
    secret_word
    process_word
    while @miss.size != 7
      player_guess
      check_guess
      check_word
      puts " "
      puts " "
    end
    puts "You Lose!"
    reset?
  end

end

a = Hangman.new