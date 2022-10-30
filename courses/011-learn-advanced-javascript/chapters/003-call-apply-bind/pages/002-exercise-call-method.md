Use `call` and run the
`numberFun` function so that
it prints to the console,
`The only even prime number is: 2`.
​
<Editor type="exercise" lang="javascript">
<code>
let evenPrime = {anInteger: 2};

function numberFun(funFact) {
  console.log(funFact + this.anInteger);
}
</code>

<solution>
let evenPrime = {anInteger: 2};

function numberFun(funFact) {
  console.log(funFact + this.anInteger);
}

numberFun.call(evenPrime, "The only even prime number is: ");
</solution>
</Editor>
​

​
