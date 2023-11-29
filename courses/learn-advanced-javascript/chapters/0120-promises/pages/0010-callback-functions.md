Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const searchOnGoogle = (keyword) => {
  setTimeout(() => 
    console.log(`Search results for ${keyword} are here`), 2000);
}
const onSuccess = () => console.log("Search Complete");

searchOnGoogle("Learn JavaScript");
onSuccess();
</code>
</codeblock>

In the above code, the `onSuccess` got executed before the `searchOnGoogle` due to the `setTimeout` inside `searchOnGoogle`. If we want to ensure that`onSuccess` is invoked after the execution of `searchOnGoogle`, we can use **callback functions**.

<codeblock language="javascript" type="lesson">
<code>

const searchOnGoogle = ({ keyword, callback }) =>
  setTimeout(() => {
      console.log(`Search results for ${keyword} are here`)
      callback();
   }, 2000);

const onSuccess = () => console.log("Search Complete");


searchOnGoogle({ keyword: "Learn JavaScript", callback: onSuccess });


</code>
</codeblock>

In the example given above, the message from `onSuccess`
is displayed after the message from `searchOnGoogle`.


Callback functions can be hard to manage and can lead to code that is difficult to read and understand. Hence, Promises are preferred over callback functions in such situations. We'll learn more about Promises in the upcoming chapters.