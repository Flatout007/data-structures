require_relative "array_quiz_struct.rb"
require_relative "../quotes.rb"

KEY_COUNT = 8;

def it brief, &block

    begin
        
        block.call;

        puts "\x1b[32m\u2714 \ #{brief} \x1b[0m";

    rescue StandardError => error
        
        puts "\x1b[31m\u2718 \ #{brief} \x1b[0m";

        puts "Test failed: #{error.message}";
    end
end

def assert? success

    if !success
        raise RuntimeError.new("Test failed");
    end

    true;
end

print "\n";
puts "Test 1:"

$count_correct = 0;

it ("should allocate a new ArrayADT object in memory") {
    
    a = ArrayADT.new(0);
    $count_correct += 1 if assert? a.instance_of? ArrayADT
}

print "\n";
puts "Test 2:"

it ("should have a length property that defaults to 0") {

    # TODO: fix :length property so it scales with #append(value) and other :methods

    a = ArrayADT.new 10;
    $count_correct += 1 if assert? a.length === 10;
}

print "\n";
puts "Test 3:"

it("#set(position, value) overwrites an existing value in ArrayADT") do
     
    a1 = ArrayADT.new;
    a2 = ArrayADT.new;
    test_count = 0;

    a1.set 1, 1;
    a2.set 2, 100;

    it ("should have a #set method") {
        
        a = ArrayADT.new 10;
        test_count += 1 if assert? a.method(:set);
    }

    test_count += 1 if assert? (a1[0] === 1) && (a2[1] === 100);

    $count_correct += 1 if test_count === 2;
end

print "\n";
puts "Test 4:"

it ("#reverse should reverse elements, but not return anything") do

    a = ArrayADT.new 5;
    test_count = 0;

    it ("should have a #reverse method") {
        test_count += 1 if assert? a.method(:reverse);
    }
    
    it ("#reverse should reverse the elements in array") {
        
        a1 = ArrayADT.new 5, {0=>1, 1=>2, 2=>3, 3=>4, 4=>5};
        a2 = ArrayADT.new 5, {0=>5, 1=>4, 2=>3, 3=>2, 4=>1};
        check_count = 0;

        a1.reverse;

        i = 0;
        until i === a2.length

            if a1[i] === a2[i]
                check_count+=1;
            end

            i+=1;
        end

        test_count += 1 if assert? check_count === a2.length;
    }

    test_count += 1 if assert? a.reverse === nil;

    $count_correct += 1 if test_count === 3;
end

print "\n";
puts "Test 5:"

it ("#delete(position) should remove a value at the user given position i.e (non 0 indexed)") do
    
    a1 = ArrayADT.new 5, {0=>1, 1=>2, 2=>3, 3=>4, 4=>5};
    a2 = ArrayADT.new 4, {0=>2, 1=>3, 2=>4, 3=>5};
    a3 = ArrayADT.new 5, {0=>1, 1=>2, 2=>3, 3=>4, 4=>5};
    a4 = ArrayADT.new 4, {0=>1, 1=>2,  2=>4, 3=>5};
    check_count = 0;
    test_count = 0;

    it ("should have a #delete(position) method") {
        test_count += 1 if assert?(a1.method(:delete) != nil);
    }

    a1.delete 1;
    a3.delete 3;

    it ("should correctly decrement :length") {
        test_count += 1 if assert?(a1.length === a2.length);
    }

    i = 0;
    until i === a1.length
        unless a1[i] != a2[i]
            check_count+=1;
        end
        
        unless a3[i] != a4[i]
        	check_count += 1;
        end

        i+=1;
    end
	
    test_count += 1 if assert?(check_count === a2.length + a4.length);

    $count_correct += 1 if test_count === 3;
end

print "\n";
puts "Test 6:"

it ("#insert(position, value) should insert a value at the user given position i.e (non 0 indexed) in array") do
    
    a1 = ArrayADT.new 5, {0=>1, 1=>2, 2=>3, 3=>4, 4=>5};
    a2 = ArrayADT.new 6, {0=>1, 1=>2, 2=>100, 3=>3, 4=>4, 5=>5};
    count_check = 0;
    test_count = 0;

    it ("should have a #insert(position, value) method") {
        test_count += 1 if assert? a1.method(:insert) != nil;
    }

    a1.insert(3, 100);
    
    length_after = a1.length

    i=0;
    until i === a2.length
        
        unless a2[i] != a1[i]
            count_check += 1;
        end

        i+=1;
    end

    test_count += 1 if assert? count_check === a2.length;

    it ("should correctly increment the :length property") { 
        test_count += 1 if assert? length_after === a2.length;
    }

    $count_correct += 1 if test_count === 3;
end

print "\n";
puts "Test 7:"

it ("#append(value) should add an element to the end of array") do
    
    a1 = ArrayADT.new 5, {0=>1, 1=>2, 2=>3, 3=>4, 4=>5};
    a2 = ArrayADT.new 6, {0=>1, 1=>2, 2=>3, 3=>4, 4=>5, 5=>100};
    count_check = 0;
    test_count = 0;

    a1.append(100);
    
    length_after = a1.length;

    i=0;
    until i === a1.length

        unless a1[i] != a2[i]
            count_check+=1;
        end

        i+=1;
    end

    it ("should have an #append(value) method") {
        test_count += 1 if assert? a1.method(:append) != nil;
    }

    it ("should correctly increment the :length property") {
        test_count += 1 if assert? length_after === a2.length;
    }

    test_count += 1 if assert? count_check === a2.length;

    $count_correct += 1 if test_count === 3;
end

print "\n";
puts "Test 8:"

it ("ArrayADT::merge(arr_a, arr_b) should merge two sorted arrays and mantain ascending order") do
    
    # TODO: add test case with different lengths for A[] and B[]

    arr = ArrayADT.new 6;
    arr_a = ArrayADT.new 3,{0=>1, 1=>3, 2=>4};
    arr_b = ArrayADT.new 3,{0=>2, 1=>5, 2=>6};
    arr_c = ArrayADT.new 6,{0=>1, 1=>2, 2=>3, 3=>4, 4=>5, 5=>6};
    count_check = 0;
    test_count = 0;

    it ("should have a ArrayADT::merge(arr_a, arr_b) method") {
        test_count += 1 if assert? ArrayADT.method(:merge);
    }

    arr = ArrayADT.merge(arr_a, arr_b);

    it ("should return a new arrayADT") {
        test_count += 1 if assert? arr.instance_of? ArrayADT;
    }

    i=0;
    until i === arr_c.length
        
        unless arr[i] != arr_c[i]
            count_check+=1;
        end

        i+=1;
    end

    test_count += 1 if assert? count_check === arr_c.length;

    $count_correct += 1 if test_count === 3;
end

generate = Random.new;
quotes = Quotes.new;
shaxx_quotes_fail = quotes.shaxx_quotes[0];
random_quote_fail = shaxx_quotes_fail[generate.rand(shaxx_quotes_fail.length-1)];
shaxx_quotes_win = quotes.shaxx_quotes[1];
random_quote_win = shaxx_quotes_win[generate.rand(shaxx_quotes_win.length-1)];

print "\n";
print "Status:";

unless $count_correct < KEY_COUNT
    puts "\x1b[32m All #{$count_correct}\x1b[0m / \x1b[32m#{KEY_COUNT} test cases accepted.\n\n\x1b[40m\x1b[32mLord Shaxx:\x1b[36m '#{random_quote_win}' \x1b[0m";
else
    puts " Only\x1b[31m #{$count_correct}\x1b[0m / \x1b[32m#{KEY_COUNT}\x1b[0m test cases accepted. Try again.\n\n\x1b[40m\x1b[31mLord Shaxx:\x1b[33m '#{random_quote_fail}' \x1b[0m";
end

print "\n";