India is playing a test match against Australia. The Indian captain, MS Dhoni, is currently batting against Australia. His runs are stored within a list `runs_scored`. The runs can be 1, 2, 4, or 6.

Use the counter to count the number of 4's and 6's, Dhoni has scored. Print the same within the text **Dhoni scored X fours and Y sixes in this match.**


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Use counter to counter the number of fours and sixes scored.
runs_scored = [1, 2, 1, 1, 4, 2, 6, 6, 2, 4, 6, 2, 2, 6, 6, 4, 2, 1, 1, 1, 6]

# Use Counter here.

print(f"Dhoni scored X fours and Y sixes in this match.")
</code>

<solution>
from collections import Counter
runs_scored = [1, 2, 1, 1, 4, 2, 6, 6, 2, 4, 6, 2, 2, 6, 6, 4, 2, 1, 1, 1, 6]

c = Counter(runs_scored)

print(f"Dhoni scored {c[4]} fours and {c[6]} sixes in this match.")
</solution>
</codeblock>