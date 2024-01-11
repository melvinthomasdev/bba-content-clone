[Tailwind CSS](https://tailwindcss.com/) is a very popular
CSS framework for building modern web applications.

## Learning Tailwind CSS

At the bottom of this chapter we have added some references to learn
`Tailwind CSS`. But to get an idea about the fundamentals, one can go through
the
[official Tailwind CSS documentation](https://tailwindcss.com/docs/utility-first),
which explains the core concepts.

From the perspective of the book, we only need to grasp the basics of
`Tailwind CSS`.

The code we have shown pertaining to `Tailwind CSS`, within the book, can be
directly copy-pasted, and it will work.

## Installing Tailwind CSS

Run the following from the root of your project:

```bash
yarn add tailwindcss@1.9.6
```

Note that we are not using the latest version(>2.0.x) of tailwindcss since it
has some issues with webpacker environment.

Next we need a directory where our stylesheets can reside. Run the following
command to create that directory:

```bash
mkdir -p ./app/javascript/stylesheets/
```

Next we need to create the tailwind config file, which is the main configuration
file related to colors, sizes, purging. More info about the configuration is
available [over here](https://tailwindcss.com/docs/configuration). Now run the
following command:

```bash
npx tailwindcss init -p
```

First we need to ensure that we can see `tailwind.config.js` and
`postcss.config.js` files in the project root, before going further ahead.

Let's import some basic tailwind styles in the
`app/javascript/stylesheets/application.scss` file, which will allow us to use a
wide variety of tailwind utilities. Ultimately these imports will be replaced
with its corresponding CSS on build process. Run the following commands as is to
set it up:

```bash
touch ./app/javascript/stylesheets/application.scss # creates the file
cat <<EOT >> ./app/javascript/stylesheets/application.scss
@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";
EOT
```

Currently we have an `application.scss` in which we have imported our tailwind
styles. But to use it in our JavaScript views, let's import that file in our
`app/javascript/packs/application.js`.

Add the following import statement in `app/javascript/packs/application.js`:

```bash
import "../stylesheets/application.scss"
```

If you hadn't added it manually as mentioned above, then here's some Unix magic
to do the above job automatically:

```bash
sed -n -i'.bak' -e 'p;8a\
import \"../stylesheets/application.scss\"' "app/javascript/packs/application.js"
rm -f "app/javascript/packs/application.js.bak"
```

Now let's require our tailwind config and `autoprefixer` in our
`postcss.config.js` which is in the root directory of the project. Run the
following command. Note that this will overwrite the existing content of
`postcss.config.js`.

```bash
cat <<EOT > ./postcss.config.js
module.exports = {
  plugins: [
    require("postcss-import"),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
    }),
    require("tailwindcss")("./tailwind.config.js"),
    require("autoprefixer"),
  ],
};
EOT
```

In simple terms `postcss` or post processing our CSS, takes our existing CSS and
extends it, as opposed to preprocessors which use functions and variables to
help write our CSS in a much more efficient, manageable way.

Early Sass libraries provided mixins for handling vendor prefixes.

However, vendor prefix standards and requirements will change over time, which
means that libraries may get out of sync with standards.

However, if we use autoprefixer, then we can just write our CSS as-is without
thinking about vendor prefixes and just rely on `autoprefixer` to keep up with
the standards for us.

We are now ready to use `tailwindcss` in our application.

## Tailwind basics

Before we dive into the frontend side of the app, it's important to go through
the basics of Tailwind and how to use it. In most of the places all we need to
do is to use appropriate class names.

```html
<div className="h-screen bg-blue-900 text-black">
  <p>Hello World!</p>
</div>
```

This sets the content's height to cover the screen and have a blue background of
intensity 900 and foreground text color black! Simple right? Tailwind classnames
come naturally once you start using it more often.

You can use the following references to gain a better understanding of Tailwind:

- [Tailwind course from official team](https://tailwindcss.com/course)
- [Scrimba course](https://scrimba.com/learn/tailwind)
- [Official Tailwind docs](https://tailwindcss.com/docs/installation)

Now let's commit these changes:

```bash
git add -A
git commit -m "Setup Tailwind CSS"
```
