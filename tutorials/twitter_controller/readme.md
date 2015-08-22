My Solution to JumpStartLabs' MicroBlogger Tutorial

[Tutorial Source](http://tutorials.jumpstartlab.com/projects/microblogger.html#iteration-1:-posting-tweets)

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)

Navigate to the directory containing twitter.rb
using the command line 

on the command line, enter:
> gem install jumpstart_auth
  
then enter:
> gem install bitly

Finally, run the program by entering:
> ruby twitter.rb

The first time this is run it’ll use the Launchy gem to pop 
open your web browser and ask for permission to use your 
account. 

Twitter will then give you a pin number that’s about 10 digits. 
Copy it to your clipboard and 
paste it in where the prompt says Enter the supplied pin:.



**Command list**

Quit and end program
> q

Tweet a message (substitute your message with "message" in the command)
> t message

Send a dm ( substitute "target" with recipient's tag and "message" with your message)
> dm target message

dm all followers (substitute "message" with your message)
> spam message

Collect the last tweet of everyone you follow
> elt
