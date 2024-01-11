Convert the following HTML code snippet into JSX:

```html
<H1>Hedy Lamarr's Profile</H1>
<img 
  src="https://i.imgur.com/yXOvdOSs.jpg" 
  alt="Hedy Lamarr" 
  class="profile-photo"
>
<ul>
  <li tabindex="0">Occupation: Actress</li>
  <li tabindex="0">Contributions: Inventor of frequency hopping spread spectrum</li>
  <li tabindex="0">Birth Year: 1914</li>
</ul>
<label for="searchInput">Search: </label>
<input id="searchInput" type="text" aria-label="Search" style="border: 1px solid black; background-color: grey;" />
```


<codeblock language="reactjs" type="exercise" testMode="fixedInput">
<code>
const Profile = () => (
  null // Remove this null and write your jsx code here.
);

export default Profile;
</code>
<solution>
const Profile = () => (
  <>
    <h1>Hedy Lamarr's Profile</h1>
    <img 
      src="https://i.imgur.com/yXOvdOSs.jpg" 
      alt="Hedy Lamarr" 
      className="profile-photo"
    />
    <ul>
      <li tabIndex="0">Occupation: Actress</li>
      <li tabIndex="0">Contributions: Inventor of frequency hopping spread spectrum</li>
      <li tabIndex="0">Birth Year: 1914</li>
    </ul>
    <label htmlFor="searchInput">Search: </label>
    <input id="searchInput" type="text" aria-label="Search" style={{border: "1px solid black", backgroundColor: "grey"}} />
  </>
);

export default Profile;
</solution>
</codeblock>
