We can't rely on browser because some browsers sometimes cache the `http`
protocol. The surest way to know if the redirect is working or not is by using
`curl` command.

```bash
$ curl -i bigbinary.com
HTTP/1.1 301 Moved Permanently
Cache-Control: public, max-age=0, must-revalidate
Content-Length: 38
Content-Type: text/plain
Date: Wed, 07 Apr 2021 13:42:12 GMT
Age: 291
Connection: keep-alive
Server: Netlify
Location: https://bigbinary.com/
X-NF-Request-ID: 43251a79-c795-4fd8-a00b-0fcdb8fd3a8c-12182388

Redirecting to https://bigbinary.com/
```
