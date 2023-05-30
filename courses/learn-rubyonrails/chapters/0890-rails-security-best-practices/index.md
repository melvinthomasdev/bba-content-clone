When developing any web application, it is crucial to prioritize security in
addition to performance and usability. It is important to bear in mind that
cyber attacks are continuously evolving at the same pace as technology, so it is
imperative to be equipped with the knowledge and tools to safeguard your users
and their data. The following are some common loopholes we can leave behind for
attackers.

## SQL injection

Consider the following query:

```rb
User.where("id = #{params[:user_id]}").delete_all
```

The above query looks so innocent. But the actual problem with such a query is
that it is not properly sanitized since it is using interpolated strings.

In the above example, the `params[:user_id]` is a user input. It is being
interpolated into the query. This could result in someone being able to inject
malicious code into our query.

Consider the following user_id:

```rb
user_id = '972983) OR 1=1--'
```

It might look innocent initially, but that user_id can delete all the users in
the DB.

When executed it will generate the following SQL:

```sql
DELETE * FROM "users" WHERE (user_id = 972983) OR 1=1--)
```

Of course, we have validations that will prevent such a naive case of SQL
injection. However, that case was shown to demonstrate how dangerous it could
turn out.

So how to prevent SQL injection? Use parameterized queries. There are four ways
to use parameterized queries:

### 1. Hash approach

We can use hashes inside where clause. Rails will internally sanitize the hash
values. So the above query can be rewritten as:

```rb
User.where(id: params[:user_id]).delete_all
```

Here rails allow us to use hashes to represent basic queries. However, for more
complex queries, this approach might not be ideal.

### 2. Template string approach

The above piece of code can be replaced with:

```rb
User.where(["id = ?", params[:user_id]]).delete_all

# => DELETE FROM "users" WHERE (id = '1')
```

Notice that the value that replaces the ? will be wrapped in single quotes

More examples:

```rb
User.where(["name = ? and email = ?", "Joe", "joe@example.com"])

# => SELECT * FROM users WHERE name = 'Joe' AND email = 'joe@example.com';
```

### 3. Named placeholder templates

This approach is useful when we have too many values to be substituted into
templates.

```rb
User.where(["id = :id", { id: params[:user_id] } ]).delete_all
```

Notice that the value that replaces the ? will be wrapped in single quotes

More examples:

```rb
User.where(["name = :name and email = :email", { name: "Joe", email: "joe@example.com" }])

# => SELECT * FROM users WHERE name = 'Joe' AND email = 'joe@example.com';

AllowedIpRange.where("ip_start <= :ip_start AND :ip_end <= ip_end ", ip_start: remote_ip, ip_end: remote_ip).exists?

# => "SELECT \"allowed_ip_ranges\".* FROM \"engine_allowed_ip_ranges\" WHERE (ip_start <= '127.0.0.20' AND '127.0.0.30' <= ip_end )"
```

### 4. sprintf style templates

In the previous two approaches, we noticed that the values when replaced are
wrapped within single quotes. However, there are cases where we don't need to
wrap the substituted values in single quotes. In such cases, we can use the
sprintf (%s) based templates:

```rb
User.where(["id = '%s'", params[:user_id]]).delete_all
```

Notice that we must manually wrap the values in single quotes if required.

This is useful in cases where we don't need the value to be wrapped in single
quotes.

For example, consider the following query:

```rb
Model.where("#{params[:column]} ILIKE ? AND organization_id = ?", "%#{params[:query_string]}%", @organization.id)
```

Here we are not sanitizing params[:column]. It can be used to inject malicious
code. So in order to avoid attacks, we can use the following code:

```rb
Model.where("%s ILIKE '%s' AND organization_id = '%s'", params[: column], "%#{params[:query_string]}%", @organization.id)
```

Apart from the above cases, we should also refrain from using `Arel.sql`
queries. The string passed onto `Arel.sql` will not be sanitized. Hence it can
be used to inject malicious code. It should always be a last resort.

```rb
# Bad
@data.joins(: project).order(Arel.sql("projects.name #{params[:direction]}"))

# Good
@data.joins(: project).order("project.name": params[: direction])
```

## Use \A & \z as anchors in regex validations

In regular expressions, `\A` and `\z` are anchors that are used to match the
beginning and end of a string, respectively. Without them, the regex can simply
match any part of the string. If you're depending on the regular expression for
validation, you always want to use `\A` and `\z`.

Using the normal regex line begin (`^`) and end (`$`) anchors is also not
recommended. `^` and `$` will only match up until a newline character, which
means they could use an email like
`me@example.com\n<script>dangerous_stuff();</script>` and still have it
validated since the regex only sees everything before the `\n`.

Eg:

```rb
# Bad
/[0-9]+/

# Bad
/^[0-9]$/

# Good
/\A[0-9]+\z/
```

## Mass assignment

Mass assignment is a feature of Rails that allows an application to create a
record from the values of a hash.

Consider the following case:

```rb
User.new(params[:user])

# Here params[:user] can have any values
# An attacker can exploit this by having the role in the params	=>  "?user[role]=admin"
```

Also, refrain from using `params.permit!`. This permits all params that the user
sends which could contain malicious code.

Instead, use the strong parameters feature released in Rails 4.

We permit the values that we need. Any other values are not used.

```rb
params.require(:user).permit(:dob, :name)
```

## Avoiding unsafe reflection

`constantize` is used to convert user input to a constant within the Ruby object
space. This constant may then be used to call functions or instantiate objects,
as shown below:

```rb
'Module'.constantize # => Module

'Test::Unit'.constantize # => Test::Unit
```

Consider the following code:

```rb
params[:model].constantize.where(...)
```

An attacker can now access any model by passing in the appropriate params.

Avoid this by trying to not use constantize. But if necessary, try validating
the constants that we are going to constantize:

```rb
ALLOW_LIST = %w[Contact Company]

unless ALLOW_LIST.include?(params["model"])
  render_message("fallbackComponent.somethingWentWrong", :forbidden)
end
```

## Dangerous send

Dangerous send is similar to the Unsafe reflection mentioned above. Using
unfiltered user data to select a Class or Method to be dynamically sent is
dangerous.

Consider the following case:

```rb
# params[:status] = "active" || "archived" || "all"
User.send(params[:status])
```

In the above case, an attacker can send `destroy_all` in `params[:status]`.

The best way to avoid this should be to not use `send` at all. The next best way
is to validate the user input:

```rb
VALID_STATUSES = %w(active archived all)

status = VALID_STATUSES.find { |status| status == params[:status] } || "all"
User.send(status)
```

## File access vulnerabilities

Using user input to access files.

Consider the following case:

```rb
# http://domain.com?file_name=config/database.yml
payload = params[:file_name]
path = Rails.root.join(file_name)
id = SecureRandom.uuid
File.link(path, "public/#{id}")
redirect_to "/#{id}"
```

An attacker can use such a vulnerability to access files such as `/etc/passwd`
in the server.

Avoiding such a vulnerability includes using a sanitize function to sanitize the
file name to remove dangerous characters:

```rb
def sanitize(filename)
  # Bad as defined by wikipedia: https://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words
	bad_chars = [ "/", "\\", "?", "%", "*", ":", "|", '"', "<", ">", ".", " " ]
	bad_chars.each do |bad_char|
	   filename.gsub!(bad_char, "_")
	 end

	filename
end
```

The above function converts `/etc/passwd` to `_etc_passwd`.

## Redirection

Brakeman will raise warnings whenever `redirect_to` appears to be used with a
user-supplied value that may allow them to change the `:host` option.

```rb
redirect_to params.merge(:action => :home)
```

This is because `params` could contain `:host => 'evilsite.com'` which would
redirect away from your site and to a malicious site.

One approach to solve this issue is to use `url_from` to wrap the URL.
`url_from` ensures that we are only redirected to the same domain.

```rb
redirect_url = url_from(params[:redirect_uri]) || fallback_url

redirect_to(redirect_url)
```
