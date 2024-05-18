In the last lesson, we learned about asynchronous operations. We also learned that asynchronous operations are non-blocking, which means that the line of code following an asynchronous operation is executed immediately after the operation is initiated, without waiting for the operation to complete. This can lead to unexpected results if we want to perform some operation only after the asynchronous operation is complete.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const searchOnGoogle = keyword => {
  setTimeout(() => console.log(`Search results for ${keyword} are here`), 2000);
};

const onSuccess = () => console.log("Search Complete");

searchOnGoogle("Learn JavaScript");
onSuccess();
</code>
</codeblock>

Here, the console message from `onSuccess` is displayed before the console message from `searchOnGoogle`. This is because the function `searchOnGoogle` performs an asynchronous operation using `setTimeout` that delays the console statement by 2 seconds. However, `onSuccess` is called immediately after `searchOnGoogle`, leading to its execution before the search operation completes. If we want to ensure that`onSuccess` is invoked after the execution of `searchOnGoogle`, we can use **callback functions**.

Let's modify the above example to use a callback function to ensure that `onSuccess` is invoked only after the search operation is complete.

<codeblock language="javascript" type="lesson">
<code>
const searchOnGoogle = ({ keyword, callback }) =>
  setTimeout(() => {
    console.log(`Search results for ${keyword} are here`);
    callback();
  }, 2000);

const onSuccess = () => console.log("Search Complete");

searchOnGoogle({ keyword: "Learn JavaScript", callback: onSuccess });
</code>
</codeblock>

If we run the above code, we will see that the console message from `onSuccess` is displayed after the console message from `searchOnGoogle`. This is because the callback function `onSuccess` is invoked within the `setTimeout` block of `searchOnGoogle`, ensuring it runs only after the search operation completes.
