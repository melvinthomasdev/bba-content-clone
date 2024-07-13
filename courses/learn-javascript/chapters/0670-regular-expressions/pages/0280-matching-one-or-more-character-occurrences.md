The plus `+` quantifier is used to
match **one** or more occurrences of
the character or group of characters
defined before the `+` in the pattern.

<codeblock language="javascript" type="lesson">
<code>
const text = "BigBinary";

// Single word character match
const regexToMatchSingleCharacter = /\w/;
console.log(text.match(regexToMatchSingleCharacter));

// One or more consecutive word characters match
const regexToMatchOneOrMoreCharacter = /\w+/;
console.log(text.match(regexToMatchOneOrMoreCharacter));
</code>
</codeblock>

1.  **Single Character Match:**
      - regexToMatchSingleCharacter uses \w to match a single word character.
      - The match() method finds the first word character in the string "BigBinary", which is "B".
      - The output is ["B"].

2.  **One or More Character Match:**
      - regexToMatchOneOrMoreCharacter uses \w+ to match one or more consecutive word characters.
      - The match() method finds the sequence of word characters "BigBinary".
      - The output is ["BigBinary"].
