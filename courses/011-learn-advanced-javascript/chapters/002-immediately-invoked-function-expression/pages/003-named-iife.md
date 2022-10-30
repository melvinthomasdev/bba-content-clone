Normally, IIFE does not require a name.
But even when we name an IIFE,
it keeps on working.

<Editor lang="javascript">
<code>
(function greetings() {
  let message = "Hello, I am Sam Smith";
  console.log(message);
}());
</code>
</Editor>