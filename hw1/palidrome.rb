def palindrome?(string)
	string = string.downcase.gsub(/[^a-z]/i,'')
	string == string.reverse
end
