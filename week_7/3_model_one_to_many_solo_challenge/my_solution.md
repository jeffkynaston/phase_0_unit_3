# U3.W7: Modeling a Real-World Database (SOLO CHALLENGE)

## Release 0: Users Fields
<br/>
users<br/>
<br/>
id<br/>
name<br/>
avatar<br/>
created_at<br/>
updated_at<br/>
<br/>
<br/>
<br/>
tweets??<br/>
followers??<br/>
followed_users???<br/>
=> I think these would all be separate tables<br/>


## Release 1: Tweet Fields
<br/>
tweets<br/>
<br/>
id - auto incriment<br/>
user_id - required<br/>
body - required<br/>
photo - optional<br/>
location - optional<br/>


## Release 2: Explain the relationship
The relationship between `users` and `tweets` is: one-to-many<br/>
Each user can have more than one tweet, but each tweet belongs to only one user. 

## Release 3: Schema Design
<img src="../imgs/users-tweets.png">

## Release 4: SQL Statements
`SELECT user_id, body`<br/> 
`	FROM users JOIN tweets ON (users.id=user_id)`<br/>
`  	WHERE user_id = 'jeffkynaston'`<br/>

`SELECT user_id, body`<br/>
`	FROM users JOIN tweets ON (users.id=user_id)`<br/>
`  	WHERE user_id = 'jeffkynaston'`<br/>
`   	AND created_at > 5/14/14``<br/>

`SELECT user_id, body`<br/>
` FROM users JOIN tweets ON (users.id=user_id)`<br/>
`   WHERE body LIKE '%@jeffkynaston%'`<br/>

`SELECT name`<br/>
`	FROM users JOIN tweets ON (users.id=user_id)`<br/>
`		WHERE tweet.id = '14402084'`<br/>



## Release 5: Reflection
I think I still have a lot to learn about databases. The naming conventions and standard formatting are starting to get engrained, but connecting tables can get complex quickly. One thing I wasn't quite sure about - how to specificy a certain date. My best guess was to just use a > sign and a date in short notation, but I'm not sure if that's correct. 

Thinking through the one-to-one, one-to-many, and many-to-many relationshpis isn't too difficult for me. I should spend some more time thinking about the relationships between data and between tables - a table should have a field or when that field should actually be a table of its own. 