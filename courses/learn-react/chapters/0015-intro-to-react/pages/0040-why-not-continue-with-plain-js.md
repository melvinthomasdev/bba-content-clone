Let us look at example to understand one major benefit React has over using plain JavaScript to manipulate DOM.

We are going to add the below set of code into both the `divs` (`plain-js-section-red`,`react-section-blue`).

```html
    <div class="container">
        <h1> We are from BB Academy <h1>
        <p id="current-time"> Current Time: 22:12:45 </p> 
        <form>
            <label> Name </label>
            <input type="text"/>
            <button>Submit</button>
        </form>
    </div>
```

- We will have the current time retrived using JavaScript `Date` method and add it to the above `p` element. 
- We will then make sure the current time is updated every second by executing the same using a [setInterval method](https://academy.bigbinary.com/learn-intermediate-javascript/timeouts-and-intervals/run-function-at-fixed-time-intervals).


<codeblock language="javascript" type="lesson">
<code>

<panel language="html">

<div id="root">
    <div id="plain-js-section-red"></div>
    <div id="react-section-blue"></div>
</div>
<script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
<!-- React DOM -->
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
<!-- Babel -->
<script src="https://unpkg.com/@babel/standalone@7.8.3/babel.js"></script>

<script type="text/babel">
    const htmlDomSection = document.getElementById("plain-js-section-red");
    const reactSection = document.getElementById("react-section-blue");
    const ReactRoot = ReactDOM.createRoot(reactSection);
    
    const updateTime = () => {
        const time = new Date().toLocaleTimeString();

        const contentUpdatedUsingPlainJS = 
        `
        <div class="container">
            <h1>We are from BB Academy (Plain JS)</h1>
            <p class="current-time">${time}</p>
            <form>
                <input type="text"/>
                <button>Submit</button>
            </form>
        <div>
        `
        htmlDomSection.innerHTML = contentUpdatedUsingPlainJS;

        const contentUpdatedUsingReact = 
        <div className="container">
            <h1>We are from BB Academy (React)</h1>
            <p className="current-time">{time}</p>
            <form>
                <input type="text"/>
                <button>Submit</button>
            </form>
        </div>;

        ReactRoot.render(contentUpdatedUsingReact);
    }
    setInterval(updateTime, 1000);
</script>
</panel>
<panel language="css">
#plain-js-section-red {
    color: crimson;
}

#plain-js-section-red input {
    border: 3px solid crimson;
}

#react-section-blue {
  color: midnightblue   
}

#react-section-blue input {
    border: 3px solid midnightblue;
    margin-right: 3px;
}
</panel>
</code>
</codeblock>

The actions we took looks almost similar and so are the output at the first look. 

Now try typing in the `input` created by plain JS (red). You would notice that the content typed into the plain JS input (red) is getting cleared off.

Everytime the function `updateTime` is executed by setInterval, in the plain JS DOM manipulation, we update all the elements inside `contentUpdatedUsingPlainJS`, therefore while you are typing in, one second passes and setInterval calls function `updateTime` and the input element is updated.

One way to fix this is if we decided to only update the `p` element with the time by selecting it with its class value of `current-time`. 

But what if code could automatically find out the only data that has changed and update just that?

That is exactly what happens with React. Now try, typing in the `input` created by React(blue. 

It persists! Thanks to the fact, that React internally verifies what has changed or differed and only updates that.

The below gif clearly show which elements gets updated each time the `updateTime` function is executed.

<image>react-vs-plain-js.gif</image>

In the case of Plain JS, you can see the whole `container` div gets updated but whereas in the case of React, only the paragraph element gets updated.

This is one of the main benefits that DOM Manipulation with React provides over plain JS.