namespace Superglobals;
use type Superglobals\Internals\{GlobalEnum, Superglobal};

/**
 * Implementation with typings of the $_FILES php superglobal.
 *
 * An associative array of items uploaded to the current script via the HTTP
 * POST method.
 *
 * https://www.php.net/manual/en/reserved.variables.files.php
 */
final class Files extends Superglobal {
    public function __construct(
        public ?dict<arraykey, mixed> $uploadedFiles = self::_UNSAFE()
            as dict<_, _>,
    )[globals]: void {}

    /**
    * Escape hatch available while using Files::_UNSAFE().
    * The properties defined on this class do not encompass
    * all the possible options provided by the superglobal $_FILES.
    * As such, we provide the user with this method to access unknown
    * or custom variables possibly accessible on $_FILES.
    *
    * You can also use HH\global_get('_FILES') as an alternative.
    */
    <<__Override>>
    public static function _UNSAFE()[globals]: mixed {
        return \HH\global_get(GlobalEnum::FILES);
    }
}
