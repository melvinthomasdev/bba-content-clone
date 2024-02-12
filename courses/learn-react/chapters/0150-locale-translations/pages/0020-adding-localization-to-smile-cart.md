In the previous lesson, we have initialized `i18n`. In this lesson, we will learn how to implement localization in our components. To demonstrate its usage we will replace all the hardcoded strings in the `Cart/PriceCard.jsx` file with the translation strings.

Let's get started by localizing the hardcoded button label `"Buy Now"` in the `PriceCard` component:

To achieve this, we should add translation key for the "Buy Now" string in the `en.json` file.

```json
{
  "buyNow": "Buy now"
}
```

To use translation strings inside our components, we need to import the `useTranslation` hook from the `react-i18next` library. The `useTranslation` hook provides a translation function called `t` that takes a translation key as an argument and returns the corresponding translated string from the translation file. We will pass the `buyNow` translation key to the `t` function as shown below:

```jsx {1, 5, 14}
import { useTranslation } from "react-i18next";
// ...

const PriceCard = ({ totalMrp, totalOfferPrice }) => {
  const { t } = useTranslation();

  // ...

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      {/* rest of the code */}
      <Button
        className="bg-neutral-800"
        label={t("buyNow")}
        to={routes.checkout}
      />
    </div>
  );
};
```

### Translations with interpolation

Suppose we have a sentence `I have a {color} car`, and if we are maintaining different translation keys one for `I have a`, and another one for `car` like so:

```jsx
<div>
  {t("iHaveA")} {color} {t("car")}
</div>
```

This arrangement can be problematic when translating from one language to another because the order of words may change. For example, if the variable `color` has the value `red` and we are translating the corresponding sentence into Spanish keeping the same word order, it will be `Tengo un rojo coche`. However, this translation is incorrect since the adjective `rojo` (red) precedes the noun `coche` (car), which goes against the usual word order in Spanish. Adjectives in Spanish typically come after the noun whereas in English, they typically come before the noun.

We can make use of the interpolation feature of the `i18n` library to solve this problem. This feature allows you to dynamically insert values into your translated string. In this way, we can avoid splitting strings into multiple translation keys.

To include a dynamic value for `color`, we will define a single translation key `iHaveACar` for the sentence in both English and Spanish as shown:

```json
// English
{
  "iHaveACar": "I have a {{color}} car"
}
```

```json
// Spanish
{
  "iHaveACar": "Tengo un coche {{color}}"
}
```

The `t` function accepts an object to specify the dynamic values used in the translations. We can pass the `color` as an object to the `t` function which will replace the `{{color}}` with the actual value in the translated string.

```jsx
import { useTranslation } from "react-i18next";

const App = ({ color = "red" }) => {
  const { t } = useTranslation();

  return <div>{t("iHaveACar", { color })}</div>;
};

export default App;
```

This is how the output will look for the English language:

<image>translation-with-interpolation.png</image>

### Handling pluralization

Previously, we have shown the product count in the cart within the `PriceCard` component as shown:

<image>items-count-without-pluralization.png</image>

To display such numeric information elegantly, i18next provides built-in plurals for pluralization.

In this approach, two keys are used: one for the singular form and one for the plural form. The key for the singular form is suffixed with `_one`, and the key for the plural form is suffixed with `_other`.

We will add the translation key `itemCount` to the `en.json` file.

```json
{
  // ...
  "itemCount_one": "({{count}} item)",
  "itemCount_other": "({{count}} items)"
}
```

We will then use the above key `itemCount` along with the `count` value. i18next will resolve the appropriate key based on the count value supplied to it:

```jsx {14}
// ...

const PriceCard = ({ totalMrp, totalOfferPrice }) => {
  // ...

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      {/* rest of the code */}

      <Typography className="flex justify-between">
        {/* rest of the code */}
      </Typography>
      <span className="neeto-ui-text-gray-500 text-sm">
        {t("itemCount", { count: itemsCount })}
      </span>
      {/* rest of the code */}
    </div>
  );
};
```

### Using the `Trans` component for translation

Next, we will localize the hardcoded strings with HTML nodes in between. The `t` function is useful if our translation doesn't involve React or HTML nodes. For example, consider that you want to display the text `"Product count <h1>{{count}}</h1>"` with the count changing dynamically. To translate string in such conditions `react-i18next` offers a component called `Trans`. The `Trans` component is used to interpolate or translate complex react elements into the translated string.

Let's see how we can use the `Trans` component to translate the following hardcoded string:

```jsx {13}
// ...

const PriceCard = ({ totalMrp, totalOfferPrice }) => {
  // ...

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      <Typography
        className={classNames("flex justify-between", {
          "line-through": isDiscountPresent,
        })}
      >
        Total Mrp: <span>${totalMrp}</span>
      </Typography>

      {/* rest of the code */}
    </div>
  );
};
```

The `Trans` component accepts several props. First, we will add the `i18nKey` prop where we will specify the translation key `"totalMrp"`.

```jsx {1, 14}
import { Trans } from "react-i18next";
// ...

const PriceCard = ({ totalMrp, totalOfferPrice }) => {
  // ...

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      <Typography
        className={classNames("flex justify-between", {
          "line-through": isDiscountPresent,
        })}
      >
        <Trans i18nKey="totalMrp" />
      </Typography>

      {/* rest of the code */}
    </div>
  );
};
```

Add the translation key `totalMrp` to the `translations/en.json` file.

```json
{
  // ...
  "totalMrp": "Total MRP: <typography>${{mrp}}</typography>"
}
```

We have wrapped the `mrp` on a custom component to add additional styles.

Next, we will add `values` and `components` props. The `components` prop allows you to specify the HTML elements or React components that will be used for rendering the placeholders in the translated string. In our case `typography` placeholder is rendered as an actual `<span>` element. Similar to `t` function, we can pass dynamic values as an object to `Trans` component using the `values` prop:

```jsx {2, 4}
<Trans
  components={{ typography: <span /> }}
  i18nKey="totalMrp"
  values={{ mrp: totalMrp }}
/>
```

Similarly, we will replace the hardcoded "Total discounts" and "Offer price" strings with `Trans` in the `PriceCard` component.

```jsx {12-16, 19-23}
import { Trans } from "react-i18next";
// ...

const PriceCard = ({ totalMrp, totalOfferPrice }) => {
  // ...

  return (
    <div className="neeto-ui-rounded neeto-ui-border-black space-y-2 border p-3">
      {/* rest of the code */}

      <Typography className="flex justify-between text-green-700">
        <Trans
          components={{ span: <span /> }}
          i18nKey="totalDiscounts"
          values={{ discounts: totalDiscounts, discountPercentage }}
        />
      </Typography>
      <Typography className="flex justify-between">
        <Trans
          components={{ span: <span /> }}
          i18nKey="offerPrice"
          values={{ offerPrice: totalOfferPrice }}
        />
      </Typography>
      {/* rest of the code */}
    </div>
  );
};
```

Then, add the translation keys `totalDiscounts` and `offerPrice` to the `en.json` file.

```json
{
  // ...
  "totalDiscounts": "Total discounts: <span>${{discounts}} ({{discountPercentage}}%)</span>",
  "offerPrice": "Total offer price: <span>${{offerPrice}}</span>"
}
```

Finally, add translations for all the hardcoded strings in the remaining components by yourself.

Let's commit the new changes:

```bash
git add -A
git commit -m "Implemented localization to smile cart"
```
You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/ef31292cce7d80e8f1af25f79b58dfd08ee8492c).

To learn more about the localization checkout [this blog](https://www.bigbinary.com/blog/react-localization).
