namespace Superglobals;
use type Superglobals\Internals\{GlobalEnum, Superglobal};

/**
 * Implementation with typings of the $_POST php superglobal.
 *
 * An associative array of variables passed to the current script via the HTTP
 * POST method when using application/x-www-form-urlencoded or
 * multipart/form-data as the HTTP Content-Type in the request.
 *
 * https://www.php.net/manual/en/reserved.variables.post.php
 */
final class Post extends Superglobal {
    public function __construct(
        public ?dict<arraykey, mixed> $data = self::_UNSAFE() as dict<_, _>,
    )[globals]: void {}

    /**
    * Escape hatch available while using Post::_UNSAFE().
    * The properties defined on this class do not encompass
    * all the possible options provided by the superglobal $_POST.
    * As such, we provide the user with this method to access unknown
    * or custom variables possibly accessible on $_POST.
    *
    * You can also use HH\global_get('_POST') as an alternative.
    */
    <<__Override>>
    public static function _UNSAFE()[globals]: mixed {
        return \HH\global_get(GlobalEnum::POST);
    }
}
