Update the code below to use
correct HTML element for each
section.
<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<!-- Update code below -->
<div id="france">
  <h1>France</h1>
  <p>
    France is known for its rich culture, delicious cuisine, and iconic landmarks such as the Eiffel Tower and the Louvre Museum.
  </p>
</div>

<div id="japan">
  <h1>Japan</h1>
  <p>
    Japan is a country of traditions, with a unique blend of modern technology and ancient customs. It's famous for sushi, cherry blossoms, and Mount Fuji.
  </p>
</div>

<div id="brazil">
  <h1>Brazil</h1>
  <p>
    Brazil is a land of diverse landscapes, from the Amazon Rainforest to the beautiful beaches of Rio de Janeiro. It's also known for its vibrant Carnival celebrations.
  </p>
</div>

<div id="egypt">
  <h1>Egypt</h1>
  <p>
    Egypt is home to ancient wonders such as the pyramids and the Sphinx. It has a rich history that spans thousands of years along the banks of the Nile River.
  </p>
</div>
</panel>
<panel language="css" hidden="true">
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}
section {
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 20px;
  margin: 20px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
}
h1 {
  color: #fff;
  background-color: #333;
  padding: 10px;
}

#france {
  background-color: #0055a4;
  color: #fff;
}
#japan {
  background-color: #d00;
  color: #fff;
}
#brazil {
  background-color: #009e49;
  color: #fff;
}
#egypt {
  color: #666;
  background-color: #fff200;
}
</panel>
</code>

<solution>
<!-- Update code below -->
<section id="france">
  <h1>France</h1>
  <p>
    France is known for its rich culture, delicious cuisine, and iconic landmarks such as the Eiffel Tower and the Louvre Museum.
  </p>
</section>

<section id="japan">
  <h1>Japan</h1>
  <p>
    Japan is a country of traditions, with a unique blend of modern technology and ancient customs. It's famous for sushi, cherry blossoms, and Mount Fuji.
  </p>
</section>

<section id="brazil">
  <h1>Brazil</h1>
  <p>
    Brazil is a land of diverse landscapes, from the Amazon Rainforest to the beautiful beaches of Rio de Janeiro. It's also known for its vibrant Carnival celebrations.
  </p>
</section>

<section id="egypt">
  <h1>Egypt</h1>
  <p>
    Egypt is home to ancient wonders such as the pyramids and the Sphinx. It has a rich history that spans thousands of years along the banks of the Nile River.
  </p>
</section>
</solution>
</codeblock>