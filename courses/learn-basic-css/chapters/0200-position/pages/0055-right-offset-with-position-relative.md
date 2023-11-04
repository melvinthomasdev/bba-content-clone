When we add the offset `right` property
on an element with a `relative` position,
it does the opposite of the `left` property.

This means it moves the element left
and
away from the right edge of the screen.

<codeblock language="html" type="lesson">
<code>
<panel language="html">
<div class="profile-container">
  <div class="profile-image"></div>
  <div class="profile-name">Sam Smith</div>
  <div class="profile-buttons">
    <button class="profile-button">Edit</button>
    <button class="profile-button">Settings</button>
  </div>
</div>
</panel>
<panel language="css">
.profile-container {
  height: 100vh;
  text-align: center;
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
  padding: 0;
}

.profile-image {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  margin: 0 auto 20px auto;
  background-image: url('https://ucarecdn.com/8b4a9a74-3de8-46cb-b394-ad767f8b4d58/-/preview/500x500/-/quality/smart_retina/-/format/auto/');
  background-size: cover;
  background-position: center;
}

.profile-name {
  font-size: 24px;
  font-weight: bold;
}

.profile-buttons {
  position: relative;
  right: 20px;
  display: flex;
  flex-direction: column;
}

.profile-button {
  background-color: #007bff;
  color: #fff;
  padding: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
}

.profile-button:hover {
  background-color: #0056b3;
}
</panel>
</code>
</codeblock>

From the code above,
we can observe that the
button elements have moved
away from the right edge of
the container element.

This happens because of the
**position** property added
as `relative` and **right**
offset as `20px` to the
element with class
`profile-buttons`.
