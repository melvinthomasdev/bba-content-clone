Mobile apps are not just built with text alone. There are a lot more components
used such as images, buttons etc. In addition, properly arranging and styling
the components is also important. In this chapter, we will look into two more
core components, `Image` and `SafeAreaView`. Let's see how we can make our user
interface better with styles.

## What is SafeArea?

SafeArea is the portion of the screen where we can display content that won't be
hidden by device notch or home indicator. If you run the _Hello, React Native!_
example from the previous chapter on an iPhone a portion of that text will be
hidden under the notch.

![Hello, React Native!](https://user-images.githubusercontent.com/19279756/113820482-63325c00-9798-11eb-9a15-981e6b78705f.jpg)

To avoid this situation we should display content in the safe area of the
screen. In the below screenshots the areas highlighted in red is the unsafe
area.

![SafeArea iOS](https://user-images.githubusercontent.com/19279756/113820493-662d4c80-9798-11eb-96e7-32c87998b23e.jpg)

We can wrap any component inside the `SafeAreaView` and that will push the
content away from the unsafe area. Let's see how we can add `SafeAreaView` to
the _Hello, React Native!_ example.

```javascript
import React from "react";
import { View, Text, SafeAreaView } from "react-native";

const App = () => {
  return (
    <SafeAreaView>
      <View>
        <Text>Hello, React Native!</Text>
      </View>
    </SafeAreaView>
  );
};

export default App;
```

![Hello, React Native!](https://user-images.githubusercontent.com/19279756/113821533-d7213400-9799-11eb-9263-fd34ccc24343.jpg)

See how wrapping the root `View` component inside the `SafeAreaView` pushed the
content to the safe area and made it properly visible.

> `SafeAreaView` will only work on iOS devices with version 11 or above.

## Style

Now that we know how to put things on the screen properly, let's learn how we
can add some style. In React Native we can add styles to any core component
using the `style` property(prop). There are multiple ways we can provide value
to the `style` prop. We will start with the simple method, passing the style
object directly to the `style` prop.

```javascript
const App = () => {
  return (
    <SafeAreaView>
      <View>
        <Text
          style={{
            color: "blue",
            fontSize: 32,
          }}
        >
          Hello, React Native!
        </Text>
      </View>
    </SafeAreaView>
  );
};
```

![Styled Hello, React Native!](https://user-images.githubusercontent.com/19279756/113821518-d38dad00-9799-11eb-95ca-2299052db6de.jpg)

In the above code snippet, we are giving the text a blue color and font size
of 32. React Native use React and it use
[JSX](https://reactjs.org/docs/introducing-jsx.html) for layout. In JSX you can
pass a constant value to props directly or pass javascript expression inside
curly brackets. In the above snippet, we are passing a JavaScript object to
`style` prop.

## Style attributes

React Native mostly use CSS attributes with camelCase instead of kebab-case for
styling. In the above example, we are using the `fontSize` and `color`
attributes to set font size and text color respectively. React Native doesn't
support all the style attributes available in CSS and every core component won't
support all available attributes. We are not expecting you to have CSS
experience, we will learn more and more attributes as we progress through this
book.

Let's add two more style attributes to the `Text` component.

```javascript
backgroundColor: '#ffefd5',
textAlign: 'center',
```

This will add a background color to the text and align it in the center.

![Styled Hello, React Native!](https://user-images.githubusercontent.com/19279756/113821528-d6889d80-9799-11eb-8780-d860d4f89c93.jpg)

### Color Values

In React Native you can specify color in multiple ways.

- Predefined color values: e.g. `red`, `gold`, `coral`.
- Hexadecimal: `#f0f`(#rgb), `#ff00ff`(#rrggbb), `f0ff`(#rgba),
  `#ff00ff00`(rrggbbaa).
- RGB: `rgb(255, 0, 255)` and `rbga(255, 0, 255, 1).

  Here the `r`, `g`, `b` and `a` stands for red, green, blue and alpha
  respectively. Check out the
  [official doc](https://reactnative.dev/docs/colors) to know more about colors.

### Text Styles

`Text` component can be styled using a lot more attributes. Check out the
[official doc](https://reactnative.dev/docs/text-style-props) for all available
options.

## Reusing Styles

Inline-styles are easy to create, but it has two major drawbacks. First of all,
it will clutter our component code pretty easily and thus affects the code
readability. The second problem with inline styles is that we can't reuse the
styles. Let's jump into an example where we have the scope for reusing styles.

![Styled Hello, React Native!](https://user-images.githubusercontent.com/19279756/113821523-d4beda00-9799-11eb-8753-949e60aa0a3d.jpg)

In this screen, we have two text elements with the exact same style except for
the color. On using inline style the code will look like this.

```javascript
const App = () => {
  return (
    <SafeAreaView>
      <View>
        <Text
          style={{
            color: "blue",
            fontSize: 24,
            textAlign: "center",
            marginHorizontal: 16,
            marginTop: 12,
          }}
        >
          MONEY Master the Game: 7 Simple Steps to Financial Freedom
        </Text>
        <Text
          style={{
            color: "grey",
            fontSize: 24,
            textAlign: "center",
            marginHorizontal: 16,
            marginTop: 12,
          }}
        >
          by Anthony Robbins
        </Text>
      </View>
    </SafeAreaView>
  );
};
```

Here, we have a possibility for code reuse but the same cannot be done with
inline styles.

Since style prop accepts object we can extract the styles to object.

```javascript
const styles = {
  text: {
    fontSize: 24,
    textAlign: "center",
    marginHorizontal: 16,
    marginTop: 12,
  },
  blueText: {
    color: "blue",
  },
  greyText: {
    color: "grey",
  },
};
```

Here we have created a `styles` object. Now we have to pass `styles.text` to
both `Text` components and `styles.blueText` to the first one and
`styles.greyText` to the second. Since style props accept an object we can use
the spread operator to combine multiple objects to one.

```javascript
<SafeAreaView>
  <View>
    <Text style={{ ...style.text, ...style.blueText }}>
      MONEY Master the Game: 7 Simple Steps to Financial Freedom
    </Text>
    <Text style={{ ...style.text, ...style.greyText }}>by Anthony Robbins</Text>
  </View>
</SafeAreaView>
```

This is also a little messy, and there is a better way to do it. Style prop also
accepts array of objects.

Instead of this.

```javascript
style={{...style.text, ...style.blueText}}
```

We can change it to this.

```javascript
style={[style.text, style.blueText]}
```

## StyleSheet

Even though we can use plain JavaScript objects for style it is not a good
practice. What we can do instead is to use the inbuilt StyleSheet API. The
StyleSheet API has a lot of advantages over the normal object, like compile-time
checks, performance improvements and better code auto-completion to name a few.
Let's re-write the entire App component to use the `StyleSheet.create` API.

```javascript
import React from "react";
import { View, Text, SafeAreaView, StyleSheet } from "react-native";

const styles = StyleSheet.create({
  text: {
    fontSize: 24,
    textAlign: "center",
    marginHorizontal: 16,
    marginTop: 12,
  },
  blueText: {
    color: "blue",
  },
  greyText: {
    color: "grey",
  },
});

const App = () => {
  return (
    <SafeAreaView>
      <View>
        <Text style={[styles.text, styles.blueText]}>
          MONEY Master the Game: 7 Simple Steps to Financial Freedom
        </Text>
        <Text style={[styles.text, styles.greyText]}>by Anthony Robbins</Text>
      </View>
    </SafeAreaView>
  );
};

export default App;
```

## Layout

Till now whatever we have put into the screen is displayed in a single column.
This is because React Native use the Flexbox algorithm to layout components and
the default direction is column. It is the same Flexbox algorithm from CSS with
few limitations. Let's modify the App component to display both the text
component in a single row.

```javascript
const styles = StyleSheet.create({
  container: {
    flexDirection: "row", // Change flex direction to row
  },
  text: {
    flex: 1, // Set flex value to 1 for both Text component
    fontSize: 24,
    textAlign: "center",
    marginHorizontal: 16,
    marginTop: 12,
  },
  blueText: {
    color: "blue",
  },
  greyText: {
    color: "grey",
  },
});

const App = () => {
  return (
    <SafeAreaView>
      <View style={styles.container}>
        <Text style={[styles.text, styles.blueText]}>
          MONEY Master the Game: 7 Simple Steps to Financial Freedom
        </Text>
        <Text style={[styles.text, styles.greyText]}>by Anthony Robbins</Text>
      </View>
    </SafeAreaView>
  );
};
```

![Styled Hello, React Native!](https://user-images.githubusercontent.com/19279756/113821509-cffa2600-9799-11eb-878c-628436884e8c.jpg)

### Flex Direction

The `flexDirection` attribute decides the flow of elements in a flex container.
The default value for `flexDirection` is `column` and here we are changing it to
`row`.

### Flex

The `flex` attribute will define how much space the child component will occupy
in the container along the flex-direction. In our example, we are using flex
value 1 for both child components. This will divide the container into 2 and
will give 1 portion to each element.

We can do a lot more with [Flexbox](https://reactnative.dev/docs/flexbox), for
now, we will stop here and will learn more in upcoming chapters.

## Image Component

We already know how to display text on the screen. Let's add one more thing to
our toolkit, images.

`Image` is the React Native core component we can use to display images from the
network(using URL), project files and device storage. Let's add an image to the
App component.

```javascript
import React from "react";
import { View, Text, SafeAreaView, StyleSheet, Image } from "react-native";

const styles = StyleSheet.create({
  text: {
    fontSize: 24,
    textAlign: "center",
    marginHorizontal: 16,
    marginTop: 12,
  },
  blueText: {
    color: "blue",
  },
  greyText: {
    color: "grey",
  },
  image: {
    width: 200,
    height: 300,
  },
});

const App = () => {
  return (
    <SafeAreaView>
      <View>
        <Image
          style={styles.image}
          source={{
            uri:
              "https://user-images.githubusercontent.com/19279756/109667147-da6f4180-7b95-11eb-9d8f-cca772d8733a.jpg",
          }}
        />
        <Text style={[styles.text, styles.blueText]}>
          MONEY Master the Game: 7 Simple Steps to Financial Freedom
        </Text>
        <Text style={[styles.text, styles.greyText]}>by Anthony Robbins</Text>
      </View>
    </SafeAreaView>
  );
};

export default App;
```

![Styled Hello, React Native!](https://user-images.githubusercontent.com/19279756/113822006-8100c080-979a-11eb-9809-813b734b0af9.jpg)

The `Image` component accept a `source` prop where we can directly require and
pass a local image file or an object with the `uri` pointing to the image path
in device storage or on the internet.

Later in this book we will explore the
[Image](https://reactnative.dev/docs/image) component in more detail.

## Assignment

Now that we have learned styling try to make our existing opus app more
beautiful as shown in the below image.

![React Native task 01](https://user-images.githubusercontent.com/19279756/113821526-d5f00700-9799-11eb-877b-b915ebd17ec1.jpg)
