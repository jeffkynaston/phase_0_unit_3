# U3.W8-9: OO Basics: Student


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode



# 3. Initial Solution

class Student
  attr_accessor :scores, :first_name

  def initialize(first_name, scores)
    @first_name = first_name
    @scores = scores
  end
end

alex = Student.new("Alex", [100,100,100,0,100])
jeff = Student.new("Jeff", [100,100,100,100,100])
benson = Student.new("Benson", [100,90,99,98,99])
jared = Student.new("Jared", [66,68,64,60,72])
karen = Student.new("Karen", [80,85,88,82,92])

students = [alex, jeff, benson, jared, karen]



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# Tests for release 0:

p students[0].first_name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0


# Tests for release 1:

p students[0].average == 80
p students[0].letter_grade == 'B'

# Tests for release 2:

p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1





# 5. Reflection 