namespace Superglobals\Internals;

final class _FILES extends Superglobal {
    public static ?dict<arraykey, mixed> $files;

    public function construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::FILES),
        );
    }

    <<__Override>>
    public static function _INIT()[globals]: void {
        self::$files = \HH\global_get(GlobalEnum::FILES) as ?dict<_, _>;
    }
}
