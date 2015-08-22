require 'jumpstart_auth'
require 'bitly'
require 'erb'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing..."
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.size <= 140
      @client.update(message)
    else
      puts "Message size is too large. Please shorten."
    end
  end

  def dm(target,message)
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d @#{target} #{message}"
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
    if screen_names.include? target
      tweet(message)
    else
      puts "You can only dm people that follow you."
    end
  end

  def followers_list
    screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
  end

  def spam_my_followers(message)
    followers_list.each do |follower|
      dm(follower,message)
    end
  end

  def everyones_last_tweet
    friends = @client.friends.collect { |friend| @client.user(friend)}
    friends.each do |friend|
    last_tweet = friend.status.text
    timestamp = friend.status.created_at
    timestamp.strftime("%A, %b %d")
    puts "\n"
    puts friend.screen_name + " on #{timestamp}"
    puts last_tweet
    end
  end

  def shorten(original_url)
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    puts "Shortening this URL: #{original_url}"
    return bitly.shorten(original_url).short_url
  end

  def run
    puts "Welcome to the JSL Twitter Client!"

    command = ""
    while command != "q"
      printf "\nenter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
        when 'dm' then dm(parts[1],parts[2..-1].join(" "))
        when 'spam' then spam_my_followers(parts[1..-1].join(" "))
        when 'elt' then everyones_last_tweet
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.run