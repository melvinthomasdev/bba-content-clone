Take the following object which contains the file name and its content and add the extension `.md` to the keys.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const fileContent = {
  "readme": "This is a readme file",
  "react": "Installing React",
  "rails": "Installing Ruby and Rails",
};

const addExtensionToFileName = //Complete this function

const filesWithExtensions = addExtensionToFileName(fileContent);
console.log(filesWithExtensions);
</code>
<solution>
const fileContent = {
  "readme": "This is a readme file",
  "react": "Installing React",
  "rails": "Installing Ruby and Rails",
};

const addExtensionToFileName = R.pipe(
  R.toPairs,
  R.map(([key, value]) => [R.concat(key, ".md"), value]),
  R.fromPairs
);

const filesWithExtensions = addExtensionToFileName(fileContent);
console.log(filesWithExtensions);
</solution>
</codeblock>
