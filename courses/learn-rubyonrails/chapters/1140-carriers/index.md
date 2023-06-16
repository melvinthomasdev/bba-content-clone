In this chapter, we will learn in detail about Carriers as a means to organize
views. We will also explore the difference between carriers and their
lookalikes.

## What are carriers?

At BigBinary, a carrier is a design pattern that we use to encapsulate and
separate view-related logic from model-related logic. They are used to format
and present data in a specific way for a given view.

Carriers are implemented as a class that wraps a model instance and exposes
specific methods to format and present the data in a way that is suitable for a
specific view. For example, a carrier might expose methods to format dates,
currency values, or other data in a way that is specific to the requirements of
a particular view.

Carriers can be particularly useful in Rails applications when the view needs to
display data that is derived from multiple models or when the view requires some
kind of complex formatting. By encapsulating this view-related logic in a class,
the overall application architecture can be kept cleaner and more maintainable.

There are different already existing ways to organize views like
[Draper Gem](https://github.com/drapergem/draper). However, carriers provide a
simpler solution as a custom class that is tailored to the needs of the
application without using a specific gem or library.

## When and how are carriers used?

Let us see how carriers are used in the light of an example. Suppose we have a
`Book` model with `title`, `author`, `description` and `published_at`
attributes. Let us say we also have a `Review` model that is associated with the
`Book` model in a one-to-many relationship. We need to display a book and its
details in JSON using a Jbuilder view, but we also want to include additional
information such as the number of reviews and the average rating of the book.

A straightforward approach would be to build the JSON using `show.json.jbuilder`
file in the following way:

```rb
json.extract! @book,
  :id,
  :title,
  :author,
  :description,
  :published_at
json.review_count @book.reviews.count
json.average_rating @book.reviews.average(:rating).to_f.round(1)
```

The corresponding controller code will look like so:

```rb
class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end
end
```

The above code might seem harmless for a small application. But as the
application scales and more complex business logic gets adapted, it may lead to
increased complexity and maintenance. The view code will get more complex and
harder to read, with the logic for calculating review statistics mixed in with
the view code. This can also make it harder to modify or maintain the view in
the future.

Now let us see how carriers can help in this scenario. We start by declaring a
class named `BookCarrier` in `app/carriers/book_carrier.rb`

```rb
class BookCarrier
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def review_count
    book.reviews.count
  end

  def average_rating
    book.reviews.average(:rating).to_f.round(1)
  end
end
```

We then modify the corresponding controller code as follows.

```rb
class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @book_carrier = BookCarrier.new @book
  end
end
```

We have added an instantiation of `book_carrier` in the `show` action. Now a
cleaner Jbuilder file for the same will look like so.

```rb
json.extract! @book,
  :id,
  :title,
  :author,
  :description,
  :published_at
json.review_count @book_carrier.review_count
json.average_rating @book_carrier.average_rating
```

It might look like nothing much has been changed but in fact, we have moved all
the complex logic from view to carrier keeping the JBuilder view code simple and
easy to read.

## Why not helpers or services?

Let us clearly outline the difference between helpers, services and carriers in
this section.

### Helper vs Carrier

Helpers are typically used to define small, reusable methods that can be used in
views to perform tasks such as formatting or rendering data. They are often used
for simple tasks such as formatting dates, generating HTML tags, or handling
conditional logic in views. Helpers are included in views through the
`ApplicationHelper` module, and can also be included in controllers or other
classes as needed.

Carriers, on the other hand, are used to encapsulate more complex logic and data
processing that goes beyond what helpers can handle when it comes to views. They
are typically used to encapsulate a specific set of responsibilities related to
the presentation of a model, such as formatting or calculating derived data.
Unlike helpers, carriers are defined as separate classes, which can be
instantiated with a model object and used to expose methods that encapsulate
presentation logic. Carriers are often used to separate concerns in larger
applications and to make views more modular and maintainable.

Carriers can also be easily tested in isolation, which can help ensure that your
code is working correctly and prevent regressions. Helpers, on the other hand,
are typically more difficult to test in isolation.

### Services vs Carrier

Services are typically used to encapsulate business logic that goes beyond what
models can handle, such as interactions with external APIs or complex business
rules. They are typically used to implement use cases or workflows that involve
multiple models or system components. Services are often used to separate
concerns and reduce the complexity of controllers, which can help make the
codebase more modular and maintainable.

Carriers, on the other hand, are used to encapsulate logic related to the
presentation of data in the views. They are typically used to format, transform
or derive data from the models for use in the views.

More information on carriers can be found in this
[blog](https://www.bigbinary.com/blog/drying-up-rails-views-with-view-carriers-and-services).

As we approach the end of our discussion on organizing views, we would like to
touch upon the topic of presenters. Presenters have gained significant
popularity in the Rails community as an approach to separating presentation
logic from the model and view. While presenters and carriers are conceptualized
to achieve the same purpose, at BigBinary, we primarily use carriers instead of
presenters as the Rails community does not have a unified perspective on the
presenter logic. Moreover, the use of different types of presenters may cause
inconsistencies in their application across different parts of the codebase.
