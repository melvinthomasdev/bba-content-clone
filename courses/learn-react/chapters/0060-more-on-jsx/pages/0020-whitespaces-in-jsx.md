In HTML, there are two types of whitespaces: regular spaces and non-breaking spaces, denoted by `&nbsp;`.

A non-breaking space is a space that will not break into a new line. When two words are separated by a non-breaking space, they will remain together on the same line.

Let's consider an example using regular spaces in HTML.

```html
<p>Tom and Jerry</p>
```

If we try to resize the output window for the above example, we can see that the words ***Tom***, ***and***, and ***Jerry*** get split into different lines.

<image>regular-spaces.gif</image>


Let's update the example to use `&nbsp;` instead of regular spaces.

```html
<p>Tom&nbsp;and&nbsp;Jerry</p>
```

If we resize the output window now, we can see that the words ***Tom***, ***and***, and ***Jerry*** stay on a single line.

<image>non-breaking-space.gif</image>

Using `&nbsp;` is particularly useful when you want to display text in a single line, such as `10:00 PM`, `5 km/h`, and so on.

Another important distinction between regular spaces and `&nbsp;` is that regular spaces are truncated by browsers. If you include 10 spaces in your text, the browser will remove 9 of them. To ensure that you retain all the spaces you need, you should use the `&nbsp;` character entity:

<codeblock language="html" type="lesson">
<!-- Adding multiple spaces doesn't work -->
<input type="text" placeholder="Email Address"/>           <button>Submit</button>
</codeblock>

<codeblock language="html" type="lesson">
<!-- &nbsp; can be used to add multiple spaces -->
<input type="text" placeholder="Email Address"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button>Submit</button>
</codeblock>

However, it is not advisable to add spaces using a long chain of `&nbsp;` like this. Instead you can use CSS styles such as `margin`, `padding` etc.

The above approaches in HTML can be applied to add spaces in JSX as well. Alternatively, you can add space in JSX using the syntax `{" "}`:

<codeblock language="reactjs" type="lesson">
<code>
const Form = () => (
  <form>
    <input type="text" placeholder="Email Address"/>
    {" "}
    <button>Submit</button>
  </form>
);

export default Form;
</code>
</codeblock>

The JSX syntax `{" "}` for adding space behaves similarly to regular spaces in HTML. We prefer to use `{" "}`, as it makes the space explicit and intentional.
