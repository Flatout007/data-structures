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

     attr_accessor(:length);

     def initialize(length = 0, hash_arr = {})
          @length = length || hash_arr.length;
          @hash_arr = hash_arr;
     end

     def set(position, value)
          self[position-1] = value;
     end
     
     def [](index)
          @hash_arr[index];
     end

     def []=(index, value)
          @hash_arr[index] = value;
     end

     def reverse

          left = 0;
          right = self.length-1;

          while left <= right

               tmp1 = self[right];
               tmp2 = self[left];
               
               self[right] = tmp2;
               self[left] = tmp1;

               left+=1;
               right-=1;
          end
     end

     def delete(position)
   
          i = position-1;
          del_value = self[i];

          while i < self.length-1

               self[i] = self[i+1];

               i+=1;
          end

          @length-=1;

          del_value;
     end

     def insert(position, value)

          i = self.length;

          loop do 

               if i === position-1
                    self[i] = self[i-1];
                    break;
               end

               self[i] = self[i-1];

               i-=1;
          end

          self[i] = value;

          @length+=1;
     end

     def append(value)

          self[self.length] = value;

          @length+=1;
     end
     
     def self.merge(arr_a, arr_b)

          output = ArrayADT.new;
          p1 = 0;
          p2 = 0;
          
          while p1 != arr_a.length && p2 != arr_b.length

               if arr_a[p1] < arr_b[p2]
                    output.append(arr_a[p1]);
                    p1+=1;
               else
                    output.append(arr_b[p2]);
                    p2+=1
               end
          end

          while p2 != arr_b.length

               output.append(arr_b[p2]);

               p2+=1;
          end

          while p1 != arr_a.length

               output.append(arr_a[p1]);

               p1 += 1;
          end

          output;
     end     
end
 

