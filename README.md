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

The attribute `language` is used to specify which programming language is utilized inside the code block.

#### 3.2. `<codeblock type="exercise" >`

The attribute `type` is used to specify whether it is a `lesson` or an `exercise`.

#### 3.2. `<codeblock testMode="fixedInput" >`

The `testMode` attribute is used to specify the mode of testing a solution to a `exercise`.

The value of `testMode` could either be `fixedInput` or `multipleInput`.

While `fixedInput` is used when a exercise has a fixed solution, `multipleInput`is used when we use testcases.

### 4. `panel`

When a single language is not sufficient to run the code, we use multiple `<panel>` tags inside our `<codeblock>`.
For example, if we need HTML, CSS and JS to run our code, then we need to use panels for HTML, CSS and JS inside the `codeblock`.
Its attributes include:

#### 4.1. `<panel language="css" >`
Similar to `codeblock`, the `language` attribute in `panel` is used to specify the choice of programming language.

#### 4.2. `<panel hidden="true">`
The `hidden` attribute is used to hide the code panel.
For example, we might have added some CSS which is for styling the result. It might not specifically relate to the learnings in the lesson. In this case, we can hide the CSS `panel` using the `hidden` attribute.

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

(f) Experimental: Ventilated Prose Style of writing (reference: https://github.com/bigbinary/bb-academy-web/blob/master/doc/writing-style.md)

(g) Avoid writing in parentheses.

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

## Code Block:

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

(i) All courses exist in the `courses` folder in the root folder.

(ii) The `constant.rb` file is where you'll find the single source of truth for data on the courses. This is also from where the application would pick up the details of your course. You can find it as `/config/initializers/constant.rb`.

(iii) Course name should match the one you provide in the `constant.rb` file.

(iv) All courses need a `TOC.yml` file. You can pick up the syntax from TOCs from other courses in the application.

(v) All courses need a header image. This should be located in `/app/assets/images/common`.

## Conventions

(i) File naming starts with 100 and continues forward with multiples of 10. So, the first file in the module could be names like this: '100-design-instruments' and the next one would be '110-design-instruments-ex1'. We use hyphens as delimiters in our filenames.

However, in the practice questions section, file naming continues forward with multiples of 5. So, the first file in the practice questions module could be like this: '100-comprehensive-exercise-ex1' and the next one '105-comprehensive-exercise-ex1'.

The reason for starting filenames with 100:
a. In GitHub, we can have file naming issues, for example, files starting with '10' will come before files starting with '2'. Whereas, when we start filenames with 100, we get a leeway of 100 files before this issue recurs.
b. Starting names of subsequent filenames with multiples of 10 or 5 (In the case of practice questions) gives the course creators the benefit that they can add more files between these files without having to change all the other filenames.
c. Avoiding zero indexing: Instead of starting with 100, the numbering starts with 110. This way, we can avoid the problems associated with starting the count from 0. If we start the count from 100, our 10th module will be 190 instead of 200. This can cause issues if the course creator is not vigilant.

(ii) Slug naming: Slugs should have all lowercase letters. Hyphens should be used as delimiters. Example: 'exercise-text-color'

(iii) Title naming:

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
