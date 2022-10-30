We can use promises to
handle some specific errors
and
rethrow unhandled errors.
The unhandled errors can be dealt with separately.

In the example given below,
the first `.catch` detects the error,
but it can handle only **type errors**
and has to
rethrow all the other errors.
The second `.catch` handles
all the unhandled errors.

<Editor lang="javascript">
<code>
let promise = new Promise((resolve, reject) => {

  createError();

}).catch(error => {

  if(error instanceof TypeError) {

    console.log("Type error in the code!")

  } else {

    console.log("Can only handle TypeError");
    throw error;

  }
}).catch(error => {

  console.log(`${error}`)

});
</code>
</Editor>

You can replace the line

```js
createError();
```

with

```js
let number = 12;
number();
```

and observe the changes in the output.