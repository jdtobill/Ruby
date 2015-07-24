def caesar_cipher(string,shift_left_by)
	upCase=('A'..'Z').to_a
	downCase=('a'..'z').to_a
	fixed_string=String.new
	
	
	string.each_char do |character|
		if upCase.include?(character)
			fixed_string << upCase[upCase.index(character)-shift_left_by]
		elsif downCase.include?(character)
			fixed_string << downCase[downCase.index(character)-shift_left_by]
		elsif character==" "
			fixed_string << " "
		else
			fixed_string << character
		end
	end
	
	puts fixed_string
end

caesar_cipher("When I sleep, I zzz",3)
caesar_cipher("aaa",1)
			
	
	