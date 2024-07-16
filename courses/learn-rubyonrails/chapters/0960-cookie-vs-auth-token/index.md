## Using cookie to store session data

Let's say that I have a web application that is 100% behind login Something like
https://app.aceinvoice.com.

When it comes to choosing authentication mechanism we have a choice to make.

If we use cookies to ensure that logged-in users remain login then now we know
that because of cookies the application can be subjected to both XSS and CSRF
attacks.

If we mark our cookies as `httponly` then XSS attacks are not possible.

## Using auth token instead of cookie

Instead of cookies if we use some kind of auth token then the question is where
we do store the auth token which can withstand a refresh of the browser. If we
store this auth token in sessionStorage then upon closing the browser the auth
token is gone and that means user is not logged in anymore.

If we store this auth token in localStorage then that means we need to guard the
application from XSS attack since by storing auth token the application is
secure from CSRF attack.

## It is all about tradeoffs

Hopefully by going through all the security related chapters it is clear that
there is no clear winner here.

Both the strategies of using cookies or using auth tokens have their own
advantages and disadvantages. We need to know these pros and cons so that we are
aware of where to concentrate on strengthening the security of the application.

There is **nothing to commit** in this chapter since all we had done was
understand the difference between usage of cookie and auth token.
