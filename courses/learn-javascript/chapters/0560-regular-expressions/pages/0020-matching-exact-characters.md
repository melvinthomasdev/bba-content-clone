
For matching exact characters,
we can use the syntax `/.../`.

For example, if we want to search
for **house**, our regex pattern
will be `/house/`.

Let's take a look at a code example.
<codeblock language="javascript" type="lesson">
<code>
const welcomeText = "Say hello to the world!";
const searchText = /hello/;
console.log(searchText.test(welcomeText));
</code>
</codeblock>

In this example, we want to check if the
string **Say hello to the world!** contains
the string **hello**.
For this, the pattern that we created was `/hello/`.
