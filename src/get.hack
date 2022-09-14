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
final class Get<T> extends Superglobal<T> {
    public function __construct(
        private classname<T> $_classname,
        public ?T $data = null,
    )[globals, rx_local]: void {
        $this->data = $this->getDataForObject(
            $this->_classname,
            QueryString::class,
            QueryVariable::class,
        );
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
    public static function _UNSAFE()[globals]: ?dict<arraykey, mixed> {
        return \HH\global_get(GlobalEnum::GET) as ?dict<_, _>;
    }
}

final class QueryString implements \HH\ClassAttribute {}
final class QueryVariable implements \HH\InstancePropertyAttribute {}
