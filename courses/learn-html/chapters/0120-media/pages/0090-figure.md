A `<figure>` tag is used to show contents like **images**, **illustrations**,
**code snippets**, **text** etc.

But then why to use `<figure>` tag instead of using tags like `<img>`. Let's
look at an example of a **Image:**

<codeblock language="html" type="lesson">
<code>
<figure>
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/white-peacock_xvHGCPI-H.jpg" alt="A white peacock" style="width:100%">
  <p>Fig.1 - A white peacock.</p>
</figure>
</code>
</codeblock>

The contents of a `<figure>` element i.e. the image as well as the caption below
in this case, all of these are considered as a single unit and independent of
the main content.

That means, even if we move the figure element away from the main flow of the
document it should not affect the meaning of the document.

Another example could be a **Quotation:**

<codeblock language="html" type="lesson">
  <code>
    <figure>
      <p>
        <i>Swami Vivekananda:</i>
      </p>
      <blockquote>
        <strong>Arise, awake, and stop not till the goal is reached.</strong>
      </blockquote>
    </figure>
  </code>
</codeblock>
