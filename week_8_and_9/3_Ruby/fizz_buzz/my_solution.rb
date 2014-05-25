# U3.W8-9: 


# I worked on this challenge [by myself].

# 2. Pseudocode

# Define method super_fizbuzz that takes one argument, an array
# Iterate over the array and check if each element is a multiple of 15, 5, 3
#  - use each_with_index to reference and replace the corresponding element
# return the array


# 3. Initial Solution

def super_fizzbuzz(array)
	raise ArgumentError.new ("Argument must be an array!") unless array.is_a?(Array)
	array.each_with_index do |num, i|
		if num % 15 == 0
			array[i] = "FizzBuzz"
		elsif num % 5 == 0
			array[i] = "Buzz"
		elsif num % 3 == 0
			array[i] = "Fizz"
		end
	end
	return array
end



# 4. Refactored Solution

# My solution is accurately refactored. The code is DRY and reads well. I added some
# error handling to ensure that users understand the method must take an array, not 
# just a single integer. 

p super_fizzbuzz([1,2,3])  # => [1, 2, "Fizz"]
p super_fizzbuzz([1,2,5])  # => [1, 2, "Buzz"]
p super_fizzbuzz([1,2,15]) # => [1, 2, "FizzBuzz"]
p super_fizzbuzz([30, 9, 20, 1]) # => ["FizzBuzz", "Fizz", "Buzz", 1]
p super_fizzbuzz(20)


# 1. DRIVER TESTS/ASSERT STATEMENTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

def random_input_array(base, size)
  (1..size).map { |i| base**(1+rand(15)) }
end
 
assert { super_fizzbuzz(random_input_array(3,100)) == ["Fizz"]*100 }
 
assert { super_fizzbuzz(random_input_array(5,100)) == ["Buzz"]*100 }

assert { super_fizzbuzz(random_input_array(15, 100)) == ["FizzBuzz"]*100 }

assert { super_fizzbuzz([1,2,3]) == [1,2,'Fizz'] }

assert { super_fizzbuzz([15, 5, 3, 1]) == ['FizzBuzz', 'Buzz', 'Fizz', 1] }


# 5. Reflection 

# This was a pretty easy solution, especially when compared to the fibonacci sequence
# challenege. each_with_index has become my favorite way to traverse arrays - it is 
# very nice to have access to the index while manipulating the data. 