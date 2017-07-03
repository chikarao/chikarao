# def acronymizer(sentence)
#   words = sentence.split(' ')
#   letters = []
#   words.each{ |word| letters << word[0].upcase }
# return letters.join('yo')
# end

# print acronymizer("national aeronautic space administration")

# def acronymizer(sentence)
#   words = sentence.split(' ')
#   words.map { |each| each[0].upcase }.join
# end

# puts acronymizer("national aeronautic space administration")

def simple_encrypt(text, permutation_level)

  alphabet = ("A".."Z").to_a
# Define an array
# Split our text in an array
  cipher = text.split("").map do |char|
  #ID the index number of each letter
  #if no index number exists then return that letter
  #if index number exists then increment by 3
  index = alphabet.index(char)
  if index
    new_index = (index - permutation_level) % 26
    alphabet[new_index]
  else
    char
  end
end
  return cipher.join
end

def enhanced_encrypt(text, permutation_level)

vowels = %w(A E I O U)
cipher = simple_encrypt(text, permutation_level).split("").map do |char|
  #if array of vowels contains characters passed turn it to lower case
  #if not leave it
  if vowels.include?(char)
    char.downcase
  else
    char
  end
end

return cipher.join
end

def decrypt(cipher)
#capture all possibilities in
possibilities = []
#account for all the possbilities
26.times do |i|
  possibilities << simple_encrypt(cipher, i)

  end

#return all possibilities
return possibilities

end

print decrypt("EBIIL")
# puts enhanced_encrypt("HELLO hello", 4)
