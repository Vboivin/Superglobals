Superglobals
============
[![CI](https://github.com/vboivin/Superglobals/actions/workflows/build_and_test.yml/badge.svg)](https://github.com/vboivin/Superglobals/actions/workflows/build_and_test.yml)


Type-safe access to php superglobals.

Components
==========

Server
-------
Class representing the $_SERVER superglobal.

Example of accessing 'REQUEST_METHOD' on $_SERVER:

```Hack
use type Superglobals\Server;

$server = new Server();
$server->$REQUEST_METHOD; // 'GET', 'HEAD', 'POST', 'PUT', etc. or null
```

Example of using the raw $_SERVER superglobal:
```Hack
use type Superglobals\Server;

$unsafeServer = Server::_UNSAFE();
$unsafeServer['REQUEST_METHOD']; // 'GET', 'HEAD', 'PUT', etc. or null
$unsafeServer['UNKNOWN_VARIABLE']; // Could be anything
```

Get
---
Class representing the $_GET superglobal.

Example of using $_GET with a user defined query string:
```Hack
use type Superglobals\{Get, QueryString, QueryVariable};

<<QueryString>>
final class PersonQuery {
    <<QueryVariable>> public ?int $age;
    <<QueryVariable>> public ?string $name;
}

$query = new Get(PersonQuery::class);
$query?->data?->age; // Do something with the person's age
$query?->data?->name; // Do something with the person's name
```

Post
----
Class representing the $_POST superglobal.

Example of using $_POST with a user defined form:
```Hack
use type Superglobals\{Form, FormVariable, Post};

<<Form>>
final class SignupForm {
    <<FormVariable>> public ?int $age;
    <<FormVariable>> public ?string $name;
    <<FormVariable>> public ?string $email;
}

$form = new Post(SignupForm::class);
$form?->data?->age; // Do something with the person's age
$form?->data?->name; // Do something with the person's name
$form?->data?->email; // Do something with the person's email
```

Cookies
-------
Class representing the $_COOKIE superglobal.

Example of using $_COOKIE with user defined cookies:
```Hack
use type Superglobals\{Cookie, Cookies, CookiesData};

<<CookiesData>>
final class MyCookies {
    <<Cookie>> public ?string $foo;
    <<Cookie>> public ?int $bar;
    <<Cookie>> public ?float $baz;
}

$cookies = new Cookies(MyCookies::class);
$fooCookie = $cookies?->data?->foo; // Do something with the data within cookie 'foo'
$barCookie = $cookies?->data?->bar; // Do something with the data within cookie 'bar'
$bazCookie = $cookies?->data?->baz; // Do something with the data within cookie 'baz'
```

Session
-------
Class representing the $_SESSION superglobal.

Example of using $_SESSION with user defined properties:
```Hack
use type Superglobals\{Session, SessionData, SessionVariable};

<<SessionData>>
final class MySession {
    <<SessionVariable>> public ?string $savedID;
    <<SessionVariable>> public ?string $lastPageSeen;
}

$session = new Session(MySession::class);
$session?->data?->savedID; // Do something with the session's saved ID
$session?->data?->lastPageSeen; // Do something with the session's last seen page
```

SuperglobalException
--------------------
This exception is thrown when you are not using a class attribute on the class
being instantiated by one of the superglobals class defined in this library.

Here is an example using $_POST:
```Hack
use type Superglobals\{Form, FormVariable, Post};

// INVALID CODE
final class InvalidSignupForm {
    <<FormData>> public ?string $name;
}
$invalidForm = new Post(InvalidSignupForm::class); // An exception will be thrown here

// VALID CODE
<<Form>>
final class ValidSignupForm {
    <<FormData>> public ?string $name;
}
$validForm = new Post(ValidSignupForm::class); // No exception thrown here
```

Contributing
============

Contributions are what make the open source community such an amazing place to 
learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
2. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
3. Push to the Branch (`git push origin feature/AmazingFeature`)
4. Open a Pull Request

License
=======

Superglobals is MIT-licensed.