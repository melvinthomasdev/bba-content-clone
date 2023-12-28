## Maintaining state

HTTP is stateless, which means servers do not know if the request that has just
come is from a client that already did a request before, or if it's a new one.

However, some web application needs to maintain the state. Some web application
needs to know if a user is logged in or not.

## Cookies

A cookie in a web application is also known as "browser cookie" or "web cookie".
When we visit amazon.com then amazon.com writes a cookie in our browser to track
us. Next time if we visit amazon.com then it can read its cookie, and it might
recommend a book to us based on what book we were searching the last time.

Websites are allowed to read their own cookies. They are **not** allowed to read
cookies set by other websites. For example, if we visit bigbinary.com, then
bigbinary.com can't read cookies stored in our browser set by other sites.

Cookies can store only 4 KB of data.

Cookies can be set, changed or removed by both server and the client. It means
that a cookie can be managed by the backend code or on the frontend using
JavaScript.

## Cookie expiration

If we don’t set any value explicitly for cookies expiration then cookies expire
when the browser is closed. To prevent cookies from expiring we can add expiry
date in the UTC format (Mon, 26 Mar 2018 17:04:05 UTC):

```javascript {
document.cookie = "username=john; expires=Mon, 26 Mar 2021 17:04:05 UTC";
```

`max-age` does the same thing. It accepts the number of seconds until the cookie
expires:

```javascript {
document.cookie = "username=john; max-age=31536000"; //expires in 1 year
```

If both `expires` and `Max-Age` are set then `Max-Age` takes precedence.

## Secure parameter

Adding the Secure parameter makes sure that the cookie can only be transmitted
over HTTPS. If the connection is **not** HTTPS then the cookie marked with
`Secure` will **not** be sent.

If `Secure` parameter is missing then cookies set by `https` **will be** sent
over `http` and cookies set by `http` will be sent over `https`:

```javascript {
document.cookie = "foo=bar; Secure;";
```

## HttpOnly

Cookies marked with `HttpOnly` can't be accessed by JavaScript. It means the web
application will be secure from XSS attack. We will discuss more about XSS
attack in a different chapter:

```javascript {
document.cookie = "username=john; HttpOnly";
```

## First party and third party requests and cookies

Before we discuss `SAMESITE` attribute, let's discuss what are first-party and
third-party requests and cookies?

Let's say that we are at nytimes.com. nytimes might load images from the other
sites. It might load fonts from google fonts. These kinds of requests are called
`cross-origin` or `third-party` requests. That's because the origin site is
`nytimes.com`. However, the fonts are being loaded from `fonts.googleapis.com`
and hence they are `cross-origin` or `third-party` requests.

Let's take another example.

Let's assume that site techcrunch.com uses
[doubleclick](https://en.wikipedia.org/wiki/DoubleClick) website. If we visit
techcrunch.com then on my browser both doubleclick and techcrunch.com would
store cookies. Cookies set by doubleclick would be third-party cookies. Cookies
set by techcrunch.com would be first-party cookies.

Third-party cookies are often set by advertising networks that a site may
subscribe to in the hopes of driving up sales or page hits.

Firefox and some other browsers provide special control over third party
cookies. https://monosnap.com/direct/48fDEGNmFwFF2Gjbg1UC4RnLzoHf9C

## SameSite

SameSite dictates whether to send cookies on cross-site requests:

```javascript {
document.cookie = "username=john; HttpOnly; SameSite=strict";
```

There are two possible values for the same-site attribute: Lax & Strict. Cookies
without a SameSite attribute are treated as `SameSite=Lax`.

In the **Strict** mode cookies are **not** sent in the cross site situation.
This makes the application more secure by preventing CSRF attacks but it creates
usability issues.

Let's say that I'm logged in at github.com, and I'm looking at my private repo
github.com/neerajsingh/personal-side-project.

Let's say that I have an account at mynotes.com where I have listed all my side
projects. In mynotes.com I have a link to
github.com/neerajsingh/personal-side-project.

If mynotes.com implements "Strict SameSite" policy then when I click on the
GitHub project link in mynotes.com then github's cookie will **not** be sent. It
means I will be asked to login at github.com even though I'm already logged in
at github.com.

There is **nothing to commit** in this chapter since all we had done was
learning the basics of cookies.
