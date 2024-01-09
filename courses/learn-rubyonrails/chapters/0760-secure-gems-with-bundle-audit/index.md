In this chapter we will learn about discovering and fixing security
vulnerabilities in a Rails application. The following content is only for
example purposes and needn't be added to granite.

Time to time people discover security vulnerabilities in published software.
[Rubysec](https://rubysec.com) maintains a plain-text database of such security
vulnerabilities.

[ruby-advisory-db](https://github.com/rubysec/ruby-advisory-db) maintains a
database of vulnerable Ruby Gems.

If we want to know whether our Ruby application is using any of the versions of
Gems that are vulnerable, then we should run a scan of our `Gemfile.lock`
against this database. This is exactly what `bundler-audit` does.

`bundler-audit` is a utility program which looks at an application's
`Gemfile.lock` and then looks at `ruby-advisory-db` to see if we are using a
vulnerable version of Gem or not.

### Installing bundle-audit gem

Currently, we don't have to install these gems. But if we were to install it,
then we would have to add the following lines into our `Gemfile`:

```ruby
gem 'bundler-audit', require: false
gem 'ruby_audit', require: false
```

**The `bundle-audit` command which is shown below is only mentioned to
illustrate how auditing works. Do not run this command as it might lead to
automatic version updates of gems to fix the security vulnerabilities that
`bundle-audit` finds. This can further lead to gem version-specific issues
throughout the flow of the book.**

Bundler has a command `bundle audit` to invoke `bundler-audit` to do this:

```bash
bundle exec bundle-audit

Name: rails-html-sanitizer
Version: 1.3.0
Advisory: CVE-2015-7580
Criticality: Unknown
URL: https://groups.google.com/forum/#!topic/rubyonrails-security/uh--W4TDwmI
Title: Possible XSS vulnerability in rails-html-sanitizer
Solution: upgrade to ~> 1.0.3

Vulnerabilities found!
```

This scan was run on a project, and we can see that one vulnerability is found.

Bundler downloads the Ruby Advisory DB to the local machine from time to time.
We should always be running the scan against the latest copy of the Ruby
Advisory DB.

To update our local copy of the Ruby Advisory DB, we should execute the
following command:

```bash
bundle audit update

Updating ruby-advisory-db ...
Cloning into '/Users/raj.singh/.local/share/ruby-advisory-db'...
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 4863 (delta 4), reused 10 (delta 4), pack-reused 4853
Receiving objects: 100% (4863/4863), 867.08 KiB | 3.82 MiB/s, done.
Resolving deltas: 100% (2400/2400), done.
Updated ruby-advisory-db
ruby-advisory-db: 456 advisories
```

Note that `bundle audit update` does not do any audit. It only clones the
`ruby-advisory-db` to the local machine so that next time when we do the audit,
it is performed against this update copy.

Every time we want to do a scan we need to do two things.

- Update the local Ruby Advisory DB
- Run the audit

Both of these operations can be combined to a single command:

```bash
bundle exec bundle-audit --update
```

## Running audit as part of CI

Who is going to run this audit on a regular basis? The best way to do it is to
run this audit as a part of CI.

`bundle-audit --update` is in our config file for
[Wheel](https://github.com/bigbinary/wheel/blob/main/.circleci/config.yml).

Let's say that at 10 AM all our tests were passing. Then at 10:05 AM Ruby
Advisory DB added a new vulnerability that was recently detected. Any test that
runs after 10:05 AM will fail the audit check.

Here is what we see in the console for a recent run:

```bash
#!/bin/bash
bundle exec bundle-audit check --update --ignore=CVE-2015-9284
Updating ruby-advisory-db ...

Cloning into '/home/circleci/.local/share/ruby-advisory-db'...

Warning: Permanently added the RSA host key for IP address '140.82.113.4' to the list of known hosts.
remote: Enumerating objects: 10, done.

remote: Counting objects: 100% (10/10), done.

remote: Compressing objects: 100% (6/6), done.

remote: Total 4863 (delta 4), reused 10 (delta 4), pack-reused 4853

Receiving objects: 100% (4863/4863), 865.47 KiB | 21.11 MiB/s, done.

Resolving deltas: 100% (2400/2400), done.

Updated ruby-advisory-db

ruby-advisory-db: 456 advisories

Name: actionpack

Version: 6.0.3.1

Advisory: CVE-2020-8185

Criticality: Unknown

URL: https://groups.google.com/g/rubyonrails-security/c/pAe9EV8gbM0

Title: Untrusted users able to run pending migrations in production

Solution: upgrade to >= 6.0.3.2



Name: rack

Version: 2.2.2

Advisory: CVE-2020-8184

Criticality: Unknown

URL: https://groups.google.com/g/rubyonrails-security/c/OWtmozPH9Ak

Title: Percent-encoded cookies can be used to overwrite existing prefixed cookie names

Solution: upgrade to ~> 2.1.4, >= 2.2.3



Vulnerabilities found!


Exited with code exit status 1
CircleCI received exit code 1
```

In this case two gems `actionpack` and `rack` are found to be vulnerable. The
solution is also printed in the log:

```bash
Solution: upgrade to >= 6.0.3.2
Solution: upgrade to ~> 2.1.4, >= 2.2.3
```

Upgrade the Gems to fix the error.

There is **nothing to commit** in this chapter since all we had done was
understand the usage of `bundler-audit`.
