While the addition of keys may seem unnecessary, it is part of an optimization
technique that React uses to ensure it doesn't re-render any more than
necessary.

Take the previously shown example of a contact list:

```jsx
<ul>
  <li>Alonzo Church</li>
  <li>Alan Turing</li>
</ul>
```

If the above example were to be re-arranged during runtime like so:

```jsx
<ul>
  <li>Kurt Gödel</li>
  <li>Alonzo Church</li>
  <li>Alan Turing</li>
</ul>
```

The problem occurs when React tries to compare the new list to the old one. It
finds that the first element isn't "Alonzo Church" anymore and mutates the text
to "Kurt Gödel". It mutates "Alan Turing" to "Alonzo Church" and keeps repeating
this mutation until the old list has been converted to the new one.

The most efficient way is to just add the "Kurt Gödel" line to the top but React
can't know the contents of each line haven't been modified without keys.

Keys allow React to know which elements have changed or not when comparing
differences by just comparing keys rather than the entire element.

The above example with index keys added like so:

```jsx
<ul>
  <li key={1}>Alonzo Church</li>
  <li key={2}>Alan Turing</li>
</ul>
```

Would be rebuilt like this:

```jsx
<ul>
  <li key={3}>Kurt Gödel</li>
  <li key={1}>Alonzo Church</li>
  <li key={2}>Alan Turing</li>
</ul>
```

Since React knows that keys 1 and 2 exist, it just adds the element with key 3
and doesn't have to mutate each element.
