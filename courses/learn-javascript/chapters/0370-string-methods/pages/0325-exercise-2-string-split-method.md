**hashTagsPost1** and **hashTagsPost2** are two sets
of strings representing tags for different blog posts
entered by the users.

To process these tags, use the **split** method to divide
each string into an array of individual tags.
Use `console.log` to display the resulting arrays
of tags for each post.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const hashTagsPost1 = "JavaScript, Web Development, Programming";
const hashTagsPost2 = "CSS, Web Development, Programming";

function extractTagsFromPost(tags) {
// Your code here

}

extractTagsFromPost(hashTagsPost1);
extractTagsFromPost(hashTagsPost2);
</code>

<solution>
const hashTagsPost1 = "JavaScript, Web Development, Programming";
const hashTagsPost2 = "CSS, Web Development, Programming";

function extractTagsFromPost(tags) {
// Your code here
const tagArray = tags.split(", ");
console.log(tagArray);
}

extractTagsFromPost(hashTagsPost1);
extractTagsFromPost(hashTagsPost2);
</solution>
</codeblock>
