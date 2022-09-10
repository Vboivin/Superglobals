namespace Superglobals\Internals;

enum GlobalEnum: string as string {
    SERVER = '_SERVER';
    GET = '_GET';
    POST = '_POST';
    FILES = '_FILES';
    REQUEST = '_REQUEST';
    SESSION = '_SESSION';
    COOKIE = '_COOKIE';
}
