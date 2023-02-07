Given is the list of average attendence of students from roll-numbers 1-10 respectively.
`
["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]
`
Display the average attendence of roll numbers 6, 7 and 10 expected as:

```
The average attendence of:
- Roll number 6 is X%.
- Roll number 7 is Y%.
- Roll number 10 is Z%.
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
  <code>
    
  </code>
  <solution>
    const averageAttendence = ["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]

    console.log(
      `
        The average attendence of:
          - Roll number 6 is ${averageAttendence[5]}%.
          - Roll number 7 is  ${averageAttendence[6]}%.
          - Roll number 10 is  ${averageAttendence[9]}%.
      `
    );

  </solution>
</codeblock>
