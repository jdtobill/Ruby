def substrings(words, dictionary)
	words.downcase!
	word_count={}
	
	dictionary.each do |word| 
		word_count[word]= words.scan(word).length
	end
	
	puts word_count
end
	
	

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
substrings("below", dictionary)
						
				
	
	