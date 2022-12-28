A deque is a combination of a stack and a queue data structure. It basically implements the **First In First Out (Queue)** and **First In Last Out (Stack)** policies internally.

It is similar to a list wherein we can add and remove elements. However, a deque is much faster when adding or removing elements compared to a list. At the same time, it is slower when accessing elements, as you can only access the ends of the queue.

<codeblock language="python" type="lesson">
<code>
from collections import deque

q = deque([1, 2, 3, 4, 5])
print (q) # [1, 2, 3, 4, 5]

q.append(6)
print (q) # Item is appended to the right

q.appendleft(0)
print (q) # Item is appended to the left

q.popleft()
print (q) # Item is popped from the left

q.pop()
print (q) # Item is popped from the right
</code>
</codeblock>