[Shakapacker](https://github.com/shakacode/shakapacker)
is a tool that helps bundle JavaScript files using webpack 5+.
It is a successor to [Webpacker](https://github.com/rails/webpacker) and is based on version 6 of Webpacker. For the sake of simplicity we would using the terms `Webpacker` and `Shakapacker` interchangeably.

## Setting up Shakapacker

First, we need to run the `yarn install` command to generate the Yarn lockfile.

```bash
yarn install
```

Remove the `app/javascript` directory as it has some unwanted files. When we
install `shakapacker` it will create the `app/javascript` folder with the required
files.

Remove the `app/javascript` folder with the following command:

```bash
rm -rf app/javascript
```

Let's install `shakpacker`. Let's open `Gemfile` and at the end of the file
we need to add the following code.

```rb
# For compiling and bundling JavaScript. Read more: https://github.com/shakacode/shakapacker
gem "shakapacker", "~> 6.6.0"
```

We are aware that the latest version of shakapacker is v7. However we ran into some issues
with that version. Hence we are locking shakapacker to v6.

```bash
bundle install
```

Now, we can set up the base for `shakapacker` by running the following command.

```bash
bin/rails webpacker:install
```

We will be using version `4.13.1` of `webpack-dev-server`. Run the following command to ensure this.

```bash
yarn upgrade webpack-dev-server@4.13.1
```

The default configurations sets the source path `app/javascript` as the `source_entry_path`
in `config/webpacker.yml`. We need to set a subdirectory of the `source_path`, namely `packs`, to
be the `source_entry_path`.
We also need to make other minor modifications in the webpack configuration.
To incorporate all these, let's replace the contents of `config/webpacker.yml` with shakapacker configuration from the
[Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/config/webpacker.yml)
by executing the following command from the root of the app:

```bash
curl -o "config/webpacker.yml" "https://raw.githubusercontent.com/bigbinary/wheel/main/config/webpacker.yml"
```

Now, let's move the file `app/javascript/application.js` to `app/javascript/packs/application.js`
as per the configuration set in `webpacker.yml`.

```bash
mkdir -p ./app/javascript/packs/
mv ./app/javascript/application.js ./app/javascript/packs/application.js
```

Next, let's add `.browserlistrc` file to the application.

```bash
echo "cover 95%" > .browserslistrc
```

The browserslist configuration controls the outputted JavaScript so that the emitted code
will be compatible with the browsers specified. `cover 95%` selects the smallest set of popular
browser versions with collective usage over 95% of the audience worldwide.

To ensure a single configuration and avoid redundancy, let's remove the following three lines that specify the browserlist configuration inside the `package.json` file, considering that we already have a separate `.browserlistrc` file.

```json
  "browserslist": [
    "defaults"
  ]
```

Let's now install the below packages to our project as a part of the webpack configuration:

```bash
yarn add @svgr/webpack@^8.1.0 babel-plugin-dynamic-import-node@^2.3.3 babel-plugin-macros@^3.1.0 babel-plugin-js-logger@^1.0.17 css-loader@^6.8.1 dotenv-webpack@^8.0.1 i18next ignore-loader@^0.1.2 mini-css-extract-plugin@^2.7.6 js-logger@^1.6.1 postcss@^8.4.29 postcss-flexbugs-fixes@^5.0.2 postcss-import@^15.1.0 postcss-loader@^7.3.3 postcss-preset-env@^9.1.2 process@^0.11.10 ramda sass@^1.66.1 sass-loader@^13.3.2 source-map-loader@^4.0.1 style-loader@^3.3.3
```

Let's also add a `babel.config.js` file with base configurations at the root of the project.
Execute the following command to download and use babel configuration from the
[Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/babel.config.js).

```bash
curl -o "babel.config.js" "https://raw.githubusercontent.com/bigbinary/wheel/main/babel.config.js"
```

The `babel.config.js` file is used to configure Babel's behavior, including which presets
and plugins to use, which files to include or exclude from the compilation process, and
other settings.

To ensure a single configuration and avoid redundancy, let's remove the following five lines that specify the babel configuration inside the `package.json` file, considering that we already have a separate `babel.config.js` file.

```json
  "babel": {
    "presets": [
      "./node_modules/shakapacker/package/babel/preset.js"
    ]
  }
```

## Customizing Shakapacker configuration

Shakapacker gives us a default configuration file `config/webpack/webpack.config.js`.
However, we need to customize this by modifying the webpack configuration, to suit our
application.

When setting up Shakapacker, having files like `environment.js`, `development.js`,
`production.js`, etc, allows us to configure different settings for different
environments in the application.

The `environment.js` file is used to configure settings that are common across all
environments, such as which JavaScript packs to load and which plugins to use. By
separating configuration into different files based on environment, developers can
easily manage and maintain their Shakapacker configuration without having to duplicate
code or remember which settings apply in which environment.

Let's import these customized configurations from `wheel` by running the below command:

```bash
raw_base_url="https://raw.githubusercontent.com/bigbinary/wheel/main"
declare -a configs=(
  "config/webpack/environment.js"
  "config/webpack/development.js"
  "config/webpack/production.js"
  "config/webpack/test.js"
  "config/webpack/rules.js"
  "config/webpack/webpack.config.js"
  "config/webpack/helpers/customize-default-rules.js"
  "config/webpack/helpers/utils.js"
)
for config in "${configs[@]}"; do
  echo "Downloading ${config}..."
  curl --create-dirs -o "${config}" "${raw_base_url}/${config}"
done
```

Let's also create a file `resolve.js` inside `config/webpack` to handle alias using the
below command.

```bash
touch config/webpack/resolve.js
cat << EOF > config/webpack/resolve.js
const path = require("path");

const absolutePath = basePath =>
  path.resolve(__dirname, "..", "..", \`app/javascript/\${basePath}\`);

module.exports = {
  alias: {
  },
  extensions: [
    ".ts",
    ".mjs",
    ".js",
    ".sass",
    ".scss",
    ".css",
    ".module.sass",
    ".module.scss",
    ".module.css",
    ".png",
    ".svg",
    ".gif",
    ".jpeg",
    ".jpg",
  ],
};
EOF
```

We will discuss more about alias in the coming chapters so you don't have to be concerned now.

## Update to stylesheet pack tag

In an earlier chapter, we had removed the following lines from the `app/views/layout/application.html.erb` file:

```erb
<%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
<%= javascript_importmap_tags %>
```

Instead, let us use `stylesheet_pack_tag` to attach CSS packs and `javascript_pack_tag` to handle JavaScript files, as follows:

```erb {1,2}
<%= stylesheet_pack_tag "application" %>
<%= javascript_pack_tag "application" %>
```

We will discuss in depth about why we need to do this replacement towards the
end of the book.

If you're very curious and don't mind the complexity at this early
stage itself, then you can give
[this section](/learn-rubyonrails/webpacker-in-depth#significance-of-stylesheet-pack-tag)
a read to understand about Shakapacker's CSS compilation.

Once verified, add this new application to git:

```bash
git add -A
git commit -m "Setup Shakapacker"
```
