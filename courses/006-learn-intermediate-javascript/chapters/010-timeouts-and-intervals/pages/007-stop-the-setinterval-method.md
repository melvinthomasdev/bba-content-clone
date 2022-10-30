The function specified in the
`setInterval` method keeps on
running in a loop, unless we
stop it. We do this
with the help of the `clearInterval`
method. It takes only one parameter:
the **identifier value** that the `setInterval`
method returns.

<Editor lang="javascript">
<code>
function sayHello() {
  console.log("Hello, World!");
}

let identifier = setInterval(sayHello, 3000);
clearInterval(identifier);
</code>
</Editor>

In the example given above,
the function `sayHello` is
not run because `clearInterval`
method cancels the loop started
by `setInterval`.