namespace Superglobals\Internals;

final class _REQUEST extends Superglobal {
    public static classname<_GET> $get = _GET::class;
    public static classname<_POST> $post = _POST::class;
    public static classname<_COOKIE> $cookie = _COOKIE::class;

    public function __construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::REQUEST),
        );
    }

    <<__Override>>
    public static function _INIT()[globals, write_props]: void {
        // Initialized by _GET, _POST and _COOKIE
    }
}
