Sometimes, we want to link to a section in the same
page that we are on. For example, imagine a long page
where you have read a lot and scrolled to the bottom. Now,
wouldn't it be easy to go back to the top without having to
do all that scrolling again?

For these purposes, we can use the `a` tag in the following manner:

<codeblock language="html" type="lesson">
<code>
<h1 id="title">Geographical Concepts</h1>
<a href="#country">Countries</a>
<a href="#city-network">City Network</a>
<a href="#micronation">Micronation</a>
<h2 id="country">Countries</h2>
<p>
  A country is a distinct territorial body or political entity. It may be an independent sovereign state or part of a larger state, as a non-sovereign or formerly sovereign political division, a physical territory with a government, or a geographic region associated with sets of previously independent or differently associated peoples with distinct political characteristics. It is not inherently sovereign.
</p>
<h2 id="city-network">City Network</h2>
<p>
  City networks are a geographical concept studying connections between cities by placing the cities as nodes on a network. In modern conceptions of cities, these networks play an important role in understanding the nature of cities. City networks can identify physical connections to other places, such as railways, canals, scheduled flights, or telecommunication networks, typically done using graph theory. City networks also exist in immaterial form, such as trade, global finance, markets, migration, cultural links, shared social spaces or shared histories. There are also networks of religious nature, in particular through pilgrimage.
</p>
<h2 id="micronation">Micronation</h2>
<p>
  A micronation is a political entity whose members claim that they belong to an independent nation or sovereign state lacking legal recognition by world governments or major international organizations. Most are geographically very small, but range in size from a single square foot to half a million square miles (Westarctica). They are usually the outgrowth of a single individual.
</p>
<a href="#title">Go to top</a>
</code>
</codeblock>

Click on the links to `countries`,
`city network`, `micronation` and
`go to top` to see what we mean.

For
making these links work, we need to
make them point to the `id` of
a part of the same page.
