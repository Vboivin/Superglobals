namespace Superglobals;
use type Superglobals\Internals\{GlobalEnum, Superglobal};

/**
 * Implementation with typings of the $_SESSION php superglobal.
 *
 * An associative array containing session variables available to the current
 * script.
 *
 * https://www.php.net/manual/en/reserved.variables.session.php
 */
final class Session extends Superglobal {
    public ?dict<arraykey, mixed> $data;

    public function __construct()[globals]: void {
        $this->data = self::_UNSAFE() as ?dict<_, _>;
    }

    /**
    * Escape hatch available while using Session::_UNSAFE().
    * The properties defined on this class do not encompass
    * all the possible options provided by the superglobal $_SESSION.
    * As such, we provide the user with this method to access unknown
    * or custom variables possibly accessible on $_SESSION.
    *
    * You can also use HH\global_get('_SESSION') as an alternative.
    */
    <<__Override>>
    public static function _UNSAFE()[globals]: mixed {
        return \HH\global_get(GlobalEnum::SESSION);
    }
}
