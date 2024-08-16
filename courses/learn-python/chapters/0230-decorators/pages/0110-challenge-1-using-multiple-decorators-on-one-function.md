Commander Kirk is impressed with the program Pavel has built. He has requested one minor alteration to the program. He wants the date and time to be added to every message.

Help Pavel implement the same by adding the current date and time to every message using the `add_time` decorator.

Once the date and time is added to the message, then go ahead and encrypt it.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add add_time decorator to send_message

from datetime import datetime

def add_time(function):
    def wrapper(*args, **kwargs):
        message = function(*args, **kwargs)
        now = datetime.now()
        return f"{now:%Y-%m-%d %I:%M} : {message}"
    return wrapper

def encrypt(function):
  def wrapper(*args, **kwargs):
    message = function(*args, **kwargs)
    return [ord(c) for c in message]
  return wrapper

@encrypt
def send_message(message):
  return message

message = send_message("Hello Officers. This is your captain speaking.")

print(message)
</code>

<solution>
# Add add_time decorator to send_message

from datetime import datetime

def add_time(function):
  def wrapper(*args, **kwargs):
    message = function(*args, **kwargs)
    now = datetime.now()
    return f"{now:%Y-%m-%d %I:%M} : {message}"
  return wrapper

def encrypt(function):
  def wrapper(*args, **kwargs):
    message = function(*args, **kwargs)
    return [ord(c) for c in message]
  return wrapper

@encrypt
@add_time
def send_message(message):
  return message

message = send_message("Hello Officers. This is your captain speaking.")

print(message)
</solution>
</codeblock>