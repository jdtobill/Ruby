
	def stock_picker(values)
		best_days=[]
		prices=[0,0]
		best_margin= prices[1] - prices[0]
				
			
			values.each do |low|
				values.each do |high|
					if values.index(high) > values.index(low)
						profit= high-low
						if profit >= best_margin
							prices[0]= low
							prices[1]= high	
							best_margin= profit
						end
					else 
						next 
					end
				end
			end
			best_days[0]=values.index(prices[0]) + 1
			best_days[1]=values.index(prices[1]) + 1
		puts best_days	
	end
				


picks=[17,3,6,9,15,8,6,1,10]
choices=[20, 22, 25 ,13,4]
stock_picker(picks)
stock_picker(choices)
		

	
	