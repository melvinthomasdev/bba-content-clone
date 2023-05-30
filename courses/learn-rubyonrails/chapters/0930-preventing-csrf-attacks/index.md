In this chapter we will look into what tools Rails provides in combating CSRF
attacks.

## CSRF token authenticity

Let's see how Rails behaves when a request is sent, and the CSRF token is not
sent:

```bash
rails g scaffold Post name:string
bundle exec rails db:migrate
bundle exec rails server
```

Now let's submit a curl request:

```bash
curl -X POST http://localhost:3000/posts
```

We will get an error:

```bash
Started POST "/posts" for ::1 at 2020-05-20 07:36:49 -0700
Processing by PostsController#create as */*
Can't verify CSRF token authenticity.
Completed 422 Unprocessable Entity in 0ms (ActiveRecord: 0.0ms | Allocations: 421)
ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken):
```

Rails prevented the POST request from making any changes. This is the default
behavior of Rails. By default, Rails expects all non GET requests to have CSRF
token.

Let's look under the hood to see how things work.

## How Rails implements forgery protection

Our `application_controller` inherits from `ActionController::Base`:

```ruby
class ApplicationController < ActionController::Base
end
```

The
[official codebase](https://github.com/rails/rails/blob/c50170d213b225849ccda3244bd1f7ff1bb88fae/actionpack/lib/action_controller/railtie.rb#L75-L81)
for `ActionController::Base`, has the following lines of code in it:

```ruby
initializer "action_controller.request_forgery_protection" do |app|
  ActiveSupport.on_load(:action_controller_base) do
    if app.config.action_controller.default_protect_from_forgery
      protect_from_forgery with: :exception
    end
  end
end
```

The key statement here is `protect_from_forgery with: :exception`. Let's see how
the method `protect_from_forgery` is implemented in the
[official codebase](https://github.com/rails/rails/blob/c50170d213b225849ccda3244bd1f7ff1bb88fae/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L135-L142):

```ruby
def protect_from_forgery(options = {})
  options = options.reverse_merge(prepend: false)

  self.forgery_protection_strategy = protection_method_class(options[:with] || :null_session)
  self.request_forgery_protection_token ||= :authenticity_token
  before_action :verify_authenticity_token, options
  append_after_action :verify_same_origin_request
end
```

Notice that Rails adds a `before_action :verify_authenticity_token`.

In the same file there is method
[verified_request?](https://github.com/rails/rails/blob/c50170d213b225849ccda3244bd1f7ff1bb88fae/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L293-L296)
:

```ruby
def verified_request? # :doc:
  !protect_against_forgery? || request.get? || request.head? ||
      (valid_request_origin? && any_authenticity_token_valid?)
end
```

As we can see above Rails does not check for CSRF protection if it is a `GET`
request or if it is a `HEAD` request.

Last method we need to look at is
[request_authenticity_tokens](https://github.com/rails/rails/blob/c50170d213b225849ccda3244bd1f7ff1bb88fae/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L306-L308)
:

```ruby
def request_authenticity_tokens # :doc:
  [form_authenticity_param, request.x_csrf_token]
end

def form_authenticity_param # :doc:
  params[request_forgery_protection_token]
end
```

As we can see Rails is looking for CSRF token at the following two places:

- Rails looks at the `params[:authenticity_token]` as mentioned in the
  [official codebase](https://github.com/rails/rails/blob/c50170d213b225849ccda3244bd1f7ff1bb88fae/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L75).

- Rails looks at request header `x_csrf_token`.

## CSRF protection when plain vanilla Rails form is used

In Rails view when a form is built using `form_for` or `form_tag` then Rails
generates a hidden input field like this:

```html
<form class="new_post" action="/posts" method="post">
  <input
    type="hidden"
    name="authenticity_token"
    value="CAyrpqydaDwzglfmtL3zdF37QnLTY90dKE1Thr+frtGxn1p6AsJS19u6fklrpZkMylJRQf1YWLYu8BiRRExeug=="
  />
</form>
```

When this form is submitted then `authenticity_token` is also submitted. On the
server, Rails retrieves the token using `params[:authenticity_token]`. Rails
checks if the token has been tampered with and if everything is fine then that
request proceeds.

If our application is making AJAX calls using `remote: true` option in
`form_for` then Rails automatically takes care of everything as long as we are
using [jquery-rails gem](https://github.com/rails/jquery-rails).

## How CSRF token works when we are using React.js

If we are using React.js, Angular.js, jQuery etc then in those case we do not
use `form_for` or `form_tag` to create the form. In these cases we do not get
the hidden input field. So how do we handle cases like this.

When a brand new Rails application is created then Rails also creates a layout
file called `application.html.erb`. If we open up this file then we will see
following line in the head section:

```ruby
<%= csrf_meta_tags %>
```

When the page is rendered it looks like this:

```html
<meta name="csrf-param" content="authenticity_token" />
<meta
  name="csrf-token"
  content="CAyrpqydaDwzglfmtL3zdF37QnLTY90dKE1Thr+frtGxn1p6AsJS19u6fklrpZkMylJRQf1YWLYu8BiRRExeug=="
/>
```

Now when React.js, jQuery or any other technology is making a request to the
server then they need to read the CSRF token value from the meta tag. This can
be done like this:

```javascript {
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
const data = { post: { title: "A new blog", content: "Details of the blog" } };
const url = "/api/vi/posts";

fetch(url, {
  method: "POST",
  headers: {
    "X-CSRF-Token": csrfToken,
    "Content-Type": "application/json",
  },
  body: JSON.stringify(data),
});
```

## My application does not use Rails layout

Above solution will only work if our application uses `application.html.erb`
layout. If our application is 100% using React.js, Angular.js or similar
technology then the application does not have `csrf_meta_tags`.

In such cases we can make use of
[form_authenticity_token](https://api.rubyonrails.org/v3.2/classes/ActionController/RequestForgeryProtection.html#method-i-form_authenticity_token)
helper method:

```javascript {
<%= react_component("ComponentName", { prop: prop1,
                                       csrf_token: form_authenticity_token }) %>
```

## Skipping CSRF protection

There are valid cases when CSRF protection is not needed. Let's say that our
application is 100% React.js application and all frontend code is in React.js.
The application needs user to be authenticated for the user to do anything.

Since the application requires user to be authenticated and since this is 100%
pure React.js application then for each request the application is sending
`X-AUTH-TOKEN` to identify who is logged in.

In such case we can ignore CSRF protection because the hacker would not know
what X-AUTH-TOKEN to send.

We saw earlier that forgery protection is done by Rails by adding a
`before_action`. If we want to skip the CSRF protection then we can skip that
`before_action`:

```ruby
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
end
```

We can also use `protect_from_forgery`. It offers `except`, `only` and
[some more options](https://api.rubyonrails.org/classes/ActionController/RequestForgeryProtection/ClassMethods.html):

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery except: [:create]
  protect_from_forgery only: [:update]
end
```

## Handling unverified requests

If a request fails the forgery check then we have three ways to handle it:

- Raise an exception
- Reset the session
- null session for the duration of the request.

### Raise an exception

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
```

In this case if a request is submitted and forgery check fails then
`ActionController::InvalidAuthenticityToken` exception is raised. We can rescue
this exception and we can take whatever action we want to take.

### Reset the session

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session
end
```

In this case if a request is submitted and forgery check fails then session is
completely reset.

Let's say that in our application user is logged in, and it has many pages and
each page has a form. Let's assume that in one of the forms the developer forgot
to send CSRF value. When a logged-in user submits that form then Rails will
detect that no CSRF token is sent. In this case Rails will reset the session.

Resetting the session means that user is no longer logged in. So the end result
is that after submitting the form which does not send CSRF token user will be
logged out.

Note that in this case Rails is not preventing the request from going through.
It's just setting the session as empty. Now if the intended controller and the
action expects a person to be logged in then the request will fail with a
different error.

### Empty session during the request

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
end
```

In this case if a request is submitted and forgery check fails then Rails
provides an empty session. But the important thing here is that the empty
session is only for the duration of the call. After the request is processed
then the old session is restored.

Let's say that in our application user is logged in, and it has many pages and
each page has a form. Let's assume that in one of the forms the developer forgot
to send CSRF value. When a logged-in user submits that form then Rails will
detect that no CSRF token is sent. In this case Rails will provide an empty
session for the duration of the call. Once the request is processed then user is
still logged in.

Note that in this case Rails is not preventing the request from going through.
It's just setting the session as empty. Now if the intended controller and the
action expects a person to be logged in then the request will fail with a
different error.

There is **nothing to commit** in this chapter since all we had done was
learning the basics of CSRF attack prevention.
