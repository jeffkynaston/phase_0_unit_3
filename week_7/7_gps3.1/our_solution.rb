# U3.W7: Build an Electronic Grocery List!
 
# Your full names:
# 1. Amelia Downs
# 2. Vivek George
# 3. Jeff Kynaston
 
# User Stories (As many as you want. Delete the statements you don't need)
# As a user, I want to create a list
# As a user, I want to add items from list
# As a user, I want to remove items from list 
# As a user, I want to have quantities for each item
# As a user, I want to read my list
# As a user, I want to be able add the price of each item
# As a user, I want to sum the total price of the list
# As a user, I want to

# Pseudocode
# make grocery list class
# initialize method - sets up array or hash that would hold list, assign date
# add method - takes in item, qty
# remove method - takes in item, qty
# print list method - prints list of items and their qtys

# Your fabulous code goes here....


# Initially we were using a hash, but changed our code to make
# each list item an object instead. For this, i defined a new 
# class and gave it instance variables for each property I 
# wanted it to have. I added attr_ lines to make these instance
# variables accessible from outside the class.
class ListItem
	attr_accessor :name
	attr_reader :name
	attr_writer :name
	attr_accessor :qty
	attr_reader :qty
	attr_writer :qty
  def initialize(name, qty)
    @name = name
    @qty = qty
  end

# tihs ia alternative to using attr_ statements
  # def name
  #   @name
  # end

  # def qty
  # 	@qty
  # end

end

# This class represnts the grocery list. It has one a attribute, an array
# holding the items in the list. It has actions - add to the list, remove
# from the list, and print the list . @list was a hash, but I made it
# an array instead. This array holds ListItem objects. 
class GroceryList
  attr_reader :date_created
  def initialize
    @list = []
    @date_created = Time.now
  end
 
# To add a new item, push a new ListItem object to the @list array. 
# create this ListItem object with the proper parameters so it is
# initialized with those instance variables  
  def add (item, qty)
  	new_item = ListItem.new(item,qty)
  	@list.push (new_item)
  end
  
# to remove an item, traverse the @list array and look for any object
# whose instance variable @name is equal to the item you want to remove and
# then delete that element from the array.
# The @list array is holding ListItem objects, but we cannot refernce them
# by name. use each_with_index so we can reference the element's 
# index when calling the delete_at method on the @list array. 
  def remove (item)
    @list.each_with_index do |x, i|
    	if x.name == item
    		@list.delete_at(i)
    	end
    end
  end
  
  # Here I added a top and bottom to the list to give it some form when you're
  # viewing it in the command line. I also stated each list with the date
  # and a title, and I numbered the list. 
  def print_list
  		puts "\n----------------------------"
  		puts "#{@date_created.month}/#{@date_created.day}/#{date_created.year}"
  		puts "Your Grocery List:\n\n"  		
  		if @list.empty?
  			puts "The List Is Empty!"
  		else

      	@list.each_with_index { |item, index| puts "#{index+1}.  #{item.qty} #{item.name}" }
      end
      puts "\n----------------------------"
  end
  
end

# This last class handles interaction with the user. Originally it was named UserInput
# but An instance of this class is  literally an instance of the grocery list, so 
# I changed it to be called NewList. When a NewList object is initialized, you start
# create a new list. Since the list is actually an instance of the GroceryList class, 
# an instance of this class must automatically be created and assigned to an instance 
# variable that holds the list within the NewList object. A title and date are also 
# presented when a new list is created. 
class NewList
	def initialize
		@grocery_list = GroceryList.new
		puts "\nWelcome to Grocery List v1.0!"
		puts "----------------------------------------"
		puts "This list was created on #{@grocery_list.date_created}\n\n"
		start
	end

# This method is a loop that will play over and over again while the user is working 
# on the list. When the user types a command, this function matches that command to
# another method in theNewList Class and calls that method.
	def start
		while true
			puts "\nWhat would you like to do?\n Available commands: 'add', 'remove', 'print', 'exit'"
			action = gets.chomp.downcase
			case action
			when 'add'
				add
			when 'remove'
				remove
			when 'print'
				print
			when 'exit'
				break
			end
		end
	end

# When add is called from the start method loop, it prompts the user to enter
# an item and then a quantity. It stores this input as variables, and then uses
# these variables as parameters when calling @grocery_list's class method .add. 
# this .add method takes those parameters and uses them when calling ListItem.new.
	def add
		puts "\nEnter the name of the item you would like to add:"
		new_item = gets.chomp
		puts "\nHow many #{new_item} would you like?"
		new_qty = gets.chomp
		@grocery_list.add(new_item, new_qty)
		puts "\nAdding #{new_item} to list..."
		puts "#{new_qty} #{new_item} were added to your Grocery List!"
	end

# When remove is called from the start method loop, it prompts the user to
# an item they would like removed. it then pases that input as a parameter to
# @grocery_list's class method .remove, which will check it against each list item's 
# @name instance variable and delete that element if there's a match. 
	def remove
		puts "\nWhat would you like to remove?"
		remove_item = gets.chomp
		puts "\nWARNING: This will delete #{remove_item} from list...are you sure? 'y/n'"
		confirm = gets.chomp
		if confirm == 'n'
			puts "#{remove_item} was NOT removed from your Grocery List!"
		else
			@grocery_list.remove(remove_item)
			puts "\nDeleting #{remove_item} from list..."
			puts "#{remove_item.capitalize} was deleted from your Grocery List!"
		end
	end

# When print is called from the start method loop, it simply calls @grocery_list's
# .print_list class method. 
	def print
		@grocery_list.print_list
	end

end




## REFACTORED CODE:

# MODEL THAT HOLDS GROCERY LIST ITEM OBJECTS
class ListItem
	attr_reader :name
	attr_writer :name
	attr_reader :qty
	attr_writer :qty
  def initialize(name, qty)
    @name = name
    @qty = qty
  end
end


# MODEL THAT HOLDS GROCERY LIST OBJECTS
class GroceryList
  attr_reader :date_created
  def initialize
    @list = []
    @date_created = Time.now
  end

  def add (item, qty)
  	new_item = ListItem.new(item,qty)
  	@list.push (new_item)
  end

  def remove (item)
    @list.each_with_index do |x, i|
    	if x.name == item
    		@list.delete_at(i)
    	end
    end
  end

  def print_list
  		puts "\n----------------------------"
  		puts "#{@date_created.month}/#{@date_created.day}/#{date_created.year}"
  		puts "Your Grocery List:\n\n"  		
  		if @list.empty?
  			puts "The List Is Empty!"
  		else

      	@list.each_with_index { |item, index| puts "#{index+1}.  #{item.qty} #{item.name}" }
      end
      puts "\n----------------------------"
  end  
end


# CONTROLS USER INTERACTION WITH THE LIST
class NewList
	def initialize
		@grocery_list = GroceryList.new
		puts "\nWelcome to Grocery List v1.0!"
		puts "----------------------------------------"
		puts "This list was created on #{@grocery_list.date_created}\n\n"
		start
	end

	def start
		while true
			puts "\nWhat would you like to do?\n Available commands: 'add', 'remove', 'print', 'exit'"
			action = gets.chomp.downcase
			case action
			when 'add'
				add
			when 'remove'
				remove
			when 'print'
				print
			when 'exit'
				break
			end
		end
	end

	def add
		puts "\nEnter the name of the item you would like to add:"
		new_item = gets.chomp
		puts "\nHow many #{new_item} would you like?"
		new_qty = gets.chomp
		@grocery_list.add(new_item, new_qty)
		puts "\nAdding #{new_item} to list..."
		puts "#{new_qty} #{new_item} were added to your Grocery List!"
	end

	def remove
		puts "\nEnter the name of the item you would like to remove:"
		remove_item = gets.chomp
		puts "\nWARNING: This will delete #{remove_item} from list...are you sure? 'y/n'"
		confirm = gets.chomp
		if confirm == 'n'
			puts "#{remove_item.capitalize} was NOT removed from your Grocery List!"
		else
			@grocery_list.remove(remove_item)
			puts "\nDeleting #{remove_item} from list..."
			puts "#{remove_item.capitalize} was deleted from your Grocery List!"
		end
	end

	def print
		@grocery_list.print_list
	end

end


# this starts a new list
instance = NewList.new






# MORE pseudocode 
# create class called UserInput 
# give user statement
# initialize method: initialize a grocerylist class as an instance variable
# main method: start
#     in loop: asks the user for what they want to do (add, remove, print, exit)
# add method: prompt the user "what would you like to add", save input, 
#             prompt user "how many/much", save input

#=> : denotes a symbol or block, it is also a shortcut for the hash rocket =>
# a =  [1,2,3]
# a[1] == 2
# a = {0: "1", 1: "2", 2: "3" }
# a[1] == "2"


# DRIVER CODE GOES HERE. 
 

 
 # REFLECTION

 # This seemed like an important challenge becuase it brought a lot of concepts together for me, so
 # I spent an additional 2 hours on it after my gps, completely overhauling the code and 
 # storing list items as objects instad of keys/value pairs in a hash. Doing it this way combined
 # concepts of object oriented programming and the model/view/controller structure. In it,
 # I THINK the ListItem class represnts the model. My other two classes GroceryList and NewList
 # have aspects of controller and view in them. The methods in these classes have some output that creates 
 # what the user sees in the command line. Thew NewList class controlls interaction between the user
 # and the GroceryList class. The GroceryList class takes that input and manipulates the GroceryList
 # object. So now that I'm typing this out, maybe the GroceryList class is more of a model instead of a controller.

 # I did some additional reflection by going through my code and explaining what everything did.
 # This helped me to think about the model/view/controller relationship and understand how my three classes
 # work together. I didn't do any driver code becuase I've already spent a lot of time on this challenge and I
 # am pretty confident with driver code already. Over-all great challenge, it was nice having an instructor
 # for this one becuase he was able to guide us in a more technical direction than I would have known to
 # do on my own. Thanks! 

# if i was going to do any more on this, I would add error handling for user input. Not enough time this weekend though. 