We can also initialize the `datetime` to another date.

<codeblock language="python" type="lesson">
<code>
from datetime import datetime

christmas_day = datetime(year=2022, month=12, day=25)
print(f"This year Christmas day comes on a {christmas_day:%A}")
</code>
</codeblock>