Sometimes, we need to be able to
send our data across to different devices
on the internet which could be using
different programming languages.

We require a format to store data
that can be easily understood by
all programming languages.
For this, in JavaScript,
we have the **JavaScript Object Notation** or **JSON**.

Run the code given below
to see how JSON looks:

<Editor lang="javascript">
<code>
let name = JSON.stringify({
  menu: {
    dish: [
      {
        title: "Biryani",
        availability: false
      },
      {
        title: "Pizza",
        availability: true
      }
    ]
  }
})
console.log(name);
</code>
</Editor>

What you see in the above result is
the JSON way of representing this information.
As you can see, it is a completely text-based format.
Each key is a string and has to be in double quotes.
