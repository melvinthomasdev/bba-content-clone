# BB Academy Content

This repository contains the format in which the course data should be stored, if you choose to keep the source of your neetoCourse courses as a github repository.

You can fork this repository and use it as a template for your own courses.

## Format

### 1. `assets` directory
This directory contains unique assets for the courses. It contains the following sub-directories:

- `images`: This contains all the images used in the course. The images can be used in the markdown files in `pages` and also in `metadata.yml` in courses as home logos and logos.

- `databases`: This contains the `.db` files used in the course pages when an editor makes use of `sql` and needs a database as a base for running/testing queries.


### 2. `courses` directory
This directory contains the courses data.
Each course should be stored in a separate directory inside `courses`, with a preferrably slugified name/reference to a course, but there is no restriction.

For example, the template repository here contains five courses, referenced by `learn-ruby`, `learn-javascript` and so on.

Each course directory should contain the following contents:

#### 2.1. `assets.yml` file ####
This file should contain the assets used in the course. It is a YAML file with the following structure:

```yaml
---
images:
- learn-sql.svg
- sql-header-image.png
- sql_sum.png
databases:
- students1.db
- students2-v1.db
- students3-v1.db
- students3-v3.db
- students3-v2.db
```

All images that we want to use in the course should be listed in the `images` array. Similarly, all databases that we want to use in the course should be listed in the `databases` array.
If you want to use an image or database in the course, it should also be present in the `assets` directory in the repository root.

#### 2.2. `metadata.yml` file ####
This file should contain the metadata/properties of the course. It is a YAML file with the following structure:

```yaml
---
name: Learn HTML
subheading: Learn HTML by actually writing HTML
slug: learn-html
published: false
home_logo: javascript.svg
logo: html-header-image.png
custom_data:
  key: html
```

Here are the validations on these fields:

- *name*: *(required)* *(string)* The name of the course
- *subheading*: *(optional)* *(string)* The subheading/description of the course
- *slug*: *(required)* *(string)* The slug of the course. This is used to generate the URL of the course. This should be unique for each course.
- *published*: *(required)* *(string)* A boolean (*true/false*) value indicating whether the course is published or not.
- *home_logo*: *(optional)* *(string)* The name of the logo file to be used on the home page. A file with the same name should be present in the `assets/images` directory, if specified.
- *logo*: *(optional)* *(string)* The name of the logo file to be used on the course page. A file with the same name should be present in the `assets/images` directory, if specified.
- *custom_data*: *(optional)* *(object)* A custom object containing any custom data that you want to store for the course. This can be used to store any custom data that you want to use in your application.

#### 2.3. `chapters.yml` file ####
This file at the root of each course directory inside `courses`, contains the list of chapters within the course and their data. It is a YAML file with the following structure:

```yaml
- name: Getting started
  slug: getting-started
- name: Convert String into Array
  slug: convert-string-into-array
```

Each chapter in `chapters.yml` contains the following fields:

- *name*: *(required)* *(string)* The name of the chapter
- *slug*: *(required)* *(string)* The slug of the chapter. This is used to generate the URL of the chapter. This should be unique for each chapter within a course.

#### 2.4. `chapters` directory ####
This directory inside each course directory contains the chapters data.
Each chapter should be stored in a separate directory inside `chapters`, with the name starting with a number followed by a hyphen and then the slug of the chapter.
Additionally, the names of chapter directories should be in the same order as they would be in `chapters.yml`. For example, if you have 2 chapters with slugs `getting-started`and `convert-string-into-array` in that order, then a valid naming scheme for the chapter directories can be  `1-getting-started` and `2-convert-string-into-array`.

Each chapter directory should contain the following files:

##### 2.4.1. `pages.yml` #####
This file at the root of each chapter directory inside `chapters`, contains the list of pages within the chapter and their data. It is a YAML file with the following structure:

```yaml
- title: Convert a String into an Array
  slug: convert-a-string-into-an-array
  page_type: lesson
- title: Exercise - String to array
  slug: exercise-string-to-array
  page_type: exercise
```

Each page in `pages.yml` contains the following fields:

- *title*: *(required)* *(string)* The title of the page
- *slug*: *(required)* *(string)* The slug of the page. This is used to generate the URL of the page. This should be unique for each page within a chapter.
- *page_type*: *(required)* *(string)* The type of page. This can be either `lesson`, `exercise` or `assessment`.

##### 2.4.2. `pages` directory #####
This directory inside each chapter directory contains the pages data.

Each page should be stored in a separate markdown (`.md`) file inside `pages`, with the file name starting with a number followed by a hyphen and then the slug of the page.

Additionally, the names of page files should be in the same order as they would be in `pages.yml`. For example, if you have 2 pages with slugs `convert-a-string-into-an-array` and `exercise-string-to-array` in that order, then a valid naming scheme for the page files can be  `1-convert-a-string-into-an-array` and `2-exercise-string-to-array`.

Each markdown file in `pages` should contain just the content of the page in markdown fashion.

### 3. `codeblock`

We write our example and exercise code inside `<codeblock></codeblock>`. The attributes used with it include:

#### 3.1. `<codeblock language="html" >`

The attribute `language` is used to specify which programming language is utilized inside the code block. This is a required attribute.

#### 3.2. `<codeblock type="exercise" >`

The attribute `type` is used to specify whether it is a `lesson` or an `exercise`. This is a required attribute.

#### 3.2. `<codeblock testMode="fixedInput" >`

The `testMode` attribute is used to specify the mode of testing a solution to an `exercise`. This is a required attribute.

The value of `testMode` could either be `fixedInput` or `multipleInput`.

While `fixedInput` is used when a exercise has a fixed solution, `multipleInput`is used when we use testcases.

#### 3.3. `<codeblock matchSolutionCode="true" >`

The `matchSolutionCode` attribute can be used to test solution to an `exercise`, when we want to match the solution code instead of the output. It is considered to be false when not specified. This only works for javascript exercises as of now.

#### 3.4. `<codeblock showTestCaseOutput="false" >`

The `showTestCaseOutput` attribute determines if in exercises involving test cases, the expected output should be shown to the candidate or not. It is considered to be true when not specified. If explicitly set to false, the expected output will not be shown to the candidate. This only works for multipleInput exercises (exercises involving test cases).

#### 3.5. `<codeblock evaluateAsync="true" >`

The `showTestCaseOutput` attribute determines if you want to evaluate the javascript code written by a student asynchronously or not. It is considered to be false when not specified. If explicitly set to true, the javascript code will be evaluated asynchronously. Code involving promises, async/await, etc. cannot be evaluated in a linear single thread fashion. So we convert the candidate code into non-async code using Abstract Syntax Trees (AST) and then evaluate it. This only works for javascript exercises. Use it in javascript exercises where you feel the candidate code might involve async code.

#### 3.6. `<codeblock showSolution="false" >`

The `showSolution` attribute determines if you want to show the candidate the solution to the exercise or not. It is considered to be true when not specified. If explicitly set to false, the solution button on the editor toolbar will not be shown to the candidate.

#### 3.7. `<codeblock showRunCodeButton="false" >`

The `showRunCodeButton` attribute determines if you want to show the candidate the run code button on the editor toolbar or not. It is considered to be true when not specified. If explicitly set to false, the run code button on the editor toolbar will not be shown to the candidate.

#### 3.8. `<codeblock formatCodeByDefault="false" >`

The `formatCodeByDefault` attribute determines whether you want to apply formatting to the solution code by default. It is considered to be true when not specified. If explicitly set to false, the solution code will not be formatted by default.

#### 3.9. `<codeblock packages="ramda, moment" >`

The `packages` attribute determines what other npm packages should be loaded while running the javascript code written by the student. It is considered to be empty when not specified. If explicitly set to a comma separated list of npm package names, those packages will be loaded while running the student's  code. This only works for javascript editors. Right now, only `ramda` is supported. If you come across a use case where you need to load other packages, please reach out to neetoCourse dev team to check if that package can be supported or not.

#### 3.10. `<codeblock images="view-from-a-plane.jpg, view-from-a-chopper.jpg" >`

The `images` attribute what images should be loaded while running the student's code. It is considered to be empty when not specified. If explicitly set to a comma separated list of image names, those images will be loaded while running the student's  code. This works for javascript/html/css editors. The images should be present in the `images` directory of the chapter. Usually, when saving content in neetoCourse, the logic automatically scans if an editor should be preloaded with an image/ a set of images or not. But there can be explicit cases. For example, you may provide a directive to a student with an image without src, and ask them to change the src to one of the other images. For the changed code to load the image correctly in the browser that displays resultant html, the editor needs to know about the images it has to keep ready. In such cases, you can use the `images` attribute.

#### 3.11. `<codeblock dbName="students1.db" >`

The `dbName` attribute specifies what sqlite db to load for display and to run queries on when it is an SQL editor. It is a required attribute if you set `language="sql"` on a codeblock. The db should be present in the `assets/databases` directory in the repository root, and should be mentioned in the assets.yml file in the course root.

#### 3.12. `<codeblock dbName="students1.db" displayDbOnly="true" >`

The `displayDbOnly` attribute specifies if the db should be loaded only for display purposes or not. It is considered to be false when not specified. If explicitly set to true, only the database tables will show up. This means that there will be no editor that shows up and the student will not be able to run queries on the db. This only works for SQL editors.

#### 3.13. `<codeblock dbName="students1.db" focusTableBeforeRun="students" >`

The `focusTableBeforeRun` attribute specifies what table should be shown (focussed on) to the student when the db loads up below the editor. By default, the first table in the list of tables in the db is shown. The other tables can be accessed using tabs. When explicitly specified, the table mentioned in the attribute will be focussed to the student. This only works for SQL editors.

#### 3.14. `<codeblock dbName="students1.db" focusTableAfterRun="students" >`

The `focusTableAfterRun` attribute specifies what table should be shown (focussed on) to the student when a query by the student is run successfully on the db. By default, the query output tab is shown. The other tables can be accessed using tabs. But you can think of a case where you expect the candidate's query to change some state in a table that's not the first in the list of tables. For better UX, we may want to focus on that table if the query is run successfully. When explicitly specified, the table mentioned in the attribute will be focussed to the student post the query run. This only works for SQL editors.

#### 3.15. `<codeblock dbName="students1.db" checkForViews="studentsData" >`

The `checkForViews` attribute specifies which SQL views to check for when the student's query is run. It is considered to be empty when not specified. If explicitly set to a comma separated list of view names, those views will be checked for when the student's query is run. If the student's query does not match the expected output of the view, the student's query is considered to be wrong. This only works for SQL exercise editors.

#### 3.16. `<codeblock language="ruby" cache="false" >`

The `cache` attribute specifies if we want to save the expected output of solution against an exercise saved or not. It is considered to be true when not specified. If explicitly set to false, the expected output of the solution will not be saved against the exercise. It is turned on by default for the sake of speed in evaluation. Expected output against a solution once processed through judge0, is expected to be always the same, so it is saved in the db so that each future evaluation of exercises is faster by avoiding not running solution code through judge0. Exceptions are a few cases where the code involves generating random numbers, deals with date/time or expects the student to print an arbitrary value. In these cases, saving the expected output of code might fail in evaluation, so we can turn off caching of output code by setting this attribute to false in such cases.

#### 3.17 `codeblock language="javascript" foldLines="1-3, 4-9"`

The `foldLines` specifies the ranges of lines that should be folded on default load of the editor. You can specify one or more ranges, separated by comma. Each range should be specified as `startLine-endLine`. For example, `1-3, 4-9` will fold lines 1 to 3 and 4 to 9. This only works for editors that don't have panels. For editors with panels, you can use the `foldLines` attribute on the `panel` tag.

### 4. `panel`

When a single language is not sufficient to run the code, we use multiple `<panel>` tags inside our `<codeblock>`.
For example, if we need HTML, CSS and JS to run our code, then we need to use panels for HTML, CSS and JS inside the `codeblock`.
Its attributes include:

#### 4.1. `<panel language="css" >`
Similar to `codeblock`, the `language` attribute in `panel` is used to specify the choice of programming language.

#### 4.2. `<panel hidden="true">`
The `hidden` attribute is used to hide the code panel.
For example, we might have added some CSS which is for styling the result. It might not specifically relate to the learnings in the lesson. In this case, we can hide the CSS `panel` using the `hidden` attribute.

#### 4.3. `<panel foldLines="1-3, 4-9">`
Similar to `codeblock`, the `foldLines` attribute is used to fold the lines of code on default load of the editor.

### 5. Writing code snippet

While writing code snippet you should mention the language name, for example **javascript**
should be ` ```js `.

## Commit hook validations

To make sure the data is valid, we have a commit hook that runs validations on the data on each commit made to the repository. If the data is not valid, the hook will fail.

To set up the hook, run the following commands in the root of the repository:

```sh
bundle install
yarn install
```

After this, the hook will be set up and will run on each commit. The error messages, if a validation fails are quite verbose and should be self-explanatory. They are mostly related to the validations mentioned in the Format section.


# Style Guide

## Language Styling

(a) Use UK English

(b) Focus on clarity

(c) Avoid pedantic language - (should be explained with examples)

(d) Avoid repetition

(e) Write in the active voice: a healthy mix of 'we' and 'you'. For reference, check out the writing style in http://learnyouahaskell.com/syntax-in-functions#pattern-matching

(f) Experimental: Ventilated Prose Style of writing (reference: https://www.bigbinary.com/books/how-we-work/ventilated-prose-for-writing-blog)

(g) Avoid writing in parentheses, or using i.e. or etc. among other writing constructs. Try to create smaller, more legible sentences.

(h) Avoid run-on sentences. Also, avoid hanging sentences and starting sentences with an ellipsis. Ellipsis is the three dots that we sometimes see in informal writing. All of these styles of writing create incomplete sentences. We need to stay clear of this.
https://en.wikipedia.org/wiki/Ellipsis

## Content

(a) Should not be opinionated

(b) Examples should be universal (e.g. ice cream is understood by most everyone around the globe)

(c) External links should be avoided and used only as a last resort

(d) Use '-' for starting list items

(e) If a code example is going to result in an error, mention it before the example.

(f) Ensure that the code doesn't run off the edges in the code editor. Try to keep the whole code inside the code editor edges.

(g) To add image xyz.jpg on a page, write this in your md file:
<image>xyz.jpg</image>
Look at db/courses/ruby/40-array/220-subset.md for example
That same image file should exist in app/assets/images/courses/<course_name>/

(h) No code editor in a chapter should be without some introductory text.

(i) Try to keep the use of jargons at a bay. These turn students away. Use them only when really necessary, for example, when you need to reference the topic in later chapters.

(j) Highlighting Code: Backticks for any code, or even mentions of method or property names, for example `addEventListener`

(k) Highlighting non-Code: Bold for anything that isn't code but needs highlighting. This even includes values like 32px. Don't mix this with quotes or anything else. Just use Bold text.

(l) Use caseSensitiveOutput = true in the <editor> tag when you want to test for case in the output

(m) To give images styling, use the `containerClasses` and `imageClasses` props. You can look up their usage in other lessons. Do a global search to look for them.

(n) For courses where you use **console** to show the solution, write `Display values on the screen` instead of `Print the values`.

## Writing code in the Code Block:

- Always use `const` to declare variables unless we are reassigning them.

- When adding comments, add them before the code which it is explaining.

- If there are comments attached leave a line before the comment and after the code to improve readability.

- Make sure that the comments in the code do not use the exact same words as the code.
   - Good:
   ```md
    // inserts the "randomExpression" value as the text content of the span element (one with id: "adjective") adjective.innerText = randomExpression;
    ```

    - Avoid:
    ```md
    // inserts the "randomExpression" value to the inner text of "adjective" element. adjective.innerText = randomExpression;
    ```
### Writing Ruby code:

- Ruby code written in the code block gets executed using [judge0](https://github.com/judge0/judge0) which is an online code execution system. Currently Judge0 only supports **Ruby 2.7.0**.

- Therefore, avoid using syntax which are not supported by Ruby 2.7.0.

- For example, Ruby added instance method `#except` to Hash in the version 3.0 and so the same won't be supported in the code as of now.

## Exercises:

- Use examples and questions that are universally known to a large number of people in the world. Make the context interesting with the standard things like car, cat, dog etc. (Taken from our about section)
- Keep the question statements concise and to the point. Try to reduce the length of the question statements without sacrificing clarity. Clarity is always the top priority.
- Instead of starting statements with "Print the value" or "Return the value," reframe the question to something like "Write a code to print the value."
- When the input values are objects, rather than providing details about their properties in a sentence, it is recommended to use a table to explain them more clearly and effectively."
  - Good
     ```
      If the details of a book are provided in the below format:
     ```
      |Key | Value |
      |--|--|
      |title |Malgudi Days |
      |author |R. K. Narayan |
      |alreadyRead |true |
      |isAvailable |true|

     ```
      Write a code to ..
     ```
  - Avoid
     ```
      The `bookDetails` variable is an object that contains different details of a book,
       like `title`, `author` and user specific details like `alreadyRead `and `isAvailable`.
     ```
- If we need to specify a specific format for the output, use statements:
  - Good:
    ```md
      "print the text in the format"
    ```
  - Avoid:
     ```md
       print as such or print like
     ```
- Prefer using the term `provided` instead of `given` in place like:
  - Good:
     ```
      If the details of a country are provided in the below format:
     ```
  - Avoid:
     ```
      If the details of a country are given in the below format:
     ```
- Instead of using X or Y, use the name of the value in the question.

   - Good:
      ```md
        "The Average speed of Team India was [Average Speed] feet per second."
        "Write a function that calculates the area of a rectangle with a length of [Length] units and a width of [Width] units."
      ```
    - Avoid:
       ```md
         The Average speed of Team India was X feet per second
         Write a function that calculates the area of a rectangle with a length of X units and a width of Y units.
       ```
 - In solutions, always try to store values in variables instead of directly logging them, unless there is a specific reason to do so.

    - Good:
       ```js
         const hoursRemainingForShivering = (currentTemperature - shiveringTemperature) / hourlyTemperatureDecrease;
         console.log(`${name} will start shivering in ${hoursRemainingForShivering} hours.`);
       ```
    - Avoid:
       ```js
         return `Sam will start shivering in ${(initialTemperature-shiveringTemperature)/hourlyTemperatureDecrease} hours.`;
       ```
- To maintain a consistent pattern, avoid addressing the user in the question statements, as we may not be able to do so in all of the questions.

   - Good:
   ```md
     "If the given user has read the book, print .."
     "If the input is a palindrome, the function should return true."
   ```
  - Avoid
  ```md
     If you have read the book, print ..
     If you input a palindrome, the function should return true.
  ```
### Comprehensive Exercise:

- When raising a pull request (PR) with a question, mention the JavaScript concepts used in the solution along with the lesson number in which they were discussed. This will help in two ways:
   - Ensuring that the concepts were covered in the lessons leading up to the question.
   - Determining if the question covers enough concepts to be marked as comprehensive.

## Creating a new Course

(i) All courses exist in the `courses` folder in the root folder. Look at the Format section to understand how to create a new course in the repository.

(ii) This is just a repository of the content of the courses. The actual course data is saved on neetoCourse, and pulled from it to show it on the course website, which in this case is https://academy.bigbinary.com.

(iii) If you have added a new course in this repository and want it to be live, first of all, you need to merge the new course changes to `main`. Then you need to talk to an admin on https://bigbinary-academy.neetocourse.com to create an actual course. Once the admin creates the course on neetoCourse, they'll connect the created course to the directory of the newly created course in this repository. neetoCourse will then sync up all the course data from this repository and show it on the course website. This might take a few minutes from the time the admin creates the course. The admin will let you know once the course is live. For now, the admin is @akashdotsrivastava.

(iv) After a course on neetoCourse has been connected to a course directory in neetoCourse as a source, all subsequent changes that are merged to `main` in that course directory, will keep getting synced up to the actual course on neetoCourse. As a result, the changes will also show up on the course website.

## Conventions

(i) File naming starts with 100 and continues forward with multiples of 10. So, the first file in the module could be names like this: '100-design-instruments' and the next one would be '110-design-instruments-ex1'. We use hyphens as delimiters in our filenames.

However, in the practice questions section, file naming continues forward with multiples of 5. So, the first file in the practice questions module could be like this: '100-comprehensive-exercise-ex1' and the next one '105-comprehensive-exercise-ex1'.

The reason for starting filenames with 100:
a. In GitHub, we can have file naming issues, for example, files starting with '10' will come before files starting with '2'. Whereas, when we start filenames with 100, we get a leeway of 100 files before this issue recurs.
b. Starting names of subsequent filenames with multiples of 10 or 5 (In the case of practice questions) gives the course creators the benefit that they can add more files between these files without having to change all the other filenames.
c. Avoiding zero indexing: Instead of starting with 100, the numbering starts with 110. This way, we can avoid the problems associated with starting the count from 0. If we start the count from 100, our 10th module will be 190 instead of 200. This can cause issues if the course creator is not vigilant.

(ii) Slug naming: Slugs should have all lowercase letters. Hyphens should be used as delimiters. Example: 'exercise-text-color'

(iii) Title naming: Lower case all words with 3 or less letters. Headings should follow **title case**.

(iv) Exercise file naming:

(v) Variable naming: Try to ensure good variable names by naming variables for their utility. For example, instead of
let var1 = "lion"
you can say
let animal = "lion"

Apart from this, we can use some standard names throughout the academy:
(a) Eve Smith
(b) Sam Smith
(c) Renu Sen
(d) Lao Xun
(e) Linh Tran
(f) Chinua Achebe
(g) Carlos Alberti

(vi) Text Wrapping:
All lines of code that exceed editor width get wrapped by default to avoid horizontal scrolling.
If there is a specific case where the content creator wants content to not be wrapped, add an additional property wrapText='false' to the editor instance.

(vii) Adding code in lesson title
You can use backticks (``) to add code in the lesson titles. If you do use backticks in the title, it is required to use double quotes around the complete lesson title.

## Editing Checklist

- Check the module for language clarity, conceptual correctness, grammatical consistency and typos
- Check the code blocks for correctness, formatting and good coding style
- Check the code blocks in exercises for correct solution
- Check the code blocks in exercises for hints
- Check the chapters for correct titles and slugs
- Check the filenames
- Check deployment

## Miscellaneous

Single Action --> Design the chapter in such a way that the student has to perform a single action at the end.
If it feels like there should be more than actions, split them in two chapters.
Practice exercise chapters can be standalone chapters and they can have multiple action points.

No Scroll --> (Try to) Write only so much that the text and the exercise can be completely displayed in a single 1080p screen. Scrolling should be avoided.

Focus on practical chapters first, theory at the last. --> For e.g. the introductory section in JS is to be created later after we have created and launched a practical version of the course.

Mobile Design/mobile screen considerations --> Not our concern right now. This will be charted once web is over.
