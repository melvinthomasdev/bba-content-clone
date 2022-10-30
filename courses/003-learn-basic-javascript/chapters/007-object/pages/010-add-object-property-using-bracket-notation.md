We have an object `subjects` in the editor.

If we try to add the value `Mathematics`
to the key `104` using the **dot operator**
it gives an error.

<Editor lang="javascript">
<code>
let subjects = {
  101: "Physics",
  102: "Biology",
  103: "Chemistry"
};

subjects.104 = "Mathematics";

console.log(subjects);
</code>
</Editor>

This is because,
the name of the key is not
a proper variable name.
Now, to add the value of this property,
we must use the **bracket notation**.

<Editor lang="javascript">
<code>
let subjects = {
  101: "Physics",
  102: "Biology",
  103: "Chemistry"
};

subjects[104] = "Mathematics";

console.log(subjects);
</code>
</Editor>

In the example given above,
we add the value `Mathematics` to
the `104` key in the object
using **bracket notation**.