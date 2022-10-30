In the code given below,
use the first `.catch` to
handle only **ReferenceError**
and
rethrow all other types of errors.
Use the second `.catch`
to handle all the other errors.

The message in the output should be
`Reference error in the code!`
for the first `.catch`
and
`Can only handle ReferenceError`
for the second `.catch` statement.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="500">
<code>
let promise = new Promise((resolve, reject) => {
  throw new Error("Random error!");
}).catch(error => {
  if() {
    console.log()
  } else {
    console.log();
  }
}).catch(error => {

});
</code>

<solution>
let promise = new Promise((resolve, reject) => {
  throw new Error("Random error!");
}).catch(error => {
  if(error instanceof ReferenceError) {
    console.log("Reference error in the code!")
  } else {
    console.log("Can only handle ReferenceError");
    throw error;
  }
}).catch(error => {
  console.log(`${error}`)
});
</solution>
</Editor>