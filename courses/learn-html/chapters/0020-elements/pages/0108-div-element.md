The `<div>` element is used to group together other HTML elements. This grouping helps maintain clarity and organisation within the HTML document. 

To use a `<div>` element, you simply wrap the content or other HTML elements you want to group together within opening `<div>` and closing `</div>` tags.

<codeblock language="html" type="lesson">
<code>
<div>
    <div>
        <h1>The Himalayas</h1>
        <p>
        The Himalayas are a majestic mountain range in Asia, spanning five countries: India, Nepal, Bhutan, China, and Pakistan. They are home to the world's highest peaks, including Mount Everest.
        </p>
    </div>
    <div>
        <h2>Features of the Himalayas</h2>
        <ul>
            <li>Varied ecosystems from subtropical to alpine</li>
            <li>Rich biodiversity with unique flora and fauna</li>
            <li>Cultural diversity with indigenous communities</li>
        </ul>
    </div>
</div>
</code>
</codeblock>

In the above example, 
  - The outermost `<div>` serves as a container, grouping together two inner <div> elements.
  - The first inner `<div>` containing a heading `<h1>` and a paragraph `<p>` acts like an introduction section.
  - The second innner `<div>` containing a subheading `<h2>` and an unordered list `<ul>` acts like a feature section.

The `<div>` element only serves as a container without directly changing how output looks or is organised. The `<div>` element becomes especially useful when combined with CSS, which you can learn more about in our [CSS Course](https://courses.bigbinaryacademy.com/learn-css/).