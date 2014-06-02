# U3.W8-9: Numbers to English Words


# I worked on this challenge [by myself].

# 2. Pseudocode

# 1) Define method num_to_word that takes one argument, an integer
# 2) Create a case statement that handles irregular numbers
#    - return correct word in english for each irregular numer
# 2) change number to string and split it apart into an array
# 3) assign variables ones_digit and tens_digit using array.last and array.first methods
# 4) create a case statement to assign the one's digit to a variable, ones_word
# 5) if the number is only one digit, return ones_word
# 6) create a case statement to assign the ten's digit to a variable, tens_word
# 7) if the second digit is 0, return tens_word
# 8) else, return tens_word, plus a space, then ones_word


# 3. Initial Solution


def num_to_word (num)

	# irregular numbers
	case num
		when 10
			return "ten"
		when 11
			return "eleven"
		when 12
			return "twelve"
		when 13
			return "thirteen"
		when 14
			return "fourteen"
		when 15
			return "fifteen"
		when 16
			return "sixteen"
		when 17
			return "seventeen"
		when 18
			return "eighteen"
		when 19
			return "nineteen"
	end

	#normal numbers
	array = num.to_s.split("")
	ones_digit = array.last
	if array.length > 1
		tens_digit = array.first
	end


	case ones_digit
		when "1"
			ones_word = "one"
		when "2"
			ones_word = "two"
		when "3"
			ones_word = "three"
		when "4"
			ones_word = "four"
		when "5"
			ones_word = "five"
		when "6"
			ones_word = "six"
		when "7"
			ones_word = "seven"
		when "8"
			ones_word = "eight"
		when "9"
			ones_word = "nine"
		when "0"
			ones_word = ""
	end

	return ones_word if array.length == 1

	case tens_digit
		when "1"
			tens_word = "one"
		when "2"
			tens_word = "twenty"
		when "3"
			tens_word = "thirty"
		when "4"
			tens_word = "fourty"
		when "5"
			tens_word = "fifty"
		when "6"
			tens_word = "sixty"
		when "7"
			tens_word = "seventy"
		when "8"
			tens_word = "eighty"
		when "9"
			tens_word = "ninety"
	end

	return tens_word if ones_word == 0

	return "#{tens_word} #{ones_word}"


end



puts num_to_word(4)
puts num_to_word(16)
puts num_to_word(67)

puts num_to_word(7)

# 4. Refactored Solution

# my solution is pretty long but I didn't see a way to get around using big if/then or case statements. 
# Once I started looking into other peoples solutions, it looks like you could use a hash to hold the 
# english word values, but my way worked fine too. Other than the case statements, the logic of my method is simple and DRY. 




# 1. DRIVER TESTS/ASSERT STATEMENTS GO BELOW THIS LINE

def assert
	raise "Assertion Failed!" unless yield
end

assert {num_to_word(4) == "four"}
assert {num_to_word(16) == "sixteen"}
assert {num_to_word(67) == "sixty seven"}


# 5. Reflection 

# For numbers 1 - 100, there were a lot of cases that we have to account for. There is a lot more room for
# re-using code once we get to higher numbers, and I can see a lot of benefit to separating out the code into 
# multiple methods. After researching, I also found a ruby gem that does exactly what we're looking for:

require 'numbers_and_words'