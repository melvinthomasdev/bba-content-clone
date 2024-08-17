The `:not()` pseudo-clas is
a negation selector which
selects those elements that
do NOT meet a specific condition.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>Websites you Might Use Today</h1>
<a href="https://www.google.com">Google</a>
<a href="https://courses.bigbinaryacademy.com/">BigBinary Academy</a>
<a href="https://duckduckgo.com/">DuckDuckGo</a>
<p>We know more, but these are some you might end up using today.</p>
</panel>
<panel language="css">
:not(a) {
  color: maroon;
}
</panel>
</code>
</codeblock>

In the example, we used the `:not` selector
to mean that all elements which are not
links should have a text color of **maroon**.

We can combine `:not()` with other
selectors too.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <h1>🍦 Ice Cream Delights 🍨</h1>
  <p>Explore our delicious range of ice creams!</p>
  <ul class="item-list">
    <li class="item available">🍓 Strawberry Sensation</li>
    <li class="item">🍍 Pineapple Paradise</li>
    <li class="item available">🍉 Watermelon Wonder</li>
    <li class="item">🍇 Grape Delight</li>
    <li class="item">🍊 Orange Cream</li>
    <li class="item">🍫 Chocolate Chip Cookie Dough</li>
    <li class="item available">🍦 Vanilla Dream</li>
    <li class="item">🍪 Cookies and Cream</li>
    <li class="item">🍯 Honeycomb Crunch</li>
    <li class="item">🌰 Nutty Hazelnut</li>
  </ul>
</div>
</panel>
<panel language="css">
.container {
    background-color: #f0f0f0;
    padding: 20px;
    color: #333;
}
.item-list {
    list-style-type: none;
}
.item {
    padding: 10px;
    border: 1px solid #ccc;
}
.item:not(.available) {
    background-color: #ffcccb;
    text-decoration: line-through;
}
</panel>
</code>
</codeblock>

Here, all ice creams which
do not have an `available`
class on them, get selected
using the `not()` selector.