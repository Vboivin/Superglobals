namespace Superglobals\Internals;

final class _POST extends Superglobal {
    public static ?dict<arraykey, mixed> $formData;

    public function __construct()[]: void {
        throw new SuperglobalException(
            get_error_mesage_constructor(GlobalEnum::POST),
        );
    }

    <<__Override>>
    public static function _INIT()[globals]: void {
        self::$formData = \HH\global_get(GlobalEnum::POST) as ?dict<_, _>;
    }
}
