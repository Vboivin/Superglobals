namespace Superglobals\Internals;

final class _COOKIE extends Superglobal {
    public static ?dict<arraykey, mixed> $cookies;

    public function __construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::COOKIE),
        );
    }

    <<__Override>>
    public static function _INIT()[globals]: void {
        self::$cookies = \HH\global_get(GlobalEnum::COOKIE) as ?dict<_, _>;
    }
}
