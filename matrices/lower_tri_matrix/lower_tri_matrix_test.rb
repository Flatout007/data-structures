require_relative "lower_tri_matrix.rb"
require_relative "../../quotes.rb"

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

$test_count = 0;
$count_correct = 0;

# begin writing test cases here!


print "\n"
puts "Test: #{$test_count += 1}";

it ("should set a single dimension array :A as a property to represent the two dimensional matrix :Lower_Tri into memory") do

    lower_tri = Lower_Tri.new;
    assert_count = 0;

    if assert? lower_tri.A.instance_of?(Array) && !(lower_tri.A[0].instance_of?(Hash)) && !(lower_tri.A[0].instance_of?(Array))
        assert_count += 1;
    end

    $count_correct += 1 if assert_count === 1;
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("should have a :length property that defaults to 0") do
    
    m = D_Matrix.new();
    assert_count = 0;

    assert_count += 1 if assert? m.length === 0

    $count_correct += 1 if assert_count === 1;
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("should have a #:set(i, j, value) method that sets a non 0 value based on the user given position (i.e non 0 indexed)") do

    assert_count = 0;
    lower_tri = Lower_Tri.new 
    i = 2-1, j = 1-1;
    lower_tri.set(i, j, 100);
    formula = i * (i-1) / 2 + j-1;

    assert_count += 1 if lower_tri.A[formula] === 100;

    $count_correct += 1 if assert_count === 1;
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("should have a #:get(i, j) method that returns the value based on the user given position (i.e non 0 indexed)") do

    assert_count += 1;
    lower_tri = Lower_Tri.new;
    i = 2-1, j = 1-1;
    lower_tri.set(i, j, 1000);

    assert_count += 1 if lower_tri.get(2, 1) === 1000; 

    $count_correct += 1 if assert_count === 1;
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("should have a #:display() method that returns a line breaking string representation of :Lower_Tri with line breaks after each row") do

    assert_count = 0;
    arr = [1,2,2,3,2,3,2,3,3,4];
    lower_tri = Lower_Tri.new(4);
    k = 0;
    
    str = "1000\n2200\n3230\n2334\n";

    until i === 4 * (4-1) / 2

        if (i < j)
            lower_tri.set(i, j, 0);
        else
            lower_tri.set(i, j, arr[k])
            k+=1;
        end

        i+=1;
    end

    assert_count += 1 if str === lower_tri.display;

    $count_correct += 1 if assert_count === 1;
end

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
