# def acronymizer(sentence)
#   words = sentence.split(' ')
#   letters = []
#   words.each{ |word| letters << word[0].upcase }
# return letters.join('yo')
# end

# print acronymizer("national aeronautic space administration")


arr = %w(rock paper scissors)

comp_guess = arr.sample


puts "Plese enter rock, paper or scissors"
print ">"
choice = gets.chomp

win_msg = "You won! Computer guess was #{comp_guess}"
lose_msg = "You lost! Computer guess was #{comp_guess}"

if choice == comp_guess
  puts "Draw ! Computer guess was #{comp_guess}"
  elsif choice == "rock"
  puts comp_guess == "paper" ? lose_msg : win_msg
  elsif choice == "paper"
  puts comp_guess == "scissors" ? lose_msg : win_msg
  elsif choice == "scissors"
  puts comp_guess == "rock" ? lose_msg : win_msg
else
  "wrong input"
end

#case 1 the user enters something that isn't a choice
#case 2 a draw
#case 3 a win for the user
#case 4 a win for the computer













