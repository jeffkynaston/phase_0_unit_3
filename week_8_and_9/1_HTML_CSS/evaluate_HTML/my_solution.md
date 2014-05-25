I paired with: 
1) Jeff Kynaston
2) Ronald Ishak

1) How does this website follow HTML Best Practices? Are there any places where it does not? Provide examples of the "bad" code

CSS - Continunally reference font family for lines 14 -23; This font is set with the body tag on line 1, and doesn't need to be repeated. 
HTML - Has CSS styles declared inline 
HTML - Uses tables all over the place, what is this? Geocities?

2) What do you think of the HTML? Did the writers use IDs and Classes properly?

http://validator.w3.org/check?uri=https%3A%2F%2Fnews.ycombinator.com%2F&charset=%28detect+automatically%29&doctype=Inline&group=0

- They did. Keeping ID used once and classes used over and over again.

Did you like the way they used HTML tags? Please use examples with your arguments.

- No, its dirty! There is spans that are no longer used but still exists in the html.
Ex. line 48: `<span id=down_7784243></span>`
- There was too many inline CSS that could have been put in the external CSS file.
Ex. line 30: `<td style="width:18px;padding-right:4px"><a href="http://ycombinator.com"><img src="y18.gif" width=18 height=18 style="border:1px #ffffff solid;"></img></a></td>`

3) How did the authors handle formatting? Did they include it in the HTML or separate it into a CSS file? Or did they do both? Again, include examples.

See previous answers - formatting is handled both in the .CSS file and inline in the .HTML file. 

4) Did the authors include anything you didn't immediately understand? If so, what?

We don't completely understand the JavaScript being used. There are references to id's, but the value of the id attribute isn't in quotes. It looks like the Javascript is referencing this ID field. 

5) How did the authors organize the CSS file? Was it DRY?

No it was continually repeating (see answer 1) things like the font-family.

6) Did the authors incorporate any responsive design into the site?

Yes, there is a responsive width that resizes the page to fit a mobile screen.

7) What are your overall thoughts on the HTML/CSS from this website based on what you've read?

We can probably make this website a lot simpler and with much cleaner code. Do away with the tables, and move styling to an external .CSS file. 


## REFLECTION

We were really suprised by the HTML behind hackernews. I've been taught that inline css and tables were the wrong ways to do things, but I am conflicted because ycombinator is legit and one would assume that they know what they're doing when it comes to web development. It's gotta be one of a couple things 1) there's a good reason for doing what they did, maybe it has to do with dynamic content generation 2) everything I've ever learned about tables and CSS is wrong 3) The code is old but hey it ain't broke so why fix it. 

JavaScript was definitely the part of this code that I understood the least, so I will proably end up focusing on that over the next week and a half. 