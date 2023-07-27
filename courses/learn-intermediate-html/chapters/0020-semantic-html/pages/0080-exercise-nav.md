Put all the links in the
footer in a `nav` tag.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<header>
	<h1>Whales</h1>
</header>
<main>
	<img src="#">
	<p>Whales are protected by international law.</p>
</main>
<footer>
	<ul>
		<li><a href="/home">Blue Whale</a></li>
		<li><a href="/about">Minke Whale</a></li>
		<li><a href="/products">Grey Whales</a></li>
	</ul>
</footer>
</code>

<solution>
<header>
	<h1>Whales</h1>
</header>
<main>
	<img src="#">
	<p>Whales are protected by international law.</p>
</main>
<footer>
	<nav>
		<ul>
			<li><a href="/home">Blue Whale</a></li>
			<li><a href="/about">Minke Whale</a></li>
			<li><a href="/products">Grey Whales</a></li>
		</ul>
	<nav>
</footer>
</solution>
</codeblock>