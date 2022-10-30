Let's display the
first letter of the
string **hello**:

<Editor lang="ruby">
<code>
string = "hello"
puts string[0]
</code>
</Editor>

In Ruby, the first position
is 0 and not 1.
So, we start counting from 0.

The first letter is
at position 0. The second letter
is at position 1.

Computer science people call
it **index** rather than calling
it **position**.
So, we can say that the first
letter is at index **0**. The second
letter is at index **1** and so on.

| String | h | e | l | l | o |
| Index  | 0 | 1 | 2 | 3 | 4 |

Similarly, if we want the
3rd letter, then we need to
use value `2`.

<Editor lang="ruby">
<code>
# Get the 3rd letter of the word
string = "hello"
puts string[2]
</code>
</Editor>

Let's see one more example:

<Editor lang="ruby">
<code>
# Get the fifth letter of the word "Chicago"
city = "Chicago"
puts city[4]
</code>
</Editor>

| String | c | h | i | c | a | g | o |
| Index  | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
