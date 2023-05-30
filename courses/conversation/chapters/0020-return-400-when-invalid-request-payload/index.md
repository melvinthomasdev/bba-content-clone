API builder : It’s fixed. Now you will get 400.
API User : But that’s wrong too.

API builder : Now what’s your problem.

API User : Send 400 when data is not **syntactically correct.**

API builder : What does that even mean.

API User : Let me elaborate.

API User : In order to create a user I’m sending the user data in JSON format. Right ?

API builder : Right.

API User : And the JSON that I’m sending is valid JSON. Right ?

API builder : Right.

API User : Then you can’t send 400. **Because 400 should be returned when the data itself is malformed.**

API builder : I see. So if the payload is not valid JSON then I could send 400.

API User : Right.

API User : If the API accepts xml and the xml is not well-formed then you can send 400.

API builder : Got it.

API builder : So what status code I should send in your case when email is taken.

API User : Let’s talk about it tomorrow.

