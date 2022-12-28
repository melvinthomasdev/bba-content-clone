Given the decorator function `encrypt()` and `send_message()`, help officer Pavel, modify `encrypt()` so that it can be used as an annotation.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add a nested wrapper function to encrypt and call it with @ symbol

def encrypt(function):
  message = function()
  return [ord(c) for c in message]

def send_message():
  return "Tango, Charlie, Alpha"

message = send_message()

print(message)
</code>

<solution>
# Add a nested wrapper function to encrypt and call it with @ symbol

def encrypt(function):
  def wrapper():
    message = function()
    return [ord(c) for c in message]
  return wrapper

@encrypt
def send_message():
  return "Tango, Charlie, Alpha"

message = send_message()

print(message)
</solution>
</codeblock>