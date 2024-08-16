Srikant is designing a customer support software. He is creating a queue-like structure wherein incoming calls will be added to a waiting list. Once a customer support executive is free, the call will be picked up and answered.

Help him design a waiting list using deque. The callers should be picked up in the First In First Out  order. i.e. callers who called first will be answered first.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Initialize a deque for waiting calls
# Add callers to the queue
# Pop them in the order they were added

timeline = [("add_caller", "Bob"), ("answer_caller", None), ("add_caller", "Tim"), ("add_caller", "Tony"), ("answer_caller", None), ("add_caller", "Steve")]

# Initialize deque here
# waiting_calls =

for activity, caller in timeline:
  if activity == "add_caller":
    print(f"Adding caller {caller} to waiting list")
    # Add caller to waiting calls
  elif activity == "answer_caller":
    # Pop caller from waiting calls in the order they were added
    # caller =
    print(f"Answering call of {caller}")

print(f"There are {len(waiting_calls)} calls in the waiting list.")
</code>

<solution>
from collections import deque

timeline = [("add_caller", "Bob"), ("answer_caller", None), ("add_caller", "Tim"), ("add_caller", "Tony"), ("answer_caller", None), ("add_caller", "Steve")]

waiting_calls = deque()

for activity, caller in timeline:
  if activity == "add_caller":
    print(f"Adding caller {caller} to waiting list")
    waiting_calls.append(caller)
  elif activity == "answer_caller":
    caller = waiting_calls.popleft()
    print(f"Answering call of {caller}")

print(f"There are {len(waiting_calls)} calls in the waiting list.")
</solution>
</codeblock>