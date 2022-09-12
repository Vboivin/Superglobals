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

Example of using $_GET with user defined properties:
```Hack
use type Superglobals\{Get, QueryVariable};

final class PersonQuery {
    <<QueryVariable>> public ?int $age;
    <<QueryVariable>> public ?string $name;
}

$query = new Get<PersonQuery>(PersonQuery::class);
$query?->data?->age; // Do something with the person's age
$query?->data?->name; // Do something with the person's name
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