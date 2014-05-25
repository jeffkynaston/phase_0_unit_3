$(document).ready(function(){
 
//RELEASE 0: 
  //Link this script and the jQuery library to the jquery_example.html file and analyze what this code does. 


//RELEASE 1:
  //Add code here to select elements of the DOM 
 
var bodyElement = $('body')
bodyElement.css({'background-color': 'white'})
var mascot = $('.mascot h1')
var returnLink = $('.return h1')
 
//RELEASE 2: 
  // Add code here to modify the css and html of DOM elements
 
$('h1').css({'font-family': 'Verdana', 'color': '#045b4f', 'border': '5px solid #156c5c', 'font-weight': 'lighter'})
mascot.html ('Chorus Frogs - Click here to make the image dissapear!')

//RELEASE 3: Event Listener
  // Add the code for the event listener here 
 
 $('img').on('mouseover', function(e){
     e.preventDefault()
    $(this).attr('src', 'http://nice-cool-pics.com/data/media/3/western_chorus_frog.jpg')
    $(this).attr('height', '30%')
    $(this).attr('width', '30%')
  })

$('img').on('mouseout', function(x){
		x.preventDefault()
	$(this).attr('src', 'http://bmaoakland.startupweekend.org/files/2014/02/devbootcamp.png')
 })




//RELEASE 4 : Experiment on your own
 
 
 mascot.click(function() {
	returnLink.css({'display': 'block'})
  $("img").animate({
    opacity: 0.25,
    left: "+=50",
    height: "toggle"
  }, 5000, function() {
    // Animation complete.
  });
});

returnLink.click(function() {
	returnLink.css({'display': 'none'})
  $("img").animate({
    opacity: 1,
    top: "+=20",
    height: "toggle"
  }, 5000, function() {
    // Animation complete.
  });
});
 
 
 
})  // end of the document.ready function: do not remove or write DOM manipulation below this.

// This was a pretty cool challenge - JavaScript and the DOM are really starting to come together for me. 
// I always thought that CSS3 was aweomse because it can handle a lot of the animations. But turns out that
// jquery is super easy to use and manipulating the dom with that is a peice of cake. I think I'll 
// stop avoiding it and start using it more! 