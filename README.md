Superglobals
============
[![CI](https://github.com/vboivin/Superglobals/actions/workflows/build_and_test.yml/badge.svg)](https://github.com/vboivin/Superglobals/actions/workflows/build_and_test.yml)


Type-safe access to php superglobals.

Components
==========

Globals
-------

Class representing all the php superglobals.

Example of accessing 'REQUEST_METHOD' on $_SERVER:

```Hack
use type Superglobals\Globals;

$server = (new Globals())->SERVER;
$server::$REQUEST_METHOD; // 'GET', 'HEAD', 'POST', 'PUT', etc. or null
```

Example of using the raw $_SERVER superglobal:
```Hack
use type Superglobals\Globals;

$server = (new Globals())->SERVER;
$unsafeServer = $server::_UNSAFE();
$unsafeServer['REQUEST_METHOD']; // 'GET', 'HEAD', 'PUT', etc. or null
$unsafeServer['UNKNOWN_VARIABLE']; // Could be anything
```

Example of accessing multiple superglobals:
```Hack
use type Superglobals\Globals;

$globals = new Globals();
$get = $globals->GET;
$post = $globals->POST;
$get::$queryString; // Do something with the query string.
$post::$formData; // Do something with the form data.
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