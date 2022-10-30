You can add spacing **within**
the text fields and text areas
using the `padding` property
and
spacing **around** these input types
using the `margin` property:

<Editor lang="css">
<code>
<panel lang="html">
<form>
  <div>
    <label>Your Name</label><br>
    <input type="text" placeholder="Your Name" />
  </div>
  <div>
    <label>Your Bio</label><br>
    <textarea rows="4" placeholder="Your Bio"></textarea>
  </div>
</form>
</panel>
<panel lang="css">
input[type="text"], textarea {
  padding: 15px;
  margin: 10px 0;
  width: 300px;
}
</panel>
</code>
</Editor>