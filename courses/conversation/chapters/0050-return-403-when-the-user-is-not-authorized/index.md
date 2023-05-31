API User : Hi there.

API builder : Let me guess. API problem.

API User : Yes. I’m getting error message that “Only HR team can create a new user”.

API builder : Yes. That’s the new policy. And you are not authorized to create a new user.

API User : In that case you should not send 422. You should send 403.

API builder : C'mon. Now this is getting too much. How many special status codes you have.

API User : This is the last one.

API builder : Ok. I’m listening.

API User : **If user is not authenticated then send status code 401.**

API User : **However if user is authenticated and user is forbidden then send 403.**

API User : Yes so in this case the server knows who you are. It’s just that you are not authorized to access the information you are requesting.

API builder : Got it. That is simple. Anyone who is forbidden will get 403.

