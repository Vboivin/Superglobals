namespace Superglobals;
use type Superglobals\Internals\{GlobalEnum, Superglobal};

/**
 * Implementation with typings of the $_COOKIE php superglobal.
 *
 * An associative array of variables passed to the current script via
 * HTTP Cookies.
 *
 * https://www.php.net/manual/en/reserved.variables.cookies.php
 */
final class Cookie extends Superglobal {
    public function __construct(
        public ?dict<arraykey, mixed> $cookies = self::_UNSAFE() as dict<_, _>,
    )[globals]: void {}

    /**
    * Escape hatch available while using Cookie::_UNSAFE().
    * The properties defined on this class do not encompass
    * all the possible options provided by the superglobal $_COOKIE.
    * As such, we provide the user with this method to access unknown
    * or custom variables possibly accessible on $_COOKIE.
    *
    * You can also use HH\global_get('_COOKIE') as an alternative.
    */
    <<__Override>>
    public static function _UNSAFE()[globals]: mixed {
        return \HH\global_get(GlobalEnum::COOKIE);
    }
}
