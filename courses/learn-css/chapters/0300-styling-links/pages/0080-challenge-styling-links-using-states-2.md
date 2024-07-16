You have a navigation menu with multiple `<a>` tags.
These links take us to different sections in the same website.

Update the CSS code given below such that when we hover
over a menu item, the background color changes to `#333333`,
and the text color changes to `#ffffff`.

Use the class `menu-item` to select the links.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<a href="#" class="menu-item">Products</a>
<a href="#" class="menu-item">Services</a>
<a href="#" class="menu-item">Blog</a>
<a href="#" class="menu-item">Gallery</a>
<a href="#" class="menu-item">Contact Us</a>
</panel>
<panel language="css">
.menu-item {
  background-color: #f2f2f2;
  color: #333333;
  text-decoration: none;
}
/*write your code here*/
</panel>
</code>

<solution>
.menu-item {
  background-color: #f2f2f2;
  color: #333333;
  text-decoration: none;
}
/*write your code here*/
.menu-item:hover {
  background-color: #333333;
  color: #ffffff;
}
</solution>
</codeblock>
