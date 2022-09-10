namespace Superglobals\Internals;

final class _SESSION extends Superglobal {
    public static ?dict<arraykey, mixed> $data;

    public function __construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::SESSION),
        );
    }

    <<__Override>>
    public static function _INIT()[globals]: void {
        self::$data = \HH\global_get(GlobalEnum::SESSION) as ?dict<_, _>;
    }
}
