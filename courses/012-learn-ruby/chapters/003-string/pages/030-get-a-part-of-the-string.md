Let's say that the word is **basketball**.
If we want the first six letters
of this word, then this is
what we need to do:

<Editor lang="ruby">
<code>
# Get the first 6 letters of the string
game = "basketball"
puts game[0,6]
</code>
</Editor><Image>basket.jpg</Image>

Here we are telling Ruby to
start from position 0 and
get 6 letters.

Now let's try to get **ball** from the string.
The alpahbet **b** is at the seventh position from the start.
However, since the first position is counted as zero
the position of **b** is 6th.
So, we will ask Ruby to start from position 6
and from there, get 4 values.

<Editor lang="ruby">
<code>
# Get the first 4 letters of the
# string starting from the second b
game = "basketball"
puts game[6,4]
</code>
</Editor><Image>ball.jpg</Image>

Let's see one more example:

<Editor lang="ruby">
<code>
# Get the word "America" from the string
country = "United States of America"
puts country[17,7]
</code>
</Editor><Image>america.jpg</Image>