Hangman Version 1.1

Running the Game
You must have Ruby installed to run this game.
In the command line, navigate to the directory holding the 'hangman.rb' file.
Type in 'ruby hangman.rb' and hit enter to run the game.

Instructions

A word has been chosen from a dictionary. Guess the letters in the word before you run out of turns. 
Each wrong guess will result in another part being added to the hangman drawing.
Once you guess 7 wrong letters, the hangman will be fully drawn and you lose.  
If you guess all the letters before making 7 wrong guesses,
YOU WIN!

-Loading the Game:
  When asked whether you wish to load or start a new game, type "load" and hit enter.
  You will be given a list of names of previous users' saved games.
  Type your name and hit enter to load your saved game.

-Entering a Guess:
  Type a single letter then hit enter.
  If you've already entered that letter before, you will be asked to enter another letter.
  
-Saving the game
 Type 'save' then hit enter when asked to guess a letter or save the game.
 
 

SAMPLE RUN THROUGH OF A GAME:

C:\RailsInstaller\Ruby2.1.0\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift) C:/Sites/hangman/lib/hangman.rb
___________________________________________________________
HANGMAN
Welcome and thanks for playing Hangman!

Please enter 'Load' to load a saved game, or 'New' to start a new game!
load

Saved Games:
john

Please choose a game to continue
john
___________________________________________________________
HANGMAN
Welcome and thanks for playing Hangman!
__________________________________
Pick a letter or type 'save'
>a
__________________________________
You already guessed that letter.
Please pick another letter.
__________________________________
Pick a letter or type 'save'
>e
__________________________________
Correct! 'e' is in the word!
  __________
  |||||||||||
 
Wrong Guesses:
   
Correct Guesses:
_ e a _ e _ e _ _ _ _  
 
 
__________________________________
Pick a letter or type 'save'
>i
__________________________________
Sorry! 'i' is not in the word!

|
|
|
|
|
|__________
|||||||||||
 
Wrong Guesses:
  i  
Correct Guesses:
_ e a _ e _ e _ _ _ _  
 
 
__________________________________
Pick a letter or type 'save'
>o
__________________________________
Sorry! 'o' is not in the word!
 _______
 |
 |
 |
 |
 |
 |__________
 |||||||||||
 
Wrong Guesses:
  i o  
Correct Guesses:
_ e a _ e _ e _ _ _ _  
 
 
__________________________________
Pick a letter or type 'save'
>c
__________________________________
Correct! 'c' is in the word!
 _______
 |
 |
 |
 |
 |
 |__________
 |||||||||||
 
Wrong Guesses:
  i o  
Correct Guesses:
c e a _ e _ e _ _ _ _  
 
 
__________________________________
Pick a letter or type 'save'
>s
__________________________________
Correct! 's' is in the word!
_______
|
|
|
|
|
|__________
|||||||||||
 
Wrong Guesses:
  i o  
Correct Guesses:
c e a s e _ e s s _ _  
 
 
__________________________________
Pick a letter or type 'save'
>l
__________________________________
Correct! 'l' is in the word!
_______
|
|
|
|
|
|__________
|||||||||||
 
Wrong Guesses:
  i o  
Correct Guesses:
c e a s e l e s s l _  
 
 
__________________________________
Pick a letter or type 'save'
>y
__________________________________
Correct! 'y' is in the word!
_______
|
|
|
|
|
|__________
|||||||||||
 
Wrong Guesses:
  i o  
Correct Guesses:
c e a s e l e s s l y  
YOU GUESSED IT!
Do you wish to play another round? Yes or No.
