Semantic HTML just means using the appropriate HTML elements for their intended purpose. Using Javascript and HTML, we can turn any element into any other element and a lot of developers do use divs for everything from headers to buttons. But it is an important part of writing HTML to use semantic HTML as much as possible.

Try and use `<button>Click</button>` rather than `<div className="button">Click</div>`.

Semantic HTML has many benefits:
  1. Web Accessibility: Allows people with disabilities of any kind to use your site better using tools such as a [screen reader](https://blog.hubspot.com/website/screen-reader-accessibility)
  2. Great for SEO: Having alt text in image tags or descriptive headings in header tags will help search engines find your site if the content is relevant to the user.
  3. Smaller file size: Having pre-built functionality means you have less custom code bulking up your file size. Helps mobile users and general responsiveness.
  4. Easier to read: Other programmers won't have to dig through scripts and styles to find out what every multipurpose div does.


In the earlier example, using `<button>Click</button>` helps as a screen reader will identify it as a button, it is focusable via keyboard and it supports key actions like `Enter` and `Space`.

These are a lot of features being added by default along with some in-built styles that you can easily override with a bit of HTML.