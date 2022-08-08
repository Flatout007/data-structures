<<-DOC
:implements => {
 ArrayADT with dynamic size.
 The ArrayADT must have the following operation methods
 and properties.
}
:method => (set), :method => (reverse), :method => (delete), 
:method => (append), :method => (insert), :method => (merge)

:property => {length}, :property => {hash_arr}
*/
DOC

class ArrayADT

    attr_accessor :length

    def initialize length = 0, hash_arr = {}
        @length = length;
        @A = hash_arr;
    end

    def [] key 
        @A[key]
    end

    def []= key, value
        
        unless @A[key] = nil
        		@A[key] = value;
        		@length += 1;
        	else
        		@A[key] = value;
        	end
    end
        
    end 

    def set position, value
        self[position-1] = value;
    end

    def reverse 
        
        left = 0;
        right = self.length-1;

        until left > right

            temp = self[left];

            self[left] = self[right];

            self[right] = temp;

            left+=1;
            right-=1;
        end
    end

    def delete position
        
        index = position-1
        deleted_value = self[index];
        left = index;
        right = index+1;

        until left === self.length-1;

            self[left] = self[right];
            
            left+=1;
            right+=1;
        end
        
        self.length-=1;

        deleted_value;
    end

    def insert position, value

        left = self.length-1;
        right = self.length;
        index = position-1;

        loop do
           self[right] = self[left];

           break if left === index;

           left-=1;
           right-=1;
        end
        
        self[left] = value;

        self.length+=1;

        self;
    end

    def append value
        
        self[self.length] = value;

        self.length+=1;
    end

    def self.merge arr_a, arr_b

        arr_c = ArrayADT.new (arr_a.length + arr_b.length);
        p1 = 0;
        p2 = 0;
        p3 = 0;

        while p1 < arr_a.length && p2 < arr_b.length
            
            unless arr_a[p1] > arr_b[p2]
                arr_c[p3] = arr_a[p1];
                p1+=1;
            else
                arr_c[p3] = arr_b[p2];
                p2+=1;
            end
            
            p3+=1;
        end

        until p1 === arr_a.length
            
            arr_c[p3] = arr_a[p1];

            p1+=1;
            p3+=1;
        end

        until p2 === arr_b.length

            arr_c[p3] = arr_b[p2];

            p2+=1;
            p3+=1;
        end

        p arr_c;
    end
            
        
        
end
