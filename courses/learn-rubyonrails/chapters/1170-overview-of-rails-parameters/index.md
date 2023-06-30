In this chapter, we will learn in detail about the `params` hash provided by
Rails.

## What are Parameters?

In a typical Rails application, you might often want to use the parameters sent
from the front end in your controller to perform various functionalities. These
parameters can be either query string parameters that are sent as a part of a
URL or parameters sent as a part of HTTP POST requests. Regardless of its
origin, we can readily access these parameters in the Rails controller using the
`params` hash.

Let us see two cases where query string parameters are used with `params`.

In the first scenario, assume that you have a search page that allows users to
filter results by keyword and category. The URL might look something like
`http://example.com/search?keyword=laptops&category=electronics`. In this
example, the query string parameters are `keyword` and `category`. You can
access these parameters in your controller like so:

```rb
def search
  keyword = params[:keyword]
  category = params[:category]
  # do something with the keyword and category
end
```

In the second case, assume you have a resource for articles in your Rails
application, and you want to create a route that allows users to view a specific
article by its ID. You could define your route like this:

```rb
resources :articles, only: %i[show]
```

This route will create a URL pattern like `/articles/:id`, where `:id` is a
dynamic segment that represents the ID of the article.

In your articles controller, you can access the `:id` parameter like this:

```rb
def show
  article_id = params[:id]
end
```

Now let us see an example where we can use `params` to access parameters that
are passed in through a POST request.

Suppose you have a form that includes a text field for the user's name and a
submit button. When the form is submitted, the following parameters might be
passed in the request:

```rb
{
  "name" => "John Smith"
}
```

You can access these parameters in your controller like this:

```rb
def create
  user_name = params[:name]
  # do something with the user's name
end
```

You can also access nested parameters. For example, if your form includes a
field for the user's address, you could access the street address like this:

```rb
def create
  street_address = params[:address][:street]
  # do something with the street address
end
```

## Require and Permit

Though it is easier to consider `params` as a hash, due to their similarities,
it is important to note that it is a method that returns an
`ActionController::Parameters` object. The latter provides two methods, namely
`require` and `permit`, to choose which attributes should be whitelisted for
mass updating and thus prevent accidentally exposing that which should not be
exposed. This is useful for protecting your application from malicious input and
for ensuring that you only receive the data that you expect.

For example, suppose you have a form that includes a text field for the user's
name and a checkbox for whether they want to receive email updates. You could do
this in your controller like so:

```rb
def create
  user_params = params.require(:user).permit(:name, :email_updates)
  user_name = user_params[:name]
  email_updates = user_params[:email_updates]
  # do something with the user's name and email updates
end
```

The `require` method specifies that the `:user` key is required in the params
hash, and the `permit` method specifies which keys are permitted for the `:user`
hash.

When the key(s) passed to the `require` method exists in a hash and its
associated value is either present or singleton `false`, it returns the said
value. If it is not present, it raises an `ActionController::ParameterMissing`
error.

On the other hand, `permit` returns a new `ActionController::Parameters`
instance that includes only the given keys passed in as its input to the method.
It also sets the `permitted` attribute for the object to `true`. So in the
previous example, the `permitted` attribute of `user_params` will be set to
`true`.

```rb
user_params.permitted?      # => true
```

Now, let us reconsider the previous example. This time we are going to pass an
array called `hobbies` as one of the parameters. To declare that the value in
`params` must be an array of permitted scalar values we should map the key to an
empty array as follows:

```rb {5}
def create
  user_params = params.require(:user).permit(
    :name,
    :email_updates,
    hobbies: []
  )
  user_name = user_params[:name]
  email_updates = user_params[:email_updates]
  hobbies = user_params[:hobbies]
  # do something with the user's name and email updates
end
```

Here we have mapped `hobbies` to an empty array.

Let us consider another scenario where you may have to pass a nested array
`skills` as a parameter, with `soft` and `hard` being its sub-arrays. This can
be permitted in the controller like so:

```rb {6-9}
def create
  user_params = params.require(:user).permit(
    :name,
    :email_updates,
    hobbies: [],
    skills: [
      soft: [],
      hard: []
    ]
  )
  user_name = user_params[:name]
  email_updates = user_params[:email_updates]
  hobbies = user_params[:hobbies]
  # do something with the user's name and email updates
end
```

When it comes to nested parameters it should be ensured that they are
**permitted last** as in the above example. This is because the order in which
strong params are permitted matters. So if you do not permit the nested array at
the end, it will not get white-listed.

You can read more about Rails parameters in the
[official docs](https://guides.rubyonrails.org/action_controller_overview.html#parameters).