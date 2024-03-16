Take a look at this example:

<codeblock language="javascript" type="lesson">
  <code>
    fetch('https://catfact.ninja/fact').then(response => response.json())
    .then(data => console.log(data.fact)).catch(error =>
    console.error('Error:', error));
  </code>
</codeblock>

Application Programming Interface or API
is a set of tools through which
we can easily make one software work with
another.

Here, in this example, we use
`https://catfact.ninja/fact` to get the data
that we need and then display it here.
The owner of this database
created the `catfact.ninja` website to
show us how to get access to this data
and use it in different ways. Essentially, to
get the cat data, we need the **CatFact** API.
