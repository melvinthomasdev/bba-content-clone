Look at the following example:

<codeblock language="javascript" type="lesson">
<code>
const greetWelcome = () => {
  console.log("Welcome");
}

greetWelcome();
</code>
</codeblock>

When we run this function, we 
get **Welcome** on the screen. 
**Welcome** is formal, so, 
if we wanted to have a way to 
print **Hi** to the screen, we have 
to write another function:

<codeblock language="javascript" type="lesson">
<code>
const greetWelcome = () => {
  console.log("Welcome");
}

greetWelcome();

const greetHi = () => {
  console.log("Hi");
}

greetHi();
</code>
</codeblock>

You can see that this practice 
will quickly become difficult 
as the number of greetings increases.