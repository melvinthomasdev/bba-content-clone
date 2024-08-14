Alexander is designing a time machine so that he can travel forwards and backward in time. The screen will start by displaying the current date and time.

Help him implement the same by showing the current date in the following text.

**The current date is dd-mm-yyyy.**


<codeblock language="python" type="exercise" testMode="fixedInput" cache="false">
<code>
# Get the current datetime and print it in the **The current date is dd-mm-yyyy**
</code>

<solution>
# Get the current datetime and print it in the **The current date is dd-mm-yyyy**
from datetime import datetime
today = datetime.now()

print(f"The current date is {today.day}-{today.month}-{today.year}.")
</solution>
</codeblock>
