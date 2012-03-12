def palindrome?(string)
	string = string.downcase.gsub(/[^a-z]/i,'')
	string == string.reverse
end

def count_words(string)
	string.downcase.gsub(/[^a-z]/i,' ').split.inject(Hash.new 0) { |counts, word| counts[word]  += 1; counts }
end
