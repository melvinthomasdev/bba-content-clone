Oliver just got his yearly assessment. His skills are graded as:

| Subject    | Score |
| ---------- | ----- |
| Physics    | 93%   |
| Maths      | 83%   |
| Chemistry  | 62%   |
| Biology    | 70%   |
| Attendence | 36%   |

The only thing holding Oliver back is his attendence which is at 36%, which doesn't seem right so he asks for re-evaluation.
After re-evaluation he gets the following results:

- Physics score dropped by 2%.
- Attendence score increased by 40%.
  Update the values accordingly and display the final assessment object.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
  <code>
    let oliverAssessment = {
      "physics": 93,
      "maths": 83,
      "chemistry": 62,
      "biology": 70,
      "attendence": 36
    };
    console.log();
  </code>
  <solution>
    const oliverAssessment = {
      "physics": 93,
      "maths": 83,
      "chemistry": 62,
      "biology": 70,
      "attendence": 36
    }

    oliverAssessment.physics = oliverAssessment.physics - 2;
    oliverAssessment.attendence = oliverAssessment.attendence + 40;

    console.log(oliverAssessment);

  </solution>
</codeblock>
