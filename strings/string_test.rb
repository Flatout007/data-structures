require_relative "string_quiz.rb"
require_relative "../quotes.rb"

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

    unless success
        raise RuntimeError.new("Test failed");
        return false;
    end

    true;
end

$count_correct = 0;
$test_count = 0;

print "\n";
puts "Test #{$test_count+1}:"

it ("should allocate a new StringADT into memory") {

    $test_count+=1;
    assert_count = 0;
    s = StringADT.new

    assert_count += 1 if assert? s.instance_of? StringADT;

    $count_correct += 1 if assert_count === 1;
}

print "\n";
puts "Test #{$test_count+1}:"

it ("#length should be the amount of characters in the :characters property") do
    
    $test_count+=1;
    s = StringADT.new "hello";
    assert_count = 0;

    it ("should have a #length property") {
        assert_count+=1 if assert? s.length != nil;
    }

    assert_count+=1 if assert?(s.length === s.characters.length);

    $count_correct += 1 if assert_count === 2;
end

print "\n";
puts "Test #{$test_count+1}:"

it ("#transform should turn string input into an array of characters") do
    $test_count+=1;
    assert_count = 0;
    str = "hello"
    s = StringADT.new("hello");
    correct = 0;

    it ("should have a working :characters property that calls #transform to turn into array of characters after initialization") {
        s = StringADT.new "hello world";
        key = "hello world";
        assert_count = 0;
        count_check = 0;

        i=0;
        until s[i] === nil

            unless s[i] != key[i]
                count_check+=1;
            end

            i+=1;
        end
        
        assert_count += 1 if assert? count_check === key.length;
    }


    it ("#transform should be a protected method") {
        assert_count += 1 if assert? StringADT.protected_method_defined?(:transform); 
    }

    i = 0;
    until i === s.length
        correct += 1 if s[i] = str[i];

        i+=1;
    end

    assert_count += 1 if assert? correct === str.length;

    $count_correct += 1 if assert_count === 3;
end

print "\n";
puts "Test #{$test_count+1}:"

it ("#change_case(:symbol) should change the case of string based on the :lowercase or :uppercase symbol given") do
    
    $test_count+=1;
    s1 = StringADT.new "hello world";
    s2 = StringADT.new "HELLO WORLD";
    s3 = StringADT.new "zello worlz";
    key1 = "HELLO WORLD";
    key2 = "hello world";
    key3 = "zello worlz";
    count_check = 0;
    assert_count = 0;
    s1.change_case(:uppercase);
    s2.change_case(:lowercase);
    s3.change_case(:lowercase);

    it("should have a #change_case method") {
        assert_count += 1 if assert? s1.method(:change_case) != nil;
    }
    
    i=0;
    until i === key1.length

        unless s1[i] != key1[i] || s2[i] != key2[i] || s3[i] != key3[i];
            count_check+=2;
        end

        i+=1;
    end

    assert_count += 1 if assert? count_check === (key2.length + key1.length);

    $count_correct += 1 if assert_count == 2;
end


print "\n";
puts "Test #{$test_count+1}:"

it ("#toggle_case should switch the case for all entries in string") do
    
    $test_count+=1;
    count_check = 0;
    s = StringADT.new("hEL LO");
    key = "Hel lo";
    assert_count = 0;

    it ("should have a #toggle_case method") {
        assert_count+=1 if assert? s.method(:toggle_case) != nil;
    }

    s.toggle_case;

    i=0;
    until s[i] === nil

        count_check+=1 if s[i] === key[i];
        
        i+=1;
    end

    assert_count+=1 if assert? count_check === key.length;

    $count_correct+=1 if assert_count === 2;
end

print "\n";
puts "Test #{$test_count+1}:"

it ("StringADT::count_words(characters) should return the count of non-symbol character sets ('words') made up of 
	english characters seperated by 1 or any whitespaces. 
	There are no trailing or leading whitespaces") do
    
    $test_count+=1;
    assert_count=0;
    count_check=0;
    s = StringADT.new("hhh   h          jjj");
    key = 3;

    it ("should have a StringADT::count_words method") {
        assert_count += 1 if assert? StringADT.method(:count_words) != nil;
    }

    assert_count += 1 if assert? StringADT.count_words(s) === key;

    $count_correct+=1 if assert_count === 2;
end

print "\n";
puts "Test #{$test_count+1}:"

it ("#chop should remove, and only remove leading or trailing whitespaces") do

    $test_count+=1;
    assert_count = 0;
    count_check = 0;
    s = StringADT.new "       hello world   ";
    key = "hello world";
    count_check_new_s = 0;

    new_s = s.chop;

    it ("should have a #chop method") {
        assert_count+=1 if assert? s.method(:chop) != nil;
    }

    i=0;
    until i === key.length
        if s[i] === key[i]
            count_check+=1;
        end

        i+=1;
    end

    assert_count+=1 if assert? count_check === key.length

    $count_correct+=1 if assert_count === 2;
end

print "\n";
puts "Test #{$test_count+1}";

it ("StringADT::validate should return true if and only if string contains only numbers and/or letters; no symbols or spaces.
	Return false otherwise.") do
	
	$test_count += 1;
	assert_count = 0;
	str_1 = "Hello? World!";
	str_2 = "helloWorld007";
	key_1 = false;
	key_2 = true;
	
	it ("should have a StringADT::validate method") {
		assert_count+=1 if assert? StringADT.method(:validate);	
	}
    
    assert_count+=1 if assert? StringADT.validate(str_1) === key_1 && StringADT.validate(str_2) === key_2;
    
    $count_correct += 1 if assert_count === 2;
end

$test_count;
generate = Random.new;
quotes = Quotes.new;
shaxx_quotes_fail = quotes.shaxx_quotes[0];
random_quote_fail = shaxx_quotes_fail[generate.rand(shaxx_quotes_fail.length-1)];
shaxx_quotes_win = quotes.shaxx_quotes[1];
random_quote_win = shaxx_quotes_win[generate.rand(shaxx_quotes_win.length-1)];

print "\n";
print "Status:";

unless $count_correct < $test_count
    puts "\x1b[32m All #{$count_correct}\x1b[0m / \x1b[32m#{$test_count} test cases accepted.\n\n\x1b[40m\x1b[32mLord Shaxx:\x1b[36m '#{random_quote_win}' \x1b[0m";
else
    puts " Only\x1b[31m #{$count_correct}\x1b[0m / \x1b[32m#{$test_count}\x1b[0m test cases accepted. Try again.\n\n\x1b[40m\x1b[31mLord Shaxx:\x1b[33m '#{random_quote_fail}' \x1b[0m";
end

print "\n";