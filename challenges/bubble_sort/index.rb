def bubbleSort(unsorted_list)
	sort_until= unsorted_list.length - 1
	
	while sort_until > 0
	
		unsorted_list.each_with_index do |value, index|
			next_up= unsorted_list[index +1]
		
			if next_up.nil?
				break
			elsif value > next_up
				unsorted_list.insert(index + 1, unsorted_list.delete_at(index))
			else
				next
			end
		end
		sort_until-=1
	end
	puts unsorted_list
end

a=[9,8,7,6,5,4,3,2,1]

bubbleSort(a)

def bubble_sort_by(unsorted_list) 
	sort_until= unsorted_list.length-1
	
	while sort_until > 0
	
		unsorted_list.each_with_index do |value,index|
			next_up= unsorted_list[index + 1]
			
			if next_up.nil?
				break
			elsif yield(next_up, value) > 0
				unsorted_list.insert(index+1, unsorted_list.delete_at(index))
			else 
				next
			end
		end
		sort_until-=1
	end
	puts unsorted_list
end

bubble_sort_by(a) { |left_value,right_value| right_value - left_value}
			
			
		