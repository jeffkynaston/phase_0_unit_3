/*
U3.W8-9: Gradebook from Names and Scores

You will work with the following two variables.  The first, students, holds the names of four students.  
The second, scores, holds groups of test scores.  The relative positions of elements within the two 
variables match (i.e., 'Joseph' is the first element in students; his scores are the first value in scores.).

Do not alter the students and scores code.

I worked on this challenge [by myself, with:]

*/

var students = ["Joseph", "Susan", "William", "Elizabeth"]

var scores = [ [80, 70, 70, 100],
               [85, 80, 90, 90],
               [75, 70, 80, 75],
               [100, 90, 95, 85] ]






// __________________________________________
// Write your code below.

var average = function (arr) {
  sum = arr.reduce(function(a, b) {
    return a + b;
  });
  count = arr.length
  // console.log(sum)
  // console.log(count)
  return sum/count
}
// console.log(average([2,3]))


var gradebook = {
  Joseph: {testScores: [80, 70, 70, 100]},
  Susan: {testScores: [85, 80, 90, 90]},
  William: {testScores: [75, 70, 80, 75]},
  Elizabeth: {testScores: [100, 90, 95, 85]},
  addScore: function(student, score) {
    gradebook[student].testScores.push(score)
  },
  getAverage: function(student) {
    // console.log(student)
    // console.log(gradebook[student])
    // console.log(gradebook[student].testScores)
    // console.log(average(gradebook[student].testScores))
    return average(gradebook[student].testScores)
    // Note: For a method like getAverage, you must use an explicit return statement!
  }

}


// gradebook.display("William")
// gradebook.addScore("Susan", 80) // would push the score 80 into the value of gradebook.Susan.testScores.

// __________________________________________
// Refactored Solution

var gradebook = {
  Joseph: {testScores: scores[0]},
  Susan: {testScores: scores[1]},
  William: {testScores: scores[2]},
  Elizabeth: {testScores: scores[3]},
  display: function(student) {
    return gradebook[student].testScores
  },
  addScore: function(student, score) {
    gradebook[student].testScores.push(score)
  },
  getAverage: function(student) {
    return average(gradebook[student].testScores)
  }

}


console.log(gradebook["William"].testScores)
console.log(scores[2])
console.log(gradebook.display("Elizabeth"))


// console.log(gradebook)
// console.log(gradebook.getAverage("William"))
// console.log(gradebook["William"])
// gradebook.addScore("William", 20)
// console.log(gradebook["William"])
// console.log(gradebook.getAverage("William"))


// __________________________________________
// Reflect


// In my refacotored solution, I added a display method that takes
// a student name as the argument and returns that students scores. 


// For the longest time I wasn't able to get driver test #5 to work. 
// In my initial solution, I set the gradebook scores equal to an actual
// array. It took some googling to find out that in JavaScript, two 
// variables are equal only if they are actually pointing at the SAME
// object. Even though my arrays were actually equal (same values, same
// character sequence and length), that test wouldn't evaluate to true 
// until I pointed each student's testScores to the actual scores array. 

// With 3 weeks of ruby under my belt, it was hard coming back to JS. I know way
// less about the capabilities and built in methods for javascript, and I am
// constantly looking at the syntax. guess i need more practice! 


// __________________________________________
// Driver Code:  Do not alter code below this line.




function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (average instanceof Function),
  "The value of average should be a Function.\n",
  "1. "
)

assert(
  average([1, 2, 3]) === 2,
  "average should return the average of the elements in the array argument.\n",
  "2. "
)

assert(
  (gradebook instanceof Object),
  "The value of gradebook should be an Object.\n",
  "3. "
)

assert(
  (gradebook["Elizabeth"] instanceof Object),
  "gradebook's Elizabeth property should be an object.",
  "4. "
)
// console.log("William's Test Scores:")
// console.log(gradebook["William"].testScores)
// console.log("scores[2]:")
// console.log(scores[2])

assert(
  (gradebook["William"].testScores === scores[2]),
  "William's testScores should equal the third element in scores.",
  "5. "
)

assert(
  (gradebook.addScore instanceof Function),
  "The value of gradebook's addScore property should be a Function.",
  "6. "
)

gradebook.addScore("Susan", 80)

assert(
  (gradebook.Susan.testScores.length === 5
   && gradebook.Susan.testScores[4] === 80),
  "Susan's testScores should have a new score of 80 added to the end.",
  "7. "
)

assert(
  (gradebook.getAverage instanceof Function),
  "The value of gradebook's getAverage property should be a Function.",
  "8. "
)

assert(
  (gradebook.getAverage("Joseph") === 80),
  "gradebook's getAverage should return 80 if passed 'Jospeh'.",
  "9. "
)