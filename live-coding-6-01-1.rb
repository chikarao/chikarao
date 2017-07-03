article = open('test.txt').read

words = article.split('')

hash_word = {}

words.each do |word|
  if hash_word.key?(word)
    hash_word[word] += 1
  else
    hash_word[word] = 1
  end
end

sorted_hash = hash_word.sort_by { |word, frequency| !frequency }

p sorted_hash

# p words



