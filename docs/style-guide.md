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

- Make sure that our code has semi-colons everywhere they are needed.
   - Correct:
   ```js
    if (true) {
      console.log("This will print to the console.");
    };
    ```

  - Incorrect:
   ```js
    if (true) {
      console.log("This will print to the console.")
    }
    ```

- Make sure that every code block has a visible output.

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

(ii) This is just a repository of the content of the courses. The actual course data is saved on neetoCourse, and pulled from it to show it on the course website, which in this case is https://courses.bigbinaryacademy.com.

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

(iv) Exercise file naming: All exercise file names should have `exercise-` as a prefix.

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

(viii) Use this address as the default address value throughout the Academy:
`Office #803, 8th Floor, World Trade Center, Tower 2, Kharadi, Pune, Maharashtra`.

(ix) Specify selectors to be used in CSS questions:
When adding exercises dealing with CSS, specify which selector has to be used in the exercise question itself.
For example:
Change the font-size for the `ice-cream` class.

## Editing Checklist

- Check the module for language clarity, conceptual correctness, grammatical consistency and typos
- Check the code blocks for correctness, formatting and good coding style
- Check the code blocks in exercises for correct solution
- Check the code blocks in exercises for hints
- Check the chapters for correct titles and slugs
- Check the filenames
- Check deployment

## Managing chapters

In the process of editing a course, it may be necessary to add new chapters or reorder existing ones. This guide outlines best practices and provides instructions for utilizing the `chapter_shifter` script to streamline these tasks. Here is a demo video of the script in action: https://vimeo.com/866861766/3f2c2669b3.

### Adding a new chapter to a course

There are cases where we might have to add a new chapter in between the existing chapters.

Example: If there are 5 chapters, then on adding a new chapter and making it say the 2nd chapter, we have to increment the chapter numbers of all previous chapters indexed from 2-5 to 3-6.

In such cases, we can make use of the `chapter_shifter` script to do the job automatically for us.

Follow these steps VERY STRICTLY when you're adding a new chapter to course:

- Manually create a new folder under the desired course without mentioning any chapter number in folder name.
- Don't run `chapter_shifter` script yet!
- Make a PR after adding content to new chapter.
- If you get any review comments, then make the changes locally and push it.
- Once done assign it to the tech lead.
- If everything looks good, the tech lead will give you a go sign for running the `chapter_shifter` script.
- Let's say that the lead gave the go sign to run the `chapter_shifter` script today night.
- Then if you are seeing the comment the next morning, then the first thing you need to do is rebase with the latest `main` branch.
- Only run the `chapter_shifter` script once you rebase with `main`.
- The idea is, before running the `chapter_shifter` script, we have to be up to date with `main`.

The following are the reasons on why we need to follow this pattern:

- If you run the `chapter_shifter` script in the initial stages itself, then rebasing can get tricky.
- The reason is that if you shift chapter numbers and you're editing chapter 47 in your local repo, the corresponding chapter might be number 46 in `main`.
- This has the potential to create havoc during rebase if `main` branch had modified chapter 46.
- In order to avoid such a situation. Please take care to follow the above steps.

The following are the steps to use the chapter shifter script:

- Step1: Add a new directory with the name of the new chapter, in the desired course. Add the necessary contents in the directory.
- Step2: Once you get the go sign from the tech lead as per above instructions, use the following syntax for running that script from the **root** of the project:
```
ruby scripts/chapter_shifter.rb course-name new-chapter-name desired-chapter-number
```
Example usage:
```
ruby scripts/chapter_shifter.rb learn-rubyonrails rails-history 5
```
Make the PR immediately, so as to avoid any conflicts.

### Reordering chapters

In certain situations, it may be necessary to rearrange the order of existing chapters within a course.

Example: if there are six chapters, and you wish to move the second chapter to the fourth position, you must first remove the second chapter. This involves decrementing the chapter numbers of all subsequent chapters, re-indexing them from 3-6 to 2-5. Following this, you can add the removed chapter back into the course as the fourth chapter using the steps outlined in the previous section.

In such cases, we can make use of the `chapter_shifter` script with the `--reverse` option to do the removal part automatically for us.

The considerations for creating a new chapter, as mentioned earlier, should also be applied here. It is essential to merge the PR with the `main` branch as promptly as possible.

To use the chapter shifter script with the `--reverse` option, follow these steps:

- Step 1: Ensure that chapter that you are intending to reverse is already present in the course.
- Step 2: Use the following syntax for running that script from the **root** of the project:
```
ruby scripts/chapter_shifter.rb --reverse course-name non-numbered-chapter-name chapter-number
```

Example usage:
```
ruby scripts/chapter_shifter.rb --reverse learn-rubyonrails rails-history 5
```
Make the PR immediately, so as to avoid any conflicts.
