The `for` loop given below prints the numbers from 1 to 30. Use a `continue` statement in the `for` loop to only print numbers that are divisible by 3.

<Editor lang="javascript" type="exercise">
<code>
for (let i = 0; i <= 30; i++) {
  console.log(i);
}
</code>

<solution>
for (let i = 0; i <= 30; i++) {
  if (i % 3 != 0) {
    continue;
  }
  console.log(i);
}
</solution>
</Editor>