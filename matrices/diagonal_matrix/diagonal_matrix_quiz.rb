
class D_Matrix

	attr_accessor :length, :A

	def initialize(length = 0, arr = [])

		@length = length;
		@A = arr;
	end

	def []=(val, index)
		@A[index] = val
	end
	
	def [](index)
		@A[index]
	end
    
	def set(i, j, val)

		if (i===j)
			@A[i-1] = val;
		end
	end

	def get(i, j)

		if (i===j)
			return @A[i-1]
		else
			return 0;
		end
	end

	def display

		str = "";
		
		i=0; 
		until i === @length

			j=0;
			until j === @length
				
				if i === j
					str += @A[i].to_s;
				else
					str += 0.to_s;
				end

				j+=1;
			end

			if i != @length-1 
				str += "\n";
			end

			i+=1;
		end

		str;
	end
end