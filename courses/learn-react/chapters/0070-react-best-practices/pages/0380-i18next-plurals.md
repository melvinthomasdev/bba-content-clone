Before reading this lesson make sure that you are thorough with the contents in
the [Locale translations in React](/locale-translations-in-react) lesson.

## How to pluralize translations?

Sometimes while working on an application, it might be essential to display
either the singular or the plural form of a word based on the count of some
entity.

For example, let's say you are required to show the total number of articles in
the dashboard of an application that you are working on. The message might read:
"2 articles". Here the form of the word "article" depends on count of the
articles. i.e. it could be "1 article" or "2 articles".

As you might recall, all such visible strings in the UI are ought to be stored
in the translation file, `en.json`.

So how will you implement this?

Before revealing how we solve this at BigBinary, we will explore three different
approaches.

If you are interested in the final solution only, then skip the next section
without missing out anything vital. But its highly recommended that you go
through the following section.

## Three different approaches

- The first approach is to add "articles" key to the `en.json` translation file
  and set the value as "article(s)". i.e. Modifying the message to "2
  article(s)".

- The second approach is to add both "article" and "articles" to the translation
  file, `en.json`, and conditionally render the correct form using ternary
  operator and string interpolation.

- The third approach is to use a package like
  [pluralize](https://www.npmjs.com/package/pluralize) to get the job done.

The first solution appears to be rather lazy way of approaching the problem.
Let's say you felt it's okay to let this one slide. Would turn a blind eye to
this delete alert title "Delete 2 article(s)?" as well? You shouldn't, we should
be systematic.

The second approach is a hacky way to get things done. BigBinary is averse to
such solutions, period.

In-case of the third approach, you might feel that nothings wrong with it. But
if you look under the hood, you could see that the pluralization is done based
on a set of rules. This will correctly pluralize English words, but for the
other languages, it won't return the correct plural form. This is problematic
for us, as we localize our visible strings.

For example, the word for "woman" in Spanish is "mujer" and "women" is
"mujeres", to be specific "la mujer" and "les mujeres", let's ignore the
definite articles "la" and "les". But the `pluralize` package will return
"mujers", which is wrong.

If you are interested, go through the
[source code](https://github.com/plurals/pluralize/blob/master/pluralize.js) of
the `pluralize` package and see how it's done.

Now to the final act.

## i18next Plurals

So how do we handle such cases at BigBinary? We use
[Plurals](https://www.i18next.com/translation-function/plurals) that comes with
the `i18next` package.

Follow the steps:

1. Add the following key-values to the translation file, `en.json`:

```js
// ...Previous key-value pairs

  "articleWithCount_one": "{{count}} article",
  "articleWithCount_other": "{{count}} articles"

// ...Remaining key-value pairs
```

2. Let's assume that the number of articles are stored in the variable
   `articlesCount` and the above key-value pairs were added to the `common`
   property in the translation file. Then, invoke the `t` method of `i18next`
   the following way:

```jsx
<Typography>
  {t("common.articleWithCount", { count: articlesCount })}
</Typography>
```

If the `articleCount` is `1`, then the returned string is `article`. Otherwise,
it's `articles`.

`articleWithCount_one` and `articleWithCount_other` are not the only available
keys, there are:

- `key_zero`
- `key_two`
- `key_few`
- `key_many`

You just have to replace `key` with `articleWithCount` in our case. The list is
not exhaustive, refer
[Plurals](https://www.i18next.com/translation-function/plurals), on how to use
them.

Now we'll look at another case, where we don't have to display the count along
with the pluralized word, i.e. just "article" or "articles". If you just need to
display either one of the forms, follow the steps below:

1. Export the following constants from the `src/common/constants.js` file:

```js
export const SINGULAR = { count: 1 };
export const PLURAL = { count: 2 };
```

2. Add the following key-value pair in the translation file, i.e. `en.json`
   file:

```js
  "article_one": "article",
  "article_other": "article",
```

3. Use the `t` method with the imported constants:

```js
// if the required form is singular
  <Typography>{t("common.article", SINGULAR)}</Typography>

// or if the required form is plural
  <Typography>{t("common.article", PLURAL)}</Typography>
```

## Conclusion

While working at BigBinary, the accepted way to pluralize words is by using the
Plurals in the `i18next` package.

But there could some exceptional cases where we will have to rely on packages
like `pluralize`. One such case is when we have to pluralize user inputs. These
cases can't be handled by `Plurals` in the `i18next` as we won't have an
equivalent translation key in `en.json` file beforehand.

In all other normal cases, we ought to implement pluralization with the
`Plurals` in `i18next` as mentioned above.
