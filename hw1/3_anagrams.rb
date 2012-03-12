def combine_anagrams(words)
	words.group_by {|word| word.downcase.chars.sort}.inject([]) { |h, (k, v)| h.push(v) }
end
