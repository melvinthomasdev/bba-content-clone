Let's look at an old example:

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

You can see that the two functions 
are both doing the same thing. They 
are both putting on screen something. 
They are different only because of the value 
they put on the screen. Instead of 
repeating ourselves, let's create a single 
function that can understand what 
value we want on the screen.

Take a look:

<codeblock language="javascript" type="lesson">
<code>
const greeting = (greetingType) => {
  console.log(greetingType);
}

greeting("Hi");
greeting("Hello");
greeting("Welcome");
</code>
</codeblock>

In this function, we put to the screen 
a value that we get from a variable. This 
variable gets a new value each time 
we execute this function.