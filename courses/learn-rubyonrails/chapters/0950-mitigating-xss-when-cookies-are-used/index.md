We learned from the previous chapters that Cross-site scripting (XSS) is a
security vulnerability that allows an attacker to inject custom JavaScript code
into the content that an application delivers to a user.

The severity of an XSS attack is critical when the attacker can steal our users'
cookies using the injected script. With those cookies, the attacker can login to
the victim's account without their knowledge.

XSS-based cookie theft can be prevented by disallowing JavaScript to read
cookies. We will discuss that in the next section.

Even though preventing all XSS flaws in an application is difficult, modern
frameworks like `React` have some built-in goodies that can help us in the
mitigation process.

For example `React` automatically performs HTML encoding to strings before
rendering it to the page. This ensures that the special characters are treated
just like normal text, instead of a piece of script to be executed.

Also, from the developers' perspective, it makes us think twice before using
functions like `dangerouslySetInnerHTML`.

In this chapter let's learn what all measures we can take to mitigate classic
XSS attacks.

## Do not allow JavaScript to read cookie information

As discussed in the cookie section if a cookie is marked as
[HttpOnly](https://www.owasp.org/index.php/HttpOnly) then JavaScript can't read
cookie information. This diminishes the potential severity of XSS attacks by
keeping the authentication token safe.

Since XSS can do more than just stealing cookies, this alone won't make our
users fully safe against XSS.

Open `config/initializers/session_store.rb` and you will see code something like
this:

```ruby
Rails.application.config.session_store :cookie_store, key: "xxxxxxxx"
```

Let's add `httponly` option to this application:

```ruby
Rails.application.config.session_store :cookie_store, key: "xxxxxxxx",
                                                      httponly: true
```

Now the cookies can't be read by any JavaScript code.

## Do not allow hacker to execute JavaScript

If a hacker is able to execute custom JavaScript code then hacker can steal
cookies. There is only one way to prevent it and that is to not allow users of
the application to send `<script>` tag to the browser. If we send `<script>` tag
to the browser then browser will execute that JavaScript.

So what can we do so that `<script>` tag is not sent to the browser by the users
of the applications.

Rails default behavior is to keep things secure.

Before we start looking at solutions let's revisit what happened when earlier we
did not mark content as html_safe. So let’s remove html_safe and let's try to
see the content posted by the hacker.

So the code without `html_safe` would look like this:

```ruby
array = [name, address1, address2, city_name state_name, zip, country_name]
array.compact.join('<br />')
```

If we execute this code then hacker's address would look like this:

```html
John Smith<br />
<script>
  alert(document.cookie);
</script>
<br />Suite #110<br />Miami<br />FL<br />33027<br />USA
```

Notice that in this case no JavaScript alert was seen. Hacker gets to see the
address hacker had posted. Why is that. To answer that let’s look at the html
markup:

```html
John Smith&lt;br /&gt;&lt;script&gt;alert(document.cookie)&lt;/script&gt;&lt; br
/&gt;Suite #110&lt;br /&gt;Miami&lt;br /&gt;FL&lt;br /&gt;33027&lt;br /&gt;USA
```

As we can see Rails did not render the address exactly as it was posted by the
hacker. Rails did something because of which `<script>` turned into
`&lt;script&gt;`.

Rails escaped the content by using method
[html_escape](https://api.rubyonrails.org/classes/ERB/Util.html#method-c-html_escape).

By default Rails assumes that all content is not safe and thus Rails subjects
all content to `html_escape` method.

In this case we are trying to format the content using `<br />` and Rails is
escaping that also. We need to escape only the user content and not escape
`<br />`. Here is how we can do that:

```ruby
array = [name, address1, address2, city_name, state_name, zip, country_name]
array.compact.map{ |i| ERB::Util.html_escape(i) }.join('<br />').html_safe
```

In the above case we are marking the user content as html_safe in the end
because we subjected the content through `html_escape` manually and now we are
sure that no unescaped user content can go through.

### Using content_tag

Rails also provides
[content_tag](https://api.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html#method-i-content_tag)
to wrap content with any HTML tag. In the process of wrapping the content Rails
also escapes the content which makes the output of `content_tag` safe:

```ruby
array = [name, address1, address2, city_name, state_name, zip, country_name]
array.compact.map{ |i| ActionController::Base.helpers.content_tag(:p, i) }.join('').html_safe
```

### simple_format for simple formatting

If we want to format the text a little then we can use
[simple_format](https://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-simple_format).
If user enters a bunch of text in text area then `simple_format` can help make
the text look pretty without compromising security. It will strip away
`<script>` and security sensitive tags. Note that simple_format will remove
script tag while solutions like html_escape will preserve script tag in escaped
format.

### sanitize for sanitizing HTML content

[sanitize](https://api.rubyonrails.org/classes/ActionView/Helpers/SanitizeHelper.html#method-i-sanitize)
remove `href` and `src` attributes with unsafe protocols like `javascript:`.
`sanitize` takes `scrubber` as an option which provides a lot of flexibility in
terms of what to sanitize:

```ruby
class CommentScrubber < Rails::Html::PermitScrubber
  def initialize
    super
    self.tags = %w( form script comment blockquote )
    self.attributes = %w( style )
  end

  def skip_node?(node)
    node.text?
  end
end

<%= sanitize @comment.body, scrubber: CommentScrubber.new %>
```

There is **nothing to commit** in this chapter since all we had done was
learning the basics of XSS attack mitigation when using cookies.
