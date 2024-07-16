All buttons and links should have accessible names. Without a proper label, assistive technologies like screen readers will just announce a button and this gives no information about the button to the listener, for example:

```html
<!-- Bad -->
<button className="bookingButton"></button>
<button className="bookingButton">Add</button>

<!-- Good -->
<button className="bookingButton">Add new booking</button>
```

Always add alternative texts in images. If the image fails to load, the alt text is used as a placeholder and the reader will get the info about it.

```html
<img src="cat.png" alt="picture of a cat" />
```

Always add labels in the form. Labels ensure that form controls are announced properly by assistive technologies like screen readers.

```html
<input id="subscribe" type="checkbox" >
<label for="subscribe">Subscribe to newsletter</label>
```

If you wish to dig deeper into accessibility, check out these articles:
- [MDN article about accessibility](https://developer.mozilla.org/en-US/docs/Learn/Accessibility/HTML)
- [W3 docs about accessibility](https://www.w3.org/TR/WCAG10-HTML-TECHS/)
