namespace Superglobals\Internals;

final class _GET extends Superglobal {
    public static ?dict<arraykey, mixed> $queryString;

    public function __construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::GET),
        );
    }

    <<__Override>>
    public static function _INIT()[globals]: void {
        self::$queryString = \HH\global_get(GlobalEnum::GET) as ?dict<_, _>;
    }
}
