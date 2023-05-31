API user : Hey, I have a problem.

API builder : What’s wrong.

API user : I sent a request to the API to create a user. But I do not see the newly created user.

API builder : Let me check.

API builder : The email address that you sent is already taken.

API user : Hmmm..but I got 200 as the response status code.

API builder : Forget about the response code. You need to check the payload. I sent the error message as “error” key.

API user : If the system could not create the user then why did it return 200 as response status.

API builder : Because I always send 200 and I put the error message in the error key.

API user : You are doing it wrong. http status code is your friend. There are many status codes to indicate different types of errors.

API user : A response status code in the range of 400-499 indicates that the request was not processed successfully.

API user : A 200 response status code means that the request was processed successfully. So if the record could not be created then do not send 200.
