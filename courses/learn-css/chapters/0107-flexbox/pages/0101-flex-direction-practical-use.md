Let us look at a practical use case for the flex-direction property. A common requirement in web design is to create a navigation menu that adjusts its layout based on the screen size. 

Typically, navigation menus are displayed horizontally on larger screens and vertically on smaller screens. Using flex-direction, we can achieve this seamlessly.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
    <nav class="nav-menu">
        <a href="#">About</a>
        <a href="#">Courses</a>
        <a href="#">Workshop</a>
        <a href="#">Showcase</a>
    </nav>
</div>
</panel>
<panel language="css">
* {
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
}

.nav-menu {
    display: flex;
    flex-direction: row;
    justify-content: flex-end;

    background-color: rgb(5, 9, 21);
    padding: 10px;
    width: 100%;
}

.nav-menu a {
    text-decoration: none;
    color: rgb(255, 255, 255);
    padding: 10px;
    font-size: 18px;
}
/* Please refer to the last paragraph to understand about media queries. */
@media (max-width: 600px) {
    .nav-menu {
        flex-direction: column;
    }
}
</panel>
</code>
</codeblock>

To see this in action, you can use your browser's developer tools to resize the viewport and observe the layout change. Below is a GIF showing how the navigation menu switches from a horizontal layout to a vertical layout as the screen size decreases.

<image>flex-direction-navbar-resizing.gif</image>

**Media Queries**

In the above example, we used a media query to change the layout based on the screen size. A media query is a CSS technique used to apply styles based on the conditions such as the viewport size. This allows you to create responsive designs that adapt to different devices.

You will learn more about media queries in detail in an upcoming chapter. For now, understand that they help make your designs responsive and adaptable to various screen sizes.