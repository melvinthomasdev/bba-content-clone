You have

- `https://ucarecdn.com/311947a5-cfd9-4dc2-b6c3-839b532348cc/`
- `https://ucarecdn.com/371d1bde-8300-4378-82d5-0684f08c47f6/` (medium)
- `https://ucarecdn.com/06bf3c76-7932-41e4-af21-1c0a18fbb249/` (small)

available for use.

You can consider max width screen size for small as 480px and for medium as
768px.

So let's optimize the code below by using picture tag, so that the small and
medium sized images get loaded when the screen width changes.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
    <img src="https://ucarecdn.com/311947a5-cfd9-4dc2-b6c3-839b532348cc/" alt="A dog running" width="100%" >
</code>

<solution>
<picture>
  <source media="(max-width: 480px)" srcset="https://ucarecdn.com/06bf3c76-7932-41e4-af21-1c0a18fbb249/">
  <source media="(max-width: 768px)" srcset="https://ucarecdn.com/371d1bde-8300-4378-82d5-0684f08c47f6/">
  <img src="https://ucarecdn.com/311947a5-cfd9-4dc2-b6c3-839b532348cc/" alt="A dog running" width="100%">
</picture>
</solution>
</codeblock>
