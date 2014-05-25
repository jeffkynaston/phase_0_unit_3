# U3.W8-9: 


# I worked on this challenge [by myself].

# 2. Pseudocode

# possibly make an array holding a significant number of fibonacci values and check it against that 
# From wikipedia -  a positive integer x is a fibonacci number  if and only if one or both of 
# 5x^2+4 or 5x^2-4 is a perfect square.
# evaluation each equation, take the sqrt and then re-square to see if either is a perfect square

# 3. Initial Solution

# def is_fibonacci? (num)
# 	puts "You Entered #{num}..."
# 	equation1 = 5 * num**2 + 4
# 		puts "equation 1 result: #{equation1}"
# 	equation2 = 5 * num**2 - 4
# 		puts "equation 2 result: #{equation2}"
# 	check1_sqrt = Math.sqrt(equation1).floor
# 		puts "equation 1 sqrt: #{check1_sqrt}"
# 	check2_sqrt = Math.sqrt(equation2).floor
# 		puts "equation 2 sqrt: #{check2_sqrt}"
# 	check1 = check1_sqrt**2
# 		puts "check1: #{check1}"
# 	check2 = check2_sqrt**2
# 		puts "check2: #{check2}"
	
# 	if equation1 == check1 || equation2 == check2
# 		puts "Boo-Ya, this is a fibonacci number!"
# 		return true
# 	else
# 		puts "Not a Fibonacci number!"
# 		return false
# 	end
# end

# floating points not large enough to caclculate sqrt accurately

require 'bigdecimal'

def is_fibonacci? (num)
	big_num = BigDecimal.new(num)
	equation1 = 5 * big_num**2 + 4
	equation2 = 5 * big_num**2 - 4
	check1_sqrt = equation1.sqrt(100)
	check2_sqrt = equation2.sqrt(100)
	check1 = check1_sqrt**2
	check2 = check2_sqrt**2
	
	if equation1 == check1 || equation2 == check2
		puts "Boo-Ya, this is a fibonacci number!"
		return true
	else
		puts "Not a Fibonacci number!"
		return false
	end
end

p is_fibonacci?(832040)

# 4. Refactored Solution

# $fib_sequence = [0,1]
# 500.times do 
# 	$fib_sequence.push ($fib_sequence[-1] + $fib_sequence[-2])
# end

# puts "fib_sequence is #{$fib_sequence}"

# def is_fibonacci?(num)
# 	$fib_sequence.include?(num)
# end

##hinghuyng's solution for comparison

# def is_fibonacci?(num)
# 	arr = [0,1]
# 	while arr[-1] < num
# 		arr << arr[-1] + arr[-2]
# 	end
# 	arr.include?(num)
# end




# 1. DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

def random_fibonacci
   [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946].sample
end


assert {is_fibonacci?(random_fibonacci) == true}
assert {is_fibonacci?(8670007398507948658051921) == true}
assert {is_fibonacci?(random_fibonacci+100) == false}
assert {is_fibonacci?(927372692193078999171) == false}




# 5. Reflection 

# This solution took me for a bit of a ride. I knew that it could be solved easily
# using an array with the fibonacci sequence already populated, but I read the wikipedia
# article and wanted to try it using the perfect square method. Logically it wasn't that
# different, but checking to see if a number was a perfect square was harder than I
# anticipated. The floating point data type wont' calculate numbers with enough accuracy
# to check if a large integer is part of the fib sequence, so I ended up having to use 
# the bigdecimal datatype.

# If i was to refactor my initial solution, I think I would factor out some complexity - 
# possibly make separate methods for performing the calculations and for checking to see if 
# a number is a perfect square. Instead, I solved it a different way in my re-factoring, creating
# a global variable to hold the fib sequence and then checking it against that. I also included
# hinghuyng's solution because it was slightly different - creating a fib sequence on the fly
# during each method run. 

# My big take away from this challenge is that there are a lot of different ways to do 
# the same thing in ruby. Depending on the use case, it might be more effective to solve 
# a problem with some fancy math, or by creating and storing an array to check against. If
# you do use an array, you can hold a large one globally, or choose to create small ones ad-hoc
# with only as much data as you need for the current calculation.