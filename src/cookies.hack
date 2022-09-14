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
final class Cookies<T> extends Superglobal<T> {
    public function __construct(
        private classname<T> $_classname,
        public ?T $data = null,
    )[globals, rx_local]: void {
        $this->data = $this->getDataForObject(
            $this->_classname,
            CookiesData::class,
            Cookie::class,
        );
    }

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
    public static function _UNSAFE()[globals]: ?dict<arraykey, mixed> {
        return \HH\global_get(GlobalEnum::COOKIE) as ?dict<_, _>;
    }
}

final class CookiesData implements \HH\ClassAttribute {}
final class Cookie implements \HH\InstancePropertyAttribute {}
