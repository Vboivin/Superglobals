namespace Superglobals\Internals;
use namespace HH\Lib\Str;

function get_error_mesage_constructor(string $superglobal)[]: string {
    return Str\format('%s cannot be instantiated!', $superglobal);
}
