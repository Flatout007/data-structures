require_relative "diagonal_matrix_quiz.rb"
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


print "\n"
puts "Test: #{$test_count += 1}";

it ("should allocate a single dimension array that represents the diagonal matrix D_Matrix into memory. D_Matrix must have a :length and :A (array) properties.")  do 
	m = D_Matrix.new();
	assert_count = 0;
    
	assert_count += 1 if assert? m.A.instance_of?(Array) && !(m.A[0].instance_of?(Hash) && !(m.A[0].instance_of?(Array);

    ));       
	
	$count_correct += 1 if assert_count === 1;        
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("should have a length property that defaults to 0") do
    
    m = D_Matrix.new();
    assert_count = 0;

    assert_count += 1 if assert? m.length === 0

    $count_correct += 1 if assert_count === 1;
end
    

print "\n"
puts "Test: #{$test_count += 1}";

it ("#set(i, j, val) should set a non zero integer in D_Matrix if and only if location {i,j} is apart of the main diagonal of a 4x4 matrix.") do
    
    assert_count = 0;
    m = D_Matrix.new(4);
    count = 0;
    i=2; 
    j=2;

    m.set(i, j, 100);
    
    assert_count += 1 if assert? m[i-1] == 100;
    
    $count_correct += 1 if assert_count === 1;
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("#get(i, j) should return a non zero value if and only if location {i,j} is apart of the main diagonal of a 4x4 matrix. Should return 0 or nil otherwise") do

    m = D_Matrix.new(4);
    assert_count = 0;
    
    m.set(1,1,1000);
    m.set(2,2, 9000);
    m.set(3,3, 8000);
    m.set(4,4, 7000)
    
   if assert? m.get(1,1) === 1000 && m.get(2,2) === 9000 && m.get(3,3) === 8000 && m.get(4,4) === 7000 && 
      (m.get(1,3) === 0 || m.get(1,3) === nil)

      assert_count += 1;
   end

   $count_correct += 1 if assert_count === 1;
end

print "\n"
puts "Test: #{$test_count += 1}";

it ("#display should return a line breaking string reprensentation of a 4X4 diagonal matrix") do

    m = D_Matrix.new(4);
    assert_count = 0;

    m.set(1,1,1);
    m.set(2,2,2);
    m.set(3,3,3);
    m.set(4,4,4);

    str = m.display();

    assert_count += 1 if assert? str === "1000\n0200\n0030\n0004\n" || str === "1000\n0200\n0030\n0004";

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




































