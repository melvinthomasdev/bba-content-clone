The `<main>` tag is used to
group major content.
But sometimes, we may have
slightly related content
which cannot be added in
the major content.
For example, how should we add
a funny related commentary alongside
a serious article?

In such cases, we can use the `<aside>` tag:

<codeblock language="html" type="lesson">
<code>
<panel language="html">
<header>
  <h1>Space Exploration: The Final Frontier</h1>
</header>
<main>
  <article>
    <aside>
      <p>Space is mind-blowing. It's so vast that even GPS gets lost. And don't get me started on black holes – they're like cosmic vacuum cleaners, but without the annoying cord you trip over.</p>
    </aside>
    <h2>The Importance of Space Exploration</h2>
    <p>Space exploration has opened up new horizons for humanity.</p>
    <p>Space exploration has seen several historical milestones, starting with the launch of the first artificial satellite, Sputnik 1, by the Soviet Union in 1957. This event marked the beginning of the space age.</p>
    <p>The United States and the Soviet Union engaged in a space race during the Cold War era. This competition led to significant achievements, including the first human in space (Yuri Gagarin) and the Apollo moon landings.</p>
  </article>
</main>
<footer>
  <p>&copy; 2023 BigBinary Academy</p>
</footer>
</panel>
<panel language="css" hidden="true">
header {
  background-color: #333;
  color: #fff;
  padding: 20px;
  text-align: center;
}
article {
  background-color: #f9f9f9;
  padding: 20px;
}
h2 {
  color: #333;
}
aside {
  float: right;
  width: 30%;
  margin: 20px;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 5px;
}
h3 {
  color: #666;
}
footer {
  background-color: #333;
  color: #fff;
  text-align: center;
  padding: 10px;
}
</panel>
</code>
</codeblock>

Aside element should be used
in combination with tags like
`main`, `section`, `article`.
