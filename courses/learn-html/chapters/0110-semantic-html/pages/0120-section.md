The `<section>` element is
used to group elements with
similar information.

Each section should have a
heading element.

Let us take a look at an
example with 2 sections:
<codeblock language="html" type="lesson">
<code>
<panel language="html">
<section id="pacific-ocean">
  <h1>Pacific Ocean</h1>
  <p>The Pacific Ocean is the largest and deepest ocean on Earth, covering more than one-third of the planet's surface. It is known for its stunning biodiversity and vastness.</p>
</section>

<section id="atlantic-ocean">
  <h1>Atlantic Ocean</h1>
  <p>The Atlantic Ocean is the second-largest ocean and is home to a rich marine ecosystem. It separates the continents of North and South America from Europe and Africa.</p>
</section>

<section id="indian-ocean">
  <h1>Indian Ocean</h1>
  <p>The Indian Ocean is the warmest of all the oceans and is known for its diverse marine life, including coral reefs, dolphins, and whales. It plays a vital role in global climate patterns.</p>
</section>

<section id="arctic-ocean">
  <h1>Arctic Ocean</h1>
  <p>The Arctic Ocean is the smallest and shallowest of the world's oceans, located around the North Pole. It is covered by sea ice for most of the year and is home to unique cold-water species.</p>
</section>

</panel>
<panel language="css" hidden="true">
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 10px;
}
section {
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 20px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
}
h1, p {
  color: #fff;
}

#pacific-ocean {
  background-color: #4a90e2;
}
#atlantic-ocean {
  background-color: #1e416b;
}
#indian-ocean {
  background-color: #4f84c4;
}
#arctic-ocean {
  background-color: #c0c0c0;
}
</panel>
</code>
</codeblock>
