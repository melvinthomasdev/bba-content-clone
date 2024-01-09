## HSTS

HSTS stands for
[HTTP Strict Transport Security](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security).
HSTS helps in preventing SSL stripping attacks and
[session hijacking](https://en.wikipedia.org/wiki/Session_hijacking) attacks.
SSL Stripping attacks are a special type of
[man in the middle attack (MITM)](https://en.wikipedia.org/wiki/Man-in-the-middle_attack).

## Connections start with http

Let's see how a typical request session happens on the Internet.

When a user opens a browser and types a URL then browsers, by default, put
`http` in front of it. Then browsers send HTTP request to the server. The server
answers via HTTP saying that please send request over HTTPS. The browsers now
send HTTPS request.

## HSTS ensures HTTPS at the browser level

Every single time when a browser sends a HTTP request and the server sends a 301
redirect response demanding request to be sent over HTTPS there is an
opportunity for the SSL strip attack. We will see how this attack works soon.

It would be nice if server could tell browser that not only for this session but
for any future sessions also please send all requests over HTTPS.

That's what HSTS does. HSTS tells browsers that for all future requests please
use HTTPS for say next 6 months. So now even if user types
`http://www.ecommerce.com` then the browser itself will switch HTTP into HTTPS
without contacting server for a period of 6 months.

In Rails when we use
[force_ssl](https://api.rubyonrails.org/classes/ActionDispatch/SSL.html) then
Rails not only redirects to `https` but Rails also sets HSTS headers. The
default time period is
[2 years](https://github.com/rails/rails/blob/598dc9f147e6153a461d6707ca0bf6e356e321ad/actionpack/lib/action_dispatch/middleware/ssl.rb#L53)
in Rails.

## What are SSL strip attacks and how does it work?

Let's say that Harry, the hacker, visits Starbucks coffee shop. Here he created
a hotspot named "Starrbucks coffee". Notice that he has put two "r"s in the name
of "Starrbucks coffee".

Joe walks into the coffee shop, and he sees that there are two hotspots named
"Starbucks coffee". He did not pay attention to the misspelling. Joe connects to
the hotspot setup by Harry.

Now Joe opens his notes site `www.mynotes.com`. Mynotes already has HSTS enabled
and Joe visits `mynotes.com` regularly, so the browser knows to send the request
over HTTPS.

In his notes he has a link to `www.toystore.com`. He clicks on the link to buy a
gift for the upcoming birthday party. Since there is no protocol mentioned in
the link by default browser sends the request using HTTP.

Request is sent to `http://www.toystore.com`. Since Joe is connected to the
hotspot run by Harry, request first goes to Harry. Harry has setup a proxy.
Harry stops the request in the middle and he initiates a brand new request to
`http://www.toystore.com`.

Toystore site sends a 301 response to the client asking the client to send the
request over HTTPS. If Harry sends this response as it is Joe then Joe's browser
will make a direct tunnel between Joe's browser and `toystore.com`. That's how
https works. It sets a secure tunnel between the client and the server. If there
is a direct HTTPS connection between Jeo's browser and `toystore.com` then Harry
would not be able to steal Joe's credit card information.

So this is what Harry does. Harry does not forward that response to send request
over HTTPS to Joe. Instead Harry sends the request over HTTPS to `toystore.com`.
`toystore.com` responds with the login page. Harry takes the response of this
page and sends it to Joe over HTTP. So here Harry is taking HTTPS response and
stripping the SSL and sending the same response over HTTP. This is why it is
called SSL strip attack.

Now Joe fills out the form and submits it over HTTP. Harry does not let this
submission go through. He is in the middle between Jeo and the toystore. Harry
looks at the data. Puts this data in the form and submits the form using HTTPS
to the `toystore.com`.

The main takeaway is that Joe never sends any data over HTTPS and in this way
Harry is able to see all the data because all the data is being sent over HTTP
and not HTTPS. In this way Harry is able to steal Joe's credit card information.

How this could have been mitigated.

This was not the first time Joe was visiting `toystore.com`. If `toystore.com`
would have been using HSTS then all requests to `toystore.com` would have been
sent over HTTPS even if Joe is clicking on a link that says
`http://www.toystore.com`.

However, this mechanism does not solve the problem of first visit. What if Joe
has never been to `www.tshirts.com` and his friends on the chat tell him about
it. Even if the engineering folks at `tshirts.com` have implemented HSTS, the
very first request to `tshirts.com` by Joe at that coffee shop can be
intercepted by Harry. To solve this first visit problem https://hstspreload.org
was born.

## HSTS Preloading using hstspreload.org

Major browsers like Chrome, Firefox, Opera, Safari, IE came together and support
https://hstspreload.org/. Any request made to any site listed in hstspreload is
always sent over HTTPS including the very first request.

For example "mail.google.com" is in the hstspreload list. It means even if we
get a brand new laptop and in the URL if we type http://mail.google.com then
even for the first visit the request will be sent over HTTPS and not HTTP.

## Avoid hotspots at public wifi

With proper tooling mounting man in the middle attack is not very difficult
[Firesheep](https://en.wikipedia.org/wiki/Firesheep) is a
[Firefox extension](https://codebutler.github.io/firesheep/) which makes session
hijacking extremely easy.

In response to firesheep we had initiatives like
[HTTPS everywhere](https://www.eff.org/https-everywhere). This is why starting
chrome 68 all sites using HTTP are flagged as
[Not secure by default](https://www.pcmag.com/news/google-chrome-begins-flagging-all-http-pages-as-not-secure).

This is also a good reminder that unless absolutely needed please do not connect
to the random wifi hotspots. Only connect to known wifi hotspots.

There is **nothing to commit** in this chapter since all we had done was
learning the basics of HSTS.
