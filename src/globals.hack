namespace Superglobals;

use namespace Superglobals\Internals;

final class Globals {
    /**
    * Implementation with typings of the $_SERVER php superglobal.
    *
    * $_SERVER is an array containing information such as headers, paths, and
    * script locations. The entries in this array are created by the web server.
    * There is no guarantee that every web server will provide any of these;
    * servers may omit some, or provide others not listed here. That said, a large
    * number of these variables are accounted for in the » CGI/1.1 specification,
    * so you should be able to expect those.
    *
    * https://www.php.net/manual/en/reserved.variables.server.php
    */
    public classname<Internals\_SERVER> $SERVER;

    public classname<Internals\_GET> $GET;

    public classname<Internals\_POST> $POST;

    public classname<Internals\_REQUEST> $REQUEST;

    public classname<Internals\_FILES> $FILES;

    public classname<Internals\_COOKIE> $COOKIE;

    public classname<Internals\_SESSION> $SESSION;

    private static ?Globals $_instance;

    public function __construct()[globals, rx]: void {
        Internals\_SERVER::_INIT();
        Internals\_GET::_INIT();
        Internals\_POST::_INIT();
        Internals\_COOKIE::_INIT();
        Internals\_FILES::_INIT();
        Internals\_SESSION::_INIT();
        Internals\_REQUEST::_INIT();
        $this->SERVER = Internals\_SERVER::class;
        $this->GET = Internals\_GET::class;
        $this->POST = Internals\_POST::class;
        $this->COOKIE = Internals\_COOKIE::class;
        $this->FILES = Internals\_FILES::class;
        $this->REQUEST = Internals\_REQUEST::class;
        $this->SESSION = Internals\_SESSION::class;
    }
}
