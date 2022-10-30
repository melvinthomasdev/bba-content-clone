The `for` loop given below prints the numbers from 1 to 10. Use a `break` statement in the loop such that only the numbers from 1 to 5 are printed.

<Editor lang="javascript" type="exercise">
<code>
for (i = 1; i <= 10; i++) {
  console.log(i);
}
</code>

<solution>
for (i = 1; i <= 10; i++) {
  if (i == 6) {
    break;
  }
  console.log(i);
}
</solution>
</Editor>