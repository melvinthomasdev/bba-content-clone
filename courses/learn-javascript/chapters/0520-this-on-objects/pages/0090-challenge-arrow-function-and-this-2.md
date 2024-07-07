Modify the code below to get the output as:

**Welcome! Your preferred language is English.**

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
window.language = "English";

const userPreferences = {
  language: "German",
  setLanguage: function () {
    const greet = {
      language: "French",
      displaylanguage: () => {
        console.log(`Welcome! Your preferred language is ${this.language}.`);
      }
    }
    greet.displaylanguage();
  },
}

userPreferences.setLanguage();
</code>

<solution>
window.language = "English";

const userPreferences = {
  language: "German",
  setLanguage: () => {
    const greet = {
      language: "French",
      displaylanguage: () => {
        console.log(`Welcome! Your preferred language is ${this.language}.`);
      }
    }
    greet.displaylanguage();
  },
}

userPreferences.setLanguage();
</solution>
</codeblock>
