## What is Web Accessibility?

The web is an essential part of our daily life. Web accessibility is a practice of ensuring that websites and web applications are accessible to people with disabilities of any kind.

For example, a person who can not see properly can use the [screen reader](https://blog.hubspot.com/website/screen-reader-accessibility) feature to understand what's happening in the website and how to interact with it.

Or for another example, we can add an alternate text for images and this text will be read out loud by the screen reader and also used by the search engines.

## What is Semantic HTML?

HTML is made up of both semantic and non-semantic elements. Semantic HTML means using correct HTML elements for their correct purpose. Semantic elements are elements with a meaning. With the help of JavaScript and CSS, we can mold any HTML elements according to our needs. But using the correct HTML elements gives us access to the accessibility tools provided in the element.

For example, we can define a button in two ways, like so:

```html
<!-- Not semantically correct -->
<div class="button">Click</div>

<!-- Semantically correct -->
<button>Click</button>
```

In the above example, we can make both of the tags the same in terms of styling. But the `button` tag has some accessibility features which will improve the user experience. A screen reader identifies it as a button. It is focusable via keyboard and also supports the `ENTER` and `SPACE` key actions. Moreover, it also has more suitable styling by default.

So by using the semantic HTML tags, we are improving the user experience with so many extra features. We don't have to create these features, but using the right semantic element will add these features by default.

Benefits of semantic elements:

- It is much easier to read and understand the code.

- Search engines will consider its contents as important keywords to influence the page's search rankings.

- Screen readers and other assistive technologies can communicate elements properly to the user.

Examples of non-semantic elements: `<div>` and `<span>`, etc, tells nothing about its content.

Examples of semantic elements: `<form>`, `<table>`, and `<article>`, etc, clearly defines its content.

## Declare the language

We should always use the lang attribute in the `<html>` tag, to declare the language of the Web page. This is meant to assist search engines and browsers.

We can specify English as the language, like so:

```html
<!DOCTYPE html>
<html language="en">
  <body>
    <!-- rest of the content -->
  </body>
</html>
```

## Semantic HTML for keyboard actions

By using the correct semantic HTML elements we can make use of built-in keyboard interactivity features.

Most commonly used tags are:

- `<a>` tag for making links. We can select the link using the `Tab` key and then open it using `Return` key. We can open the link in a new tab using `Cmd + Shift + Return`. The Chrome, Edge, and Brave browser support this shortcut.

- `<button>` tag for making buttons. We can select the button using the `Tab` key. Then we can click the button using `Space` and `Return` key.

- `<select>` tag for adding dropdowns. We can use `Tab` and `Shift` keys to go to the next and previous options in the dropdown. We can use `Space` and `Return` to select an option.

- `<input>` and `<textarea>` for adding input fields. We can select them using the `Tab` key.

## Some best practices for accessibility

- All buttons and links should have accessible names. Without a proper label, assistive technologies like screen readers will just announce a button and this gives no information about the button to the listener, for example:

```html
<!-- Bad -->
<button></button>
<button>Add</button>

<!-- Good -->
<button>Add new booking</button>
```

- Always add alternative texts in images. If the image fails to load, the alt text is used as a placeholder and the reader will get the info about it.

```html
<img src="example.png" alt="<img> tag example" />
```

- Always add labels in the form. Labels ensure that form controls are announced properly by assistive technologies like screen readers.

```html
<input id="subscribe" type="checkbox"></input>
<label for="subscribe">Subscribe to newsletter</label>
```

## Accessibility with neetoUI

In neetoUI we have many different components and sub-components which are built using semantic HTML. While using neetoUI we should use the correct semantic component or sub-component. Using the right semantic component gives the application better accessibility and a better user experience.

For example, in the [neetoUI Dropdown](https://neetoui.onrender.com/?path=/story/components-dropdown--default), we can use `<li>` tags, `<button>` tags, or any custom code for adding the options in the dropdown. But for this job, it's better to use the predefined `MenuItem.Button` sub-component which is using the `<button>` HTML tag under the hood.

The code for dropdown will be, like so:

```jsx
// Bad
<Dropdown label="Dropdown">
  <Menu>
    <div>Delete</div>
  </Menu>
</Dropdown>

// Good
<Dropdown label="Dropdown">
  <Menu>
    <MenuItem.Button style="danger">Delete</MenuItem.Button>
  </Menu>
</Dropdown>
```

For more details refer:

- [MDN article about accessibility](https://developer.mozilla.org/en-US/docs/Learn/Accessibility/HTML)

- [W3 docs about accessibility](https://www.w3.org/TR/WCAG10-HTML-TECHS/)