Below is the attendee's list for Day 1 and Day 2 at Devconf. Use sets to find

1. The attendees who were present on both days
2. The attendees who were present only on day 1
3. The attendees who were present only on day 2

Print the results in the following manner:

**Attendees on both days: {'1234', '2345', '3456'}**

**Attendees only on first day: {'6353', '6788', '3432'}**

**Attendees only on second day: {'3452', '3545'}**


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
day_1 = ["3422", "4522", "7743", "2947", "2846", "1038", "8354", "2593", "7324", "7353"]
day_2 = ["9352", "3422", "7353", "1038", "7245", "8354", "9204", "2355", "2353", "7743"]
</code>

<solution>
day_1 = ["3422", "4522", "7743", "2947", "2846", "1038", "8354", "2593", "7324", "7353"]
day_2 = ["9352", "3422", "7353", "1038", "7245", "8354", "9204", "2355", "2353", "7743"]

both_days = set(day_1) & set(day_2) # both days
day_1_attendees = set(day_1) - set(day_2) # only day 1
day_2_attendees = set(day_2) - set(day_1) # only day 2

print(f"Attendees on both days: {both_days}")
print(f"Attendees only on first day: {day_1_attendees}")
print(f"Attendees only on second day: {day_2_attendees}")
</solution>
</codeblock>