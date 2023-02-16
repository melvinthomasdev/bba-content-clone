`<input type="checkbox">` allows the user to select one or more options from a list of choices.

<codeblock language="html" type="lesson">
<code>
<form>
  <label>Fruits you like:</label>
  <br>
  <input type="checkbox" name="fruit" value="apple">
  <label>Apple</label>
  <br>
  <input type="checkbox" name="fruit" value="banana">
  <label>Banana</label>
  <br>
  <input type="checkbox" name="fruit" value="orange">
  <label>Orange</label>
  <br>
</form>
</code>
</codeblock>

The `value` as well as the `name` attributes
help the website understand the user's choice
and
hence you should remember to include them. If
you don't include a `value` attribute for a
particular input, the website will assume
it to be **on**.

In the above example, we have given
a `name` of **fruit** to all the
inputs. This isn't necessary. You
can have different names. Read this
combination as **fruit is banana**,
or **fruit is orange** depending on
which checkbox the user clicks on.
You could have easily switched the names
to be different as shown below:

<codeblock language="html" type="lesson">
<code>
<form>
  <label>Fruits you like:</label>
  <br>
  <input type="checkbox" name="food" value="apple">
  <label>Apple</label>
  <br>
  <input type="checkbox" name="choice" value="banana">
  <label>Banana</label>
  <br>
  <input type="checkbox" name="fruit" value="orange">
  <label>Orange</label>
  <br>
</form>
</code>
</codeblock>

In this example, we are telling the website
**food is apple**, **choice is banana** or
**fruit is orange**. This will work.

Normally, we give these choices a single name like
we did in the first example. This way,
when we click on the banana checkbox,
we are essentially saying, **All of these
are fruits and my choice is banana**.