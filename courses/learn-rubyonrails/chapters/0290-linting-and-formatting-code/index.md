## Wheel from BigBinary

BigBinary's [wheel](https://github.com/bigbinary/wheel) project is the source of
truth for all these configs and toolchains.

Every internal product or Rails project in BigBinary uses `wheel` as the base
for bootstrapping that new project.

Thus if you are asked to create a new Rails project while working in BigBinary,
then you should strictly add the below mentioned hooks and relevant configs into
your project.

## Rubocop

[Rubocop](https://rubocop.org/) is a linter as well as a code formatter
specifically for Ruby.

BigBinary has strong and opinionated coding style guidelines that are enforced
using this tool.

### Add the gems

First, let's add the relevant gems to our `Gemfile`:

```ruby
# previous gems as it was

group :development, :test do
  # previous gems under this group as it was

  # For code formatting and linting
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
end
# other gems if any
```

Now install the gems by running the following from the terminal:

```bash
bundle install
```

Please note that when we added the gems to `Gemfile` we had added it under the
`development` and `test` groups only.

### Add the config

Add BigBinary's Rubocop config to the root of your project by running the
following command from the terminal:

```bash
curl -o ".rubocop.yml" "https://raw.githubusercontent.com/bigbinary/wheel/main/.rubocop.yml"
```

## Running Rubocop on all Ruby files

Run the following from the root of the project in your terminal:

```bash
bundle exec rubocop
```

The above command would output the offenses it finds. Some offenses are
auto-correctable by Rubocop. But some are not.

We auto-correct the correctable ones by running:

```bash
bundle exec rubocop -a
```

That should fix all the safely correctable errors. The non-corrected ones should
be manually corrected.

Moving forward, we won't be running these commands. Rather we will use git hooks
to run these commands for us on modified files.

## Setup Git hooks

Git hooks are scripts that run automatically every time a particular event occurs in a Git repository.

A **pre-commit** Git hook can reformat the files marked as 'staged' by the `git add` command before you commit. The **pre-push** hook runs before changes are pushed to a remote repository using `git push`, allowing you to run scripts or tests to ensure code quality and prevent problematic pushes. Meanwhile, the **post-merge** hook executes after a successful merge, enabling you to perform cleanup, notifications, or other tasks to maintain an up-to-date codebase.

In BigBinary, no PR should be made without running the pre-commit or the pre-push hook. Or more
subtly saying, please don't bypass the Git hooks.

First, let's add the `erb-lint` gem to our `Gemfile`:

```ruby
# previous gems as it was

group :development do
  # previous gems under this group as it was

  # For linting ERB files
  gem "erb_lint", require: false, git: "https://github.com/Shopify/erb-lint.git", branch: "main"
end
# other gems if any
```

Now install the gem by running the following from the terminal:

```bash
bundle install
```

Now, let's set up `husky` to run the hooks and install `lint-staged` to lint the
files.

Run the following commands from the terminal:

```bash
npx husky-init && yarn # press y to proceed
yarn add -D lint-staged
```

Now add the following highlighted lines to the start of your `package.json`
file.

**Note** that you need to retain all other keys which were already part of the
file as it was.

```json {2-24}
{
  "lint-staged": {
    "app/**/*.{js,jsx,json}": [
      "prettier --write",
      "eslint --fix"
    ],
    "{package.json,.eslintrc.js,.prettierrc.js}": [
      "prettier --write",
      "eslint --fix"
    ],
    ".eslint-rules/**/*": [
      "prettier --write",
      "eslint --fix"
    ],
    "./**/*.rb": [
      "bundle exec rubocop -a --force-exclusion"
    ],
    "{Gemfile,Rakefile,config.ru}": [
      "bundle exec rubocop -a --force-exclusion"
    ],
    "app/views/**/*.html.erb": [
      "bundle exec erblint --lint-all --format compact -a"
    ]
  },
  ...
  <rest of the keys as it was>
}
```

Husky, by default, will read the Git hooks from the `.husky` directory within
the root of the project.

When we installed `husky`, it should've automatically created the `.husky`
folder along with some default configs.

Now to setup the hooks copy-paste the whole code block into your terminal and
execute it:

```bash
cat << 'EOF' > .husky/pre-commit
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"
. "$(dirname "$0")/helpers/lint_staged.sh"
. "$(dirname "$0")/helpers/prevent_pushing_to_main.sh"
. "$(dirname "$0")/helpers/prevent_conflict_markers.sh"

prevent_pushing_to_main
prevent_conflict_markers
lint_staged_files
EOF
chmod a+x .husky/pre-commit
curl --create-dirs -o ".husky/helpers/lint_staged.sh" "https://raw.githubusercontent.com/bigbinary/wheel/main/.husky/helpers/lint_staged.sh"
curl --create-dirs -o ".husky/helpers/prevent_pushing_to_main.sh" "https://raw.githubusercontent.com/bigbinary/wheel/main/.husky/helpers/prevent_pushing_to_main.sh"
curl --create-dirs -o ".husky/helpers/prevent_conflict_markers.sh" "https://raw.githubusercontent.com/bigbinary/wheel/main/.husky/helpers/prevent_conflict_markers.sh"

cat << 'EOF' > .husky/pre-push
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"
. "$(dirname "$0")/helpers/prevent_pushing_to_main.sh"

prevent_pushing_to_main
EOF
chmod a+x .husky/pre-push

cat << 'EOF' > .husky/post-merge
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"
. "$(dirname "$0")/helpers/run_install_commands.sh"

run_install_commands
EOF
chmod a+x .husky/post-merge
curl --create-dirs -o ".husky/helpers/run_install_commands.sh" "https://raw.githubusercontent.com/bigbinary/wheel/main/.husky/helpers/run_install_commands.sh"
```

In the following sections, we will set up the tools which our hooks depend upon.

## ESLint

[ESLint](https://eslint.org/) is a static code analysis tool to quickly find
problems with the JavaScript codebase.

Most of the problems ESLint finds can be automatically fixed.

### Add the modules

Run the following command from the terminal:

```bash
yarn add -D eslint \
@babel/eslint-parser \
@babel/preset-react \
eslint-plugin-react-hooks \
eslint-plugin-import \
eslint-config-prettier \
eslint-plugin-prettier \
eslint-plugin-json \
eslint-plugin-react \
eslint-plugin-promise \
eslint-plugin-jam3 \
eslint-plugin-cypress \
eslint-plugin-unused-imports
```

The above command installs the required ESLint plugins.

Prettier is a code formatter that can be integrated with linters. To integrate
prettier with ESLint, we added `eslint-config-prettier` as well as
`eslint-plugin-prettier` modules.

### Add the config

The ESLint configs are modularly handled in the `wheel` repo.

We have to bring in all of those configurations into `granite`.

We also have to manually add a `.eslint-rules/custom.js` file, which is where
all the custom ESLint rules that differs from `wheel` should be added.

Copy paste the following into the terminal and run it:

```bash
raw_base_url="https://raw.githubusercontent.com/bigbinary/wheel/main"
declare -a configs=(
  ".eslintrc.js"
  ".eslintignore"
  ".eslint-rules/helpers/index.js"
  ".eslint-rules/imports/enforced.js"
  ".eslint-rules/imports/order.js"
  ".eslint-rules/globals.js"
  ".eslint-rules/overrides.js"
  ".eslint-rules/promise.js"
  ".eslint-rules/react.js"
)
for config in "${configs[@]}"; do
  echo "Downloading ${config}..."
  curl --create-dirs -o "${config}" "${raw_base_url}/${config}"
done
cat << 'EOF' > .eslint-rules/custom.js
module.exports = {};
EOF
```

## Prettier

An unformatted JavaScript file is really hard to read.
[Prettier](https://prettier.io/) helps us in keeping the code sane and
consistent.

### Add the module

Run the following from the terminal:

```bash
yarn add -D prettier
```

Also add the prettier plugin for tailwind using the following command:

```bash
yarn add -D prettier-plugin-tailwindcss
```

### Add the config

Run the following from the terminal to fetch the Prettier config from `wheel`:

```bash
curl -o ".prettierrc.js" "https://raw.githubusercontent.com/bigbinary/wheel/main/.prettierrc.js"
```

## Formatting all JavaScript files

In the Rails codebase, we can run the following command from the terminal to
format all JavaScript files:

```bash
npx prettier --write "./app/javascript/src/**/*.{js,jsx,json}"
npx eslint --fix "./app/javascript/src/**/*.{js,jsx,json}"
```

Moving forward, we won't be running these commands. We will use git hooks to run
these commands for us on modified JavaScript files.

## Configuring VSCode settings

Now that we have added the configs for the relevant tools, let's add the
necessary VSCode settings to ensure these tools are run on the fly while we
code.

At BigBinary we use the following plugins along with some custom settings in
VSCode, to ensure coding style is maintained from grassroots level.

Now, copy-paste the following commands into your terminal and run them:

```bash
curl --create-dirs -o ".vscode/extensions.json" "https://raw.githubusercontent.com/bigbinary/wheel/main/.vscode/extensions.json"
curl -o ".vscode/settings.json" "https://raw.githubusercontent.com/bigbinary/wheel/main/.vscode/settings.json"
```

Running above commands should've created the relevant configs.

Now, open the `granite` project in VSCode, by running the following from the
root of the project:

```bash
code .
```

If you had the project already opened in VSCode, then restart VSCode for the
settings to take effect.

At the bottom right side, you should will get a popup for installing the
recommended extensions. Go ahead and click the `install` button:

<image alt="VSCode extensions recommendation.">vscode-extensions-recommendation-popup.png</image>

After installation, all the extensions should be working out of the box with the
required settings.

You can visit a Ruby file and see Rubocop provide you live linting. Likewise,
you can visit a JavaScript file and format it via VSCode to see Prettier in
action.

## Adding .editorconfig

We can specify consistent IDE configurations for our project in the
`.editorconfig` file located in the root of the project. This ensures the code
style remains uniform across the project when multiple users are working on the
same project.

We can use the same config from `wheel`.

Run the following command from the terminal:

```bash
curl -o ".editorconfig" "https://raw.githubusercontent.com/bigbinary/wheel/main/.editorconfig"
```

VSCode will automatically detect this configuration, and will strictly adhere to
the rules mentioned in it.

## Enforcing consistent 2-Space Indentation

Using space indentation with 2 spaces is the coding style convention we follow
at BigBinary. This convention is preferred over other indentation styles such as
tab indentation or using a different number of spaces because it promotes
consistency and improves the readability of the code.

The `.editorconfig` file already has the appropriate settings to ensure that the
2-space indentation is consistently applied throughout the project. When using
VSCode, the EditorConfig extension will automatically enforce these settings,
ensuring that the codebase adheres to the established coding style.

Furthermore, to ensure consistency and quality in the codebase, ESLint and
Rubocop have also been configured to check for indentation errors and enforce
the same 2-space indentation convention. These tools will help identify and fix
any indentation issues, ensuring that the codebase is maintainable and easy to
understand for all team members.

## Running Git hooks

You don't need to manually run the Git hooks. These hooks are run automatically
based on the kind of hook we have added.

Currently, we have added a `pre-commit` hook. Thus before each time, you try to
commit new code to the project, the hook will verify the coding style follows
our guidelines.

The Git hook will only be run on files that are currently modified. Meaning, the
hook will ignore all files which were already committed using Git.

That is why we mentioned a previous section on how to run the formatting on all
files, which is inclusive of the committed files, if need be.

If the Git hook fails, then it means that you need to fix a particular section
within your codebase manually.

Once again, never bypass the Git hooks. Always run the Git hooks, resolve the
errors and then only push to GitHub.

## Git hooks in action

Let's commit our code to see the Git hooks in action.

Run the following from the terminal:

```bash
git add -A
git commit -m "Added git hooks, eslint, prettier and rubocop"
```

Ideally, the above command should run without any issues.

But let's take the case where we missed out on adding the string literal comment
as the first comment in the file in our `Gemfile`.

In such a case we might get the following output in the terminal:

<image alt="Rubocop string literal error.">git-hooks-rubocop-fail-stringliteral.png</image>

Rubocop shows an offense when it can't automatically fix the offense.

The first thing we have to note is which task failed in the hook.

Currently, it's the task for `{Gemfile,Rakefile,config.ru}` that has failed.

The next thing to look into is the offenses and check which offense has the
keyword `[Correctable]`.

In the above case, the offense is in the `Gemfile` since we are missing the
string literal comment in it.

For above mentioned scenario we can run the following command from the terminal:

```bash
bundle exec rubocop -A Gemfile
```

**Note** that we have run the unsafe auto-correction mode from Rubocop in the
last command.

It's not recommended to be used often. That's the exact reason why we haven't
added this command as part of our hook. The offenses shown by Rubocop are best
fixed manually.

If you had encountered the above error, then now you should be able to commit,
by running the following commands from the terminal:

```bash
git add -A
git commit -m "Added git hooks, eslint, prettier and rubocop"
```

### References

- [More about ESlint](https://eslint.org/docs/user-guide/configuring)
- [More about Prettier](https://prettier.io/docs/en/configuration.html)
- [More about Husky](https://github.com/typicode/husky)
- [More about Rubocop](https://github.com/rubocop/rubocop)
