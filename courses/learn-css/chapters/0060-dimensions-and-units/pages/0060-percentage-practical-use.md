Percentage units can be used when
we want the size of the children elements to be
dependent on the size of their parent elements.

Take a look at this example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="parent">
    <div class="child smaller-block">
    </div>
    <div class="child larger-block">
    </div>
</div>
</panel>
<panel language="css">
.parent {
    width: 500px;
    height: 300px;
    background-color: peachpuff;
}

.child {
    display: inline-block;
    height: 200px;
    background-color: midnightblue;
    margin: 8px;
    color: snow;
    text-align: center;
    font-size: 32px;
    font-weight: bold;
}

.smaller-block {
    width: 20%;
}

.larger-block {
    width: 70%;
}


</panel>
</code>
</codeblock>

Here, you can see that providing width of the
blocks in percentage helps create a relationship
between the width of the children and the width of
the parent.

The smaller block will always be 20% of the parent's width
and the larger block will always be 70% of the parent's width.
This way, the proportion will always be maintained no matter
how the parent's size gets changed.

Try changing the size of the parent
from **500px** to **400px** or **600px** to
see percentage in action.