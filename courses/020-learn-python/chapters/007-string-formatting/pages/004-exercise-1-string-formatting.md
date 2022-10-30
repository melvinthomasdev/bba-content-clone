The Indian Space Research Organisation has launched a new mission to Mars. After the scheduled landing of its rover: Mangal, ISRO will put out a message, announcing to the world it's successful landing.

Create a Python program to print out the message given the details below. Use `.format()` to add the variable into the text.

Message: **ISRO is happy to announce the successful landing of `rover`, on the surface of Mars at `hour` `am/pm` on `date` `month`**.

<Editor lang="python" type="exercise">
<code>
# Given the details below, use .format() to construct a the text mentioned above.

rover = "Mangal"
hour = 9
am_pm = "PM"
date = 24
month = "July"
</code>

<solution>
# Given the details below, use .format() to construct a the text mentioned above.

rover = "Mangal"
hour = 9
am_pm = "PM"
date = 24
month = "July"

print("ISRO is happy to announce the successful landing of {rover}, on the surface of Mars at {hour} {am_pm} on {date} {month}.".format(rover=rover, hour=hour, am_pm=am_pm, date=date, month=month))
</solution>
</Editor>