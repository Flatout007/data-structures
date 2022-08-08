<<-DOC
:implements => {
 StringADT with dynamic size.
 The StringADT must have the following operation methods
 and properties.
}

:method => (chop), :method => (change_case), :method => (transform)
:method => (toggle_case), :method => (display), class::method => (count_words),
class::method => (validate)

:property => {...characters}, :property => (length)
*/
DOC

class StringADT

    attr_accessor :characters, :length;
    
    def initialize(characters = [], length = 0)
        @characters = [];
        self.length = length;
        self.transform(characters);
    end

    protected;
        def transform characters
            ptr = 0;

            until characters[ptr] === nil

                @characters[ptr] = characters[ptr];

                ptr+=1;
            end

            @length = @characters.length;
        end
        
    public;
        def [](key)
            @characters[key];
        end

        def []=(key, value)

            @characters[key] = value;

            @chararcters;
        end
        
        def change_case(symbol=:uppercase)
            
            unless symbol != :uppercase

                i=0;
                until @characters[i] === nil

                    code = @characters[i].ord;

                    unless code < 97 || code > 122
                        @characters[i] = (code-32).chr;
                    end

                    i+=1;
                end

            else

                i=0;
                until @characters[i] === nil
                    
                    code = @characters[i].ord;

                    unless code < 65 || code > 90
                        @characters[i] = (code+32).chr;
                    end
                
                    i+=1;
                end
            end
        end

        def toggle_case

            i=0;
            until @characters[i] === nil

                code = @characters[i].ord

                unless code < 97 || code > 122                    
                    @characters[i] = (code-32).chr;
                end

                unless code < 65 || code > 90
                    @characters[i] = (code+32).chr;
                end

                i+=1;
            end
        end
        
        def self.count_words(s)

            count = 1;

            return 0 if s.length <= 0;

            i=0;
            until s[i] === nil
                
                if s[i] === " " && s[i-1] != " "
                    count+=1;
                end

                i+=1;
            end

            count;
        end

        def chop

            length = self.length
            delete_count = 0;
            first_char_index = 0; 

            i=0;
            until self[i] != " "
                i+=1;
            end

            first_char_index = i;

            until self[i] === nil

                self[i-first_char_index] = self[i];
                
                self[i] = nil;

                i+=1;
            end

            j=@characters.length-1;
            loop do 

                if self[j] == " "

                    self[j] = nil;

                    delete_count+=1;

                elsif self[j] == nil

                    delete_count+=1;
                else 

                    break;
                end

                j-=1;
            end

            @length -= delete_count;

            @characters.compact!;

            @characters
        end
        
        def self.validate str
        	
        	i = 0;
        	until str[i] === nil
        		
        		# if not lower case, uppercase, and/or decimal, return false;
        		if  !(str[i].ord >= 97 && str[i].ord <= 122) && 
        			!(str[i].ord >= 65 && str[i].ord <= 90) && 
        			!(str[i].ord >= 48 && str[i].ord <= 57)    
        		    return false;
        	 	end
        	 	
        	 	i+=1;
         	end
         	
         	true;
        end
        		    

               	
        	    

end


