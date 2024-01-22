You need to rewrite the CSS code given below
for the navigation menu using **CSS nesting**.

Ensure that the styling remains **unchanged**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<header>
  <div class="logo">
    BB Academy
  </div>
  <nav class="menu">
    <ul class="menu-list">
      <li class="menu-item">
        <a href="#">Home</a>
      </li>
      <li class="menu-item">
        <a href="#">About</a>
      </li>
      <li class="menu-item">
        <a href="#">Services</a>
      </li>
      <li class="menu-item">
        <a href="#">Contact</a>
      </li>
    </ul>
  </nav>
</header>
</panel>
<panel language="css">
header {
  display: flex;
  justify-content: space-between;
  padding: 10px;
  background-color: lightcyan;
}

.logo {
  font-size: 2rem;
  color: red;
}

.logo:hover {
  color: blue;
}

.menu {
  padding: 10px;
}

.menu .menu-list {
  list-style: none;
  margin: 0;
  padding: 0;
}

.menu .menu-list .menu-item {
  display: inline-block;
  margin-right: 20px;
}

.menu .menu-list .menu-item a {
  text-decoration: none;
  border: 1px solid black;
  border-radius: 5px;
  color: red;
  padding: 10px;
}

.menu .menu-list .menu-item a:hover {
  background-color: blue;
  color: white;
}
</panel>
</code>

<solution>
header {
  display: flex;
  justify-content: space-between;
  padding: 10px;
  background-color: lightcyan;
}

.logo {
  font-size: 2rem;
  color: red;

  &:hover {
    color: blue;
  }
}

.menu {
  padding: 10px;

  & .menu-list {
    list-style: none;
    margin: 0;
    padding: 0;

    & .menu-item {
      display: inline-block;
      margin-right: 20px;

      & a {
        text-decoration: none;
        border: 1px solid black;
        border-radius: 5px;
        color: red;
        padding: 10px;

        &:hover {
          background-color: blue;
          color: white;
        }
      }
    }
  }
}
</solution>
</codeblock>
