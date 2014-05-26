# U3.W7: BONUS Using the SQLite Gem

# I worked on this challenge [by myself]

require 'sqlite3'


$db = SQLite3::Database.open "congress_poll_results.db"


def print_arizona_reps
  puts "AZ REPRESENTATIVES"
  az_reps = $db.execute("SELECT name FROM congress_members WHERE location = 'AZ'")
  az_reps.each { |rep| puts rep }
end

def print_longest_serving_reps(minimum_years) 
  puts "LONGEST SERVING REPRESENTATIVES"
  longest_reps = $db.execute("SELECT name, years_in_congress FROM congress_members WHERE years_in_congress > #{minimum_years}")
  longest_reps.each { |rep| puts "#{rep[0]} - #{rep[1]} years"}
end

def print_lowest_grade_level_speakers(minimum_grade)
  puts "LOWEST GRADE LEVEL SPEAKERS (grade #{minimum_grade} and lower)"
  lowest_grade_reps = $db.execute("SELECT name, grade_current FROM congress_members WHERE grade_current < #{minimum_grade}")
  lowest_grade_reps.each { |rep| puts "#{rep[0]} - grade #{rep[1].floor}"}
end

def print_separator
  puts 
  puts "------------------------------------------------------------------------------"
  puts 
end

# Insted of making a separate method for each state, I made one general method that 
# took the state as an argument.
def print_reps(state)
  puts "#{state} REPRESENTATIVES"
  state_reps = $db.execute("SELECT name FROM congress_members WHERE location = '#{state}'")
  state_reps.each { |rep| puts rep }
end

def print_votes
  puts "POLITICIAN VOTE COUNT"
  rep_votes = $db.execute("SELECT name, COUNT(voter_id) FROM votes JOIN congress_members ON (congress_members.id=politician_id) GROUP BY politician_id")
  rep_votes.each { |rep| puts "#{rep[0]} - #{rep[1].floor} votes"}
end

def print_voters
  puts "POLITICIAN VOTER LIST"
  rep_votes = $db.execute("SELECT name, COUNT(voter_id) FROM votes JOIN congress_members ON (congress_members.id=politician_id) GROUP BY politician_id")
  rep_votes.each { |rep| puts "#{rep[0]} - #{rep[1].floor} votes"}
end


print_arizona_reps
print_separator
# print_longest_serving_reps(35)
# print_separator
# print_lowest_grade_level_speakers (8)
# print_separator
# print_reps('FL')
# print_separator
# print_reps('NJ')
# print_separator
# print_reps('NY')
# print_separator
# print_reps('AK')
print_votes

##### BONUS #######
# TODO (bonus) - Stop SQL injection attacks!  Statmaster learned that interpolation of variables in SQL statements leaves some security vulnerabilities.  Use the google to figure out how to protect from this type of attack.

# I learned about SQL injectin attacks while listening to the harvard CS 50 computer sciecne course. To protect against them,
# we must review the user input and removing any offending code - often accomplished by escaping or deleting characters. 
# I could do this manually, but it's probably safer to use a well known gem that is always being updated & maintained. 

# TODO (bonus)
# Create a listing of all of the Politicians and the number of votes they recieved
# output should look like:  Sen. John McCain - 7,323 votes (This is an example, yours will not return this value, it should just 
#    have a similar format)
##DONE
# Create a listing of each Politician and the voter that voted for them
# output should include the senators name, then a long list of voters separated by a comma
#
# * you'll need to do some join statements to complete these last queries!


# REFLECTION- Include your reflection as a comment below.
# How does the sqlite3 gem work?  What is the variable `$db` holding?  
# Try to use your knowledge of ruby and OO to decipher this as well as h
# ow the `#execute` method works.  Take a stab at explaining the line 
# `$db.execute("SELECT name FROM congress_members WHERE years_in_congress 
#   > #{minimum_years}")`.  Try to explain this as clearly as possible for 
# your fellow students.  
# If you're having trouble, find someone to pair on this explanation with you.


# I am getting this pretty well and will come back to finish the rest of the bonus If I have more time. 

# the variable $db is holding the database - it was created by calling the .open method on 
# the SQLite3 Database class and giving it the file name as the parameter. 


# http://blog.8thlight.com/adam-gooch/2013/01/04/protect-yourself-from-sql-injection.html