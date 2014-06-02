// U3.W8-9: 


// I worked on this challenge [with: Brennon Williams].

// 2. Pseudocode



// 3. Initial Solution
var prompt = require('prompt');
prompt.start();

var groceryList = {
  list: [],
  
  addItem: function(item) {
  list.push(item);
  },
  
  removeItem: function(item) {
    var index = list.indexOf(item);
    list.splice(index,1);
  },
  
  printList: function () {
    console.log(list);
  }
  
}


var userInput = {
  
  start: function () {
    
    while (true) {
      
    var command = prompt.get(['enterCommand'], function (err, result) {
    console.log('Command-line input received:');
    console.log('  command: ' + result.enterCommand);
  });
      
      if (command === "add") {
        add();
      }
      else if (command === "remove") {
        remove();
      }
      else if (command === "display") {
        printList();
      }
      else if (command === "exit"){
        console.log("Exiting...");
        break;
      }
    }
  },
  
  add: function () {
    var itemToAdd = prompt("Enter an item to add to the grocery list");
    groceryList.addItem (itemToAdd);
  },
  
  remove: function () {
    var itemToRemove = prompt("Enter an item to remove from the grocery list");
    groceryList.removeItem (itemToRemove);
  },
  
  printList: function () {
    groceryList.printList();
  }

}

userInput.start();

// 4. Refactored Solution






// 1. DRIVER TESTS/ASSERT STATEMENTS GO BELOW THIS LINE






// 5. Reflection 