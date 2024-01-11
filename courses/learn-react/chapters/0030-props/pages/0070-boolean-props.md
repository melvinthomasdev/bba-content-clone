Take a look at the following example:

```jsx
<Product category="groceries" isDeliverable={true} isOutOfStock={false} />;
```

In the above example, we have passed the boolean values to the `isDeliverable` and `isOutOfStock` props by wrapping them inside curly braces `{}`, as we did in the previous chapters.

However, when the value of a boolean prop is `true`, we can omit the value and only mention the property name. Here is the updated code:

```jsx
<Product isDeliverable category="groceries" isOutOfStock={false} />;
```

Here we have kept the `isDeliverable` attribute at the beginning to give a better visual hierarchy. We recommend this approach for passing the boolean `true` to a component.

Similarly, we can set an attribute to false by omitting the property. For example, `isOutOfStock` can be set to false like this:

```jsx
<Product isDeliverable category="groceries" />;
```

When we omit an attribute, it will be implicitly assigned the value `undefined`, which is falsy. However, we do not recommend this method, as the value of `undefined` may not be suitable for all cases.
