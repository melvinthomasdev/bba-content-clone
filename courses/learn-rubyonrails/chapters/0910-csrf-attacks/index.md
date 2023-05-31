CSRF stands for Cross-site request forgery. It is a technique hackers use to
hack into a web application.

Unlike XSS, CSRF does not try to steal cookies or token to log into the system.
CSRF assumes that we are already logged in at our site and when we visit some
other site then an attack is done without us knowing about the attack.

## How the attack works

Here is how the attack might work:

1. We log in at `www.mysite.com`. We have admin rights for `mysite.com`.

2. Now we open a new tab and we visit `www.gardening.com`, since we are
   interested in gardening.

3. We are browsing the comments posted on the gardening.com forum. One of the
   comments posted has URL which has source like this
   `<img src="http://www.mysite.com/grant_access?user_id=178&project_id=123" />`.

When browser sees the source of the image is `mysite.com` then browser will make
a GET request to `mysite.com`. When a request is made to `mysite.com` then
browser also sends the cookie. This is how cookies work. This is the important
thing to understand here.

**A browser always sends cookies when browser sends request to a URL if browser
has cookies for that URL.**

In this case we are not on mysite.com. We are at gardening.com. However if an
image is being loaded from mysite.com then browser will attempt to load the
image from mysite.com. However when browser is sending the request, browser will
also send the cookies that is associated with mysite.com.

Now if we are the admin of the project “123” in www.mysite.com then unknowingly
we have granted admin access to user 178. And we did not even know that we did
that. If later there is an investigation and log is checked then log will reveal
that we have granted admin privileges to user `178`. When we are inquired about
it then we would rightly deny doing anything like that. We are right in denying
the charges since we did not even know that we facilitated a CSRF attack.

Some might be thinking that loading an image will make a GET request and
granting access is hidden behind POST request. So the attack will not work. Well
the hacker can easily change code to make a POST request. In that case the code
might look like this:

```javascript {
<script>
 var url = "http://mysite.com/grant_access?user_id=1&project_id=123";
 document.write('<form name=hack method=post action='+url+'></form>')
</script>
<img src='' onLoad="document.hack.submit()" />
```

Now when the image is loaded then a POST request is sent to the server.

CSRF attack happens because browser always sends cookies to the site for which
it has cookies. If an application is not using cookies then CSRF attack is not
possible.

There is **nothing to commit** in this chapter since all we had done was
learning the basics of CSRF attacks.
