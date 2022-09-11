namespace Superglobals;
use type Superglobals\Internals\{GlobalEnum, Superglobal};

/**
 * Implementation with typings of the $_GET php superglobal.
 *
 * An associative array of variables passed to the current script via the URL
 * parameters (aka. query string). Note that the array is not only populated
 * for GET requests, but rather for all requests with a query string.
 *
 * https://www.php.net/manual/en/reserved.variables.get.php
 */
final class Get extends Superglobal {
    public ?dict<arraykey, mixed> $queryString;

    public function __construct()[globals]: void {
        $this->queryString = self::_UNSAFE() as ?dict<_, _>;
    }

    /**
    * Escape hatch available while using Get::_UNSAFE().
    * The properties defined on this class do not encompass
    * all the possible options provided by the superglobal $_GET.
    * As such, we provide the user with this method to access unknown
    * or custom variables possibly accessible on $_GET.
    *
    * You can also use HH\global_get('_GET') as an alternative.
    */
    <<__Override>>
    public static function _UNSAFE()[globals]: mixed {
        return \HH\global_get(GlobalEnum::GET);
    }
}
