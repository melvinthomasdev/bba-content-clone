Admiral Kirk wants a program that can encrypt his messages and transmit them across the Galaxy from the Starship Enterprise. He has tasked his officer, Pavel with this assignment.

Given the function `send_message()`, help Pavel create a decorator function `encrypt()` to encrypt the string returned from it. To encrypt the message do the following:

1. Call `ord()` on every letter in the string
2. Combine all the values in a list
3. Return the list

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Create function encrypt to encrypt the string returned from send_message
# Store the result in message

def encrypt(function):
  pass
  # get message from function

  # encrypt message by calling ord on every letter


def send_message():
  return "Tango, Charlie, Alpha"

message = send_message()

print(message)
</code>

<solution>
# Create function encrypt to encrypt the string returned from send_message
# Store the result in message

def encrypt(function):
  message = function()
  return [ord(c) for c in message]

def send_message():
  return "Tango, Charlie, Alpha"

message = encrypt(send_message)

print(message)
</solution>
</codeblock>