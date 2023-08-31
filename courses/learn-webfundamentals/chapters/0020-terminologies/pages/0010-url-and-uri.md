<!-- This work doesn't match up to any of our style guidelines. Ref: #1540 -->
<!-- Suggested course of action: Recreate the lesson, split it in parts and in effect, change the TOC -->

When we want to visit any website, we enter a web address(URL) in the browser address bar. If you have observed, you'll find that all of these addresses have a similar pattern. Though most of the URLs look small, a URL is formed with different smaller parts. In this lesson, we'll try to understand URL in detail by dissecting different parts of it.

## URI

`URI` stands for Uniform Resource Identifier. It is used for identifying for physical or logical resource. A resource can be a page, a document, or a book.

There are two types of URI.

1. URN

URN stands for Uniform Resource Name. Basically, It is a internet resource which has a name. URNs are unique across the web and persistent identifiers.

e.g. A book can be identified by its ISBN.

urn:isbn:0451450523

2. URL

`URL` stands for Uniform Resource Locator. The URL is special type of resource identifier. It also implies whether it is available and you how to access a resource i.e. HTTP, FTP etc.

e.g. https://www.example.com

### URN vs URL

* The URN defines an identity of resource, but the URL provides a location of that resource.
* URL conveys resource' availability and accessibility. Whereas URN does not imply the availability of a resource.

## Parts of a URL

 It represents an address of a unique resource on the Web. It is also known as `web address` or `internet address` . As mentioned above `URL` is a subset of URI.

A resource can be an `HTML` page, a `JavaScript` file, a `CSS` document, an image, etc.

Let's check some following examples of URLs.

* https://courses.bigbinaryacademy.com/
* https://courses.bigbinaryacademy.com/learn-sql/
* https://bigbinary.com?utm_source=academy
* https://pbs.twimg.com/profile_images/511244255294001152/v5phEU1O_400x400.jpeg

A URL consist of some mandatory and some optional parts. Let's try to understand each of them one by one with an example below.

```
https://www.example.com:80/path/to/the/resource?search=keyword#page-section

The dissection of the URL:

Scheme - https
Authority - www.example.com
port - 80
Directory - /path/to/the/resource
Parameters - search=keyword
Anchor - #section

```

Now let's try to understand all of them in detail.

### Scheme:

The scheme indicates a protocol to be used by a client (e.g. browser) to request a resource. It is the first part of the URL.

Generally, `HTTP` or `HTTPS` protocol is used for addressing a website page. HTTPS is the secure version of HTTP. A browser understands `mailto` and `ftp` protocol as well. These are some of the most commonly used protocols. Please check [list of URI schemes](https://en.wikipedia.org/wiki/List_of_URI_schemes) if you are curious to know other schemes.

Please don't be scared of these terms if you don't know them. We will understand HTTP, protocol, and ports etc. in next chapters in detail.

### Authority:

The authority is separated from the scheme by `://` string. This includes both domain name(e.g. www.example.com) and the port number(e.g. 80 or 443).

The authority can be divided into smaller parts further. Let's dissect the authority

```
www.example.com:8089 - This is an authority.

www - subdomain
example - Second-level Domain
.com - Top level domain
8089 - port number
```

#### Subdomain:

The subdomain is a part of the domain name that is prepended to main domain name. It is generally used for dividing a website into logical sections. The subdomain can be empty in some cases e.g. [bigbinary.com](https://bigbinary.com).

There are instances where subdomain can be multi level e.g. `books.shop.example.com` , here subdomain is `books.shop` .

#### Second-level Domain:

In most cases, the second level domain is the main website name. It helps us to identify the brand name e.g. `bigbinary` or `google` .

#### Top-level Domain (TLD)

The top-level domain (TLD) specifies what type of entity an organization registers as on the internet. e.g. `.com` is used for commercial business and `.org` is used for the non-profit organization.

There are many TLDs available. But `.com` , `.co` , `.org` , and `.net` are some of the most commonly used TLDs.

#### Port:

The port is separated by `:` character. It is excluded if the web server uses HTTP standard ports i.e. 80(HTTP) and 443(HTTPS). The port is used for identifying the process running on web server.

We will understand more about domain name in DNS chapter.

### Path to resource

This is the path to the resource on the Web server. In initial days of internet, it was used as physical location of the file on the server. Now it is not used for the same physical location but to identify the specific resource on the server.

e.g. `/users` can return the list of the users.

### Parameters

The parameters are used to send some extra data to the application/web server. These parameters are also known as query parameters. These are key-value pairs separated by `&` . The server must have some rules to understand the parameters and process the response accordingly.

e.g. `/users?sort_by=name&sort_direction=desc` .

Here, the server shall send the users list sorted by name in descending order.

### Anchor

An anchor is used to denote specific section of a webpage. The browser shall scroll into the specific section of a page. Please don't be confused with anchor tag in `HTML` , this is different.

e.g. [https://bigbinary.com/learn-rubyonrails-book/what-is-crud#rest-vs-crud](https://bigbinary.com/learn-rubyonrails-book/what-is-crud#rest-vs-crud)

This is will scroll to the bottom of the page where `rest-vs-crud` section is present.

### Absolute URLs vs relative URLs

The absolute URL is the full URL where all the specific parts are present like we saw in above examples. A relative URL is a URL which is present after the `authority` i.e. `path to resource` and may or not contain `parameters` .

e.g.

Absolute URL: [https://courses.bigbinaryacademy.com/learn-basic-html](https://courses.bigbinaryacademy.com/learn-basic-html)

Relative URL: `/learn-basic-html`

When we enter any website address in the address bar, browser needs an absolute URL. The relative URLs can be used on web page as browser has domain details of the web page.

### Absolute URLs vs relative URLs

On a last note, It is considered as one of best practice to use semantic URLs i.e. human-readable URLs for a website. It is also a good for SEO i.e. to rank better in a search engine.

e.g.

[https://courses.bigbinaryacademy.com/learn-sql/](https://courses.bigbinaryacademy.com/learn-sql/)

The above URL is a semantic URL. It clearly conveys that user will get to learn about SQL.
