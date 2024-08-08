We don't have to always change
the full array when using the `fill()`
method. We can restrict the change
to any part of the array.

For this, we need to provide
a second parameter that identifies
which index to
start changing the values from.

We can also provide a third
parameter which tells at which
index to stop changing
the values.

Take a look:
<codeblock language="javascript" type="lesson">
<code>
const animals = ["🐂🐂🐂", "🐅🐅🐅", "🐕🐕🐕", "🐄🐄🐄", "🐇🐇🐇"]
animals.fill("🐿️🐿️🐿️", 1, 4);
console.log(animals);
</code>
</codeblock>

So, the first parameter for `fill()` is the
content, the second parameter is the start
index. In this case, it is 1, so the change
will begin from the first index. The last parameter
is the index at which the change should end.

You can see that the third parameter
value is not inclusive. This means
that even though we provide **4**
as the last index till which we want to
change the values, the
change occurred only till index 3. The last
array value remained unchanged.