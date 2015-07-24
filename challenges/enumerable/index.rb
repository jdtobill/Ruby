module Enumerable

	def my_each
		return self unless block_given?
		for x in self
			yield(x)
		end
	end
	
	
	
	def my_each_with_index
		return self unless block_given?
		index=0
		for x in self
			yield(x,index)
			index+=1
		end
	end
	
	
	def my_select
		return self unless block_given?
		arr=[]
		self.my_each do |x| 
			if yield(x)
				arr << x
			end
		end
		arr
	end
	
	
	def my_any?	
		if block_given?
			if self.my_select { |x| yield(x)}.length > 0
				true
			else
				false
			end
		else
			if self.my_select {|x| x== true}.length > 0
				true
			else
				false
			end
		end
	end
	
	
	def my_all?
		if block_given?
			if self.my_select { |x|	yield(x)} == self
				true
			else
				false
			end
		else
			if self.my_each
				true
			else
				false
			end
		end
	end
	
	
	
	
	def my_none?
		if block_given?
			if self.my_any? { |x| yield(x) }
				false
			else 
				true
			end
		else
			if self.my_each != true
				true
			else
				false
			end
		end
	end


	def my_count(y = nil)
		if y
			self.my_select { |x| x == y}.length
		elsif block_given?
			self.my_select { |x| yield(x)}.length
		else
			self.length
		end
	end
	
	
	def my_map()
		result=[]
		if block_given?
			self.my_each { |x| result << yield(x)}
			result
		else
			 self
		end
		
	end
	
	
	def my_inject(n= nil)
		x=n
		self.my_each { |y| x=yield(x,y)}
		x
	end
	
	def multiply_els(arr)
		arr.my_inject(1) {|a,b| a*b}
	end

		
		
	
end

##Test Cases

##Note:fix initial return for my_all? and my_none?

##my_each Test Case
##should return [2,4,6,8]
a=[1,2,3,4]
a.my_each do |y|
	puts y*2
	
end

##my_any? Test Case
puts "my_any?"
%w[ant bear cat].my_any? { |word| word.length >= 3} #=> true
%w[ant bear cat].my_any? { |word| word.length >= 4} #=> false
[nil,true, 99].my_any?								 #=>true


##my_all Test Case
puts "my_all?"
%w[ant bear cat].my_all? { |word| word.length >= 3} #=> true
%w[ant bear cat].my_all? { |word| word.length >= 4} #=> false
[nil,true, 99].my_all?								 #=> false

##my_none? Test Case
puts "my_none?"
%w{ant bear cat}.my_none? {|word| word.length == 5} #=> True
%w{ant bear cat}.my_none? {|word| word.length >= 4} #=> False
[].my_none?								      		 #=> True
[nil].my_none?										 #=> True
[nil,false].my_none?    							 #=> True


##my_count Test Cases
puts "my_count"
ary=[1,2,4,2]  
ary.my_count				#=>4
ary.my_count(2)				#=>2
ary.my_count { |x| x%2==0}	    #=>3

##my_map Test Cases
puts "my_map"
(1..4).my_map { |i| i*i}
(1..4).my_map {"cat"}

#my_inject Test Case
new=[]
puts new.multiply_els(ary)