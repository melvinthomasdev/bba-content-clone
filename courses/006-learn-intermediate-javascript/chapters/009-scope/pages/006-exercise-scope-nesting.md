Declare a function `person`. 
The function `fullName` is nested inside it. 

Declare the variables `firstName` inside the function `person` 
and
`lastName` inside the function `fullName`. 

Show `Sam Smith` in the output. 

<Editor type="exercise" lang="javascript">
<code>
function person () {
  let firstName = "Sam";
  
  function  () {
    let lastName = "Smith";

    console.log(`${firstName} ${lastName}`);
  }
  fullName();
} 

person();
</code>

<solution>
function person () {
  let firstName = "Sam";
  
  function fullName () {
    let lastName = "Smith";

    console.log(`${firstName} ${lastName}`);
  }
  fullName();
} 

person();
</solution>
</Editor>