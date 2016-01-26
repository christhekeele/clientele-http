Clientele::HTTP
==============

> **Value objects for leveraging the HTTP protocol in Ruby.**

The `Clientele::HTTP` module contains a wealth of types for your HTTP operations:

- Simple Types
  - `Clientele::HTTP::Verb`
  - `Clientele::HTTP::Status`
  - `Clientele::HTTP::Header`
- Complex Types
  - `Clientele::HTTP::URI`
  - `Clientele::HTTP::Headers`
  - `Clientele::HTTP::Body`
- Compound Types
  - `Clientele::HTTP::Request`
  - `Clientele::HTTP::Response`

`Verb`s, `Status`s, and `Header`s are value objects that come with many preset subclasses, allow for creating custom ones, and are capable of defining dynamic ones on the fly.

`URI`s, `Headers`, and `Body`s provide robust support for the nuanced behavior of these types.

`Request`s and `Response`s are compound value objects built on top of the rest that conduct all appropriate type-casting on initialization.

Our hope is that these high-level standardized types should make interoperability between low-level HTTP libraries easy. Of course, `clientele-http` was written to power the `clientele` HTTP library, which does exactly that. Check out `clientele-adapters` to see how these types make this easy, or `clientele-wrappers` that allow you to gracefully transition off of other high-level HTTP libraries like `faraday`. Finally, take a look at `clientele-api` for a powerful API Client generator that brings all of these gems together.

Usage
-----

### Simple Types

These simple types not only contain base classes, but many out-of-the-box subclasses. To work with them, you have:

1. a base class for shared behavior
-  an abstract concrete class for known types
-  a dynamic class for runtime-discovered types
-  a suite of concrete types
-  a 'registry file' of `require` statements for all provided concrete types

#### Verbs

Verbs are simple wrappers around all-caps symbols representing an HTTP verb/method.

Concrete verb classes are singletons.

Base: `Clientele::HTTP::Verb`
Registry: `clientele/http/verbs`

```ruby
require 'clientele/http/verbs'

Clientele::HTTP::Verb.methods
#=> [:CONNECT, :DELETE, :GET, :HEAD, :OPTIONS, :PATCH, :POST, :PUT]
Clientele::HTTP::Verb.all
#=> [#<Clientele::HTTP::Verb:0x7f974ce338a8 - CONNECT>,
#=>  #<Clientele::HTTP::Verb:0x7f974ce33880 - DELETE>,
#=>  #<Clientele::HTTP::Verb:0x7f974ce33858 - GET>...]
```

Concrete class: `Clientele::HTTP::Verb::Concrete`

```ruby
get = Clientele::HTTP::Verb.for :get
#=> #<Clientele::HTTP::Verb:0x7fa5dac5e068 - GET>
get.class
#=> Clientele::HTTP::Verb::Get
get.class.superclass
#=> Clientele::HTTP::Verb::Concrete
get.method
#=> :GET
get.has_request_body?
#=> false
get.has_response_body?
#=> true
```

Dynamic class: `Clientele::HTTP::Verb::Generic`

```ruby
foo = Clientele::HTTP::Verb.for :foo
#=> #<Clientele::HTTP::Verb:0x7ff4e218e460 - FOO>
foo.class
#=> Clientele::HTTP::Verb::Generic
foo.method
#=> :FOO
foo.has_request_body?
#=> true
foo.has_response_body?
#=> true

bar = Clientele::HTTP::Verb.for :bar, request_body: false, response_body: false
#=> #<Clientele::HTTP::Verb:0x7ff4e47a33d0 - BAR>
bar.class
#=> Clientele::HTTP::Verb::Generic
bar.method
#=> :BAR
bar.has_request_body?
#=> false
bar.has_response_body?
#=> false
```

Custom concrete classes must be placed in the `Clientele::HTTP::Verb` namespace and inherit from `Clientele::HTTP::Verb::Concrete`:

```ruby
class Clientele::HTTP::Verb::Baz < Clientele::HTTP::Verb::Concrete
  @method        = :BAZ
  @request_body  = true
  @response_body = false
end

Clientele::HTTP::Verb.methods.include? :BAZ
#=> true
```

#### Statuses

Statuses are simple wrappers around three-digit integers representing an HTTP status code.

Concrete status classes are singletons.

Base: `Clientele::HTTP:Status`
Registry: `clientele/http/statuses`

```ruby
require 'clientele/http/statuses'

Clientele::HTTP::Status.codes
#=> [100, 101, 102, 103, 200, 201, 202...]
Clientele::HTTP::Status.all
#=> [#<Clientele::HTTP::Status:0x7f974e115ca0 - 100: Continue>,
 #=> #<Clientele::HTTP::Status:0x7f974e115c78 - 101: Switching Protocols>,
 #=> #<Clientele::HTTP::Status:0x7f974e115c50 - 102: Processing>...]
```

Concrete class: `Clientele::HTTP::Status::Concrete`

```ruby
ok = Clientele::HTTP::Status.for 200
#=> #<Clientele::HTTP::Status:0x7fa5dac5e068 - 200: OK>
ok.class
#=> Clientele::HTTP::Status::OK
ok.class.superclass
#=> Clientele::HTTP::Status::Concrete
ok.code
#=> 400
ok.description
#=> "OK"
```

Dynamic class: `Clientele::HTTP::Status::Generic`

```ruby
custom = Clientele::HTTP::Status.for 299
#=> #<Clientele::HTTP::Status:0x7fa5dac5e068 - 299: Non-standard HTTP Status>
custom.class
#=> Clientele::HTTP::Status::Generic
custom.code
#=> 299
custom.description
#=> "Non-standard HTTP Status"

success = Clientele::HTTP::Status.for 299, description: "My custom Success status code"
#=> #<Clientele::HTTP::Status:0x7fa5dac5e068 - 299: My custom Success status code>
success.class
#=> Clientele::HTTP::Status::Generic
success.code
#=> 299
success.description
#=> "My custom Success status code"
```

Custom concrete classes must be placed in the `Clientele::HTTP::Status` namespace and inherit from `Clientele::HTTP::Status::Concrete`:

```ruby
class Clientele::HTTP::Status::Baz < Clientele::HTTP::Status::Concrete
  @method       = 499
  @description  = "Macaroon Authentication Required"
end

Clientele::HTTP::Status.codes.include? 299
#=> true
```

Query methods:

```ruby
codes = [0, 100, 200, 300, 400, 500, 600]
statuses = codes.map do |code|
  Clientele::HTTP::Status.for code
end
statuses.each {|s| puts s}
#=> 0:   Non-standard HTTP Status
#=> 100: Continue
#=> 200: OK
#=> 300: Multiple Choices
#=> 400: Bad Request
#=> 500: Internal Server Error
#=> 600: Non-standard HTTP Status

statuses.select(&:informational?).each {|s| puts s}
#=> 100: Continue

statuses.select(&:success?).each {|s| puts s}
#=> 200: OK

statuses.select(&:redirection?).each {|s| puts s}
#=> 300: Multiple Choices

statuses.select(&:client_error?).each {|s| puts s}
#=> 400: Bad Request

statuses.select(&:server_error?).each {|s| puts s}
#=> 500: Internal Server Error

statuses.select(&:error?).each {|s| puts s}
#=> 400: Bad Request
#=> 500: Internal Server Error

statuses.select(&:valid?).each {|s| puts s}
#=> 100: Continue
#=> 200: OK
#=> 300: Multiple Choices
#=> 400: Bad Request
#=> 500: Internal Server Error

statuses.select(&:invalid?).each {|s| puts s}
#=> 0:   Non-standard HTTP Status
#=> 600: Non-standard HTTP Status

# for redirection statuses that contain a follow-up
Clientele::HTTP::Status.all.select(&:redirectable?).each {|s| puts s}
#=> 301: Moved Permanently
#=> 302: Found
#=> 303: See Other
#=> 307: Temporary Redirect
#=> 308: Permanent Redirect
```

#### Headers

Header objects are simple wrappers around a single key-value pair.

Concrete header classes may come with extra query methods.

Base: `Clientele::HTTP::Header`
Registries:
  - `clientele/http/headers` for all, or
  - `clientele/http/request/headers`
  - `clientele/http/response/headers`

```ruby
require 'clientele/http/headers'

Clientele::HTTP::Header.names
#=> ["Accept",
#=> "Accept-Charset",
#=> "Accept-Datetime",
#=> "Accept-Encoding",
#=> "Authorization",
#=> "Cache-Control"...]
Clientele::HTTP::Header.types
#=> [Clientele::HTTP::Header::Accept,
#=> Clientele::HTTP::Header::AcceptCharset,
#=> Clientele::HTTP::Header::AcceptDatetime,
#=> Clientele::HTTP::Header::AcceptEncoding,
#=> Clientele::HTTP::Header::Authorization,
#=> Clientele::HTTP::Header::CacheControl...]
Clientele::HTTP::Header.request_names
#=> ["Accept",
#=> "Accept-Charset",
#=> "Accept-Datetime",
#=> "Accept-Encoding"...]
Clientele::HTTP::Header.request_types
#=> [Clientele::HTTP::Header::Accept,
#=> Clientele::HTTP::Header::AcceptCharset,
#=> Clientele::HTTP::Header::AcceptDatetime,
#=> Clientele::HTTP::Header::AcceptEncoding...]
Clientele::HTTP::Header.response_names
#=> ["Cache-Control",
#=>  "Connection",
#=>  "Content-Length",
#=>  "Content-MD5"...]
Clientele::HTTP::Header.response_types
#=> [Clientele::HTTP::Header::CacheControl,
#=>  Clientele::HTTP::Header::Connection,
#=>  Clientele::HTTP::Header::ContentLength,
#=>  Clientele::HTTP::Header::ContentMD5...]
```

Concrete class: `Clientele::HTTP::Header::Concrete`

```ruby
ua = Clientele::HTTP::Header.for "User-Agent", "Clientele"
#=> #<Clientele::HTTP::Header:0x7fa5dac5e068 - User-Agent: Clientele>
ua.class
#=> Clientele::HTTP::Header::UserAgent
ua.class.superclass
#=> Clientele::HTTP::Header::Concrete
ua.name
#=> "User-Agent"
ua.value
#=> "Clientele"
ua.type
#=> :request
```

Dynamic class: `Clientele::HTTP::Header::Generic`

```ruby
foo = Clientele::HTTP::Header.for "Foo", "Far"
#=> #<Clientele::HTTP::Header:0x7fa5dac5e068 - Foo: Far>
foo.class
#=> Clientele::HTTP::Header::Generic
foo.name
#=> "Foo"
foo.value
#=> "Far"
foo.type
#=> :custom

boo = Clientele::HTTP::Header.for "Boo", "Bar", type: :response
#=> #<Clientele::HTTP::Header:0x7fa5dac5e068 - Boo: Bar>
boo.class
#=> Clientele::HTTP::Header::Generic
boo.name
#=> "Boo"
boo.value
#=> "Bar"
boo.type
#=> :response
```

Custom concrete classes must be placed in the `Clientele::HTTP::Header` namespace and inherit from `Clientele::HTTP::Header::Concrete`:

```ruby
class Clientele::HTTP::Header::FizzBuzz < Clientele::HTTP::Header::Concrete
  @name = 'FizzBuzz'
  # optional: will put in request/response category
  @type  = :response
end

Clientele::HTTP::Header.response_names.include? 'FizzBuzz'
#=> true
```

### Complex Types

#### URI

The `Clientele::HTTP::URI` class is just an unmodified subclass of an `Addressable::URI`, `clientele`'s only dependency.

#### Headers

The `Clientele::HTTP::Headers` class manages a collection of `Header` key-value pairs.

You can instantiate it with a hash and an optional `type` (which doesn't do much but tag non-standard header objects with that type).

```ruby
require 'clientele/http/headers'
hash = {
  "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
  "Accept-Encoding" => "gzip, deflate, sdch",
  "Accept-Language" => "en-US,en;q=0.8",
  "Cache-Control" => "no-cache",
  "Connection" => "keep-alive",
  "DNT" => "1",
  "Host" => "ruby-doc.org",
  "Pragma" => "no-cache",
  "Referer" => "https://www.google.com/",
  "Upgrade-Insecure-Requests" => "1",
  "X-Custom-Header" => "Foobar!"
}
headers = Clientele::HTTP::Headers.new hash, type: :request
#=> #<Clientele::HTTP::Headers:0x7fc114abbe40 (for request)
#=>   Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
#=>   Accept-Encoding: gzip, deflate, sdch
#=>   Accept-Language: en-US,en;q=0.8
#=>   Cache-Control: no-cache
#=>   Connection: keep-alive
#=>   DNT: 1
#=>   Host: ruby-doc.org
#=>   Pragma: no-cache
#=>   Referer: https://www.google.com/
#=>   Upgrade-Insecure-Requests: 1
#=>   X-Custom-Header: Foobar!
#=> >
headers.all
#=> [#<Clientele::HTTP::Header:0x7fee09912108 - Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8>,
#=> #<Clientele::HTTP::Header:0x7fee099102b8 - Accept-Encoding: gzip, deflate, sdch>,
#=> #<Clientele::HTTP::Header:0x7fee0baca4f8 - Accept-Language: en-US,en;q=0.8>...]
```

You can manipulate your headers with `get` and `set`. Note that `set` will create a new `Headers` object entirely, since they're read-only.

```ruby
headers.get('X-Custom-Header')
#=> #<Clientele::HTTP::Header:0x7fc117002fc8 - X-Custom-Header: Foobar!>
modified_headers = headers.set('X-Custom-Header', 'Fizzbuzz!')
modified_headers.get('X-Custom-Header')
#=> #<Clientele::HTTP::Header:0x7fc11243f348 - X-Custom-Header: Fizzbuzz!>
headers.get('X-Custom-Header')
#=> #<Clientele::HTTP::Header:0x7fc117002fc8 - X-Custom-Header: Foobar!>
```

A headers object also has some hash-like functionality:

```ruby
headers['X-Custom-Header']
#=> #<Clientele::HTTP::Header:0x7fc117002fc8 - X-Custom-Header: Foobar!>
headers.has_key? 'X-Custom-Header'
#=> #<Clientele::HTTP::Header:0x7fc117002fc8 - X-Custom-Header: Foobar!>
headers.keys
#=> ["Accept",
#=> "Accept-Encoding",
#=> "Accept-Language"...]
headers.values
#=> ["text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
#=> "gzip, deflate, sdch",
#=> "en-US,en;q=0.8"...]
headers.to_h
#=> {
#=>  "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
#=>  "Accept-Encoding" => "gzip, deflate, sdch",
#=>  "Accept-Language" => "en-US,en;q=0.8"...}
```

For compatibility, headers will convert into their hash equivalent on enumeration (`.each` and friends). You can instead enumerate over `headers.all` or use the `headers.each_header` enumerator to iterate over proper `Header` instances.

#### Body

Just kidding, we don't touch the body (yet) from its default string representation in either requests or responses.

## Compound Classes

WIP


Thread-safety
-------------

Rather than doing anything fancy to enforce being threadsafe like freezing everything, using mutexes, or having a `finalize` + caching API for declaring when you're done configuring your runtime, `clientele-http` follows a simple axiom: all modification is done exclusively in the `initialize` method. We assume you define any custom classes and subclasses after you load the library but before you start to use it.

No object provides any public command methods, only query methods. All command methods are private and only ever called exactly once per instance, during initialization. If you want to add command methods (most notably by having Requests be able to generate Responses) we recommend you subclass these classes and add your behavior there. We also reccommend that any mutator methods return a duped copy of the instance you're working with, but you're free to do your own thing.

TLDR; it's Ruby. A little extra work and discipline is required to keep things thread-safe but you'll always be able to shoot yourself in the foot. We don't turn the safety on for you, we just point the gun in a better direction by providing sane thread-safe default behavior that meshes with a standard ruby library workflow.

Contributing
------------

Bug reports and pull requests are welcome on GitHub at https://github.com/christhekeele/clientele-http.
