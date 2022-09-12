namespace Superglobals;
use type Superglobals\Internals\{GlobalEnum, Superglobal};
use namespace HH\Lib\{C, Str};

enum TypeText: string as string {
    INT = '?HH\int';
    FLOAT = '?HH\float';
    BOOL = '?HH\bool';
    STRING = '?HH\string';
}

/**
 * Implementation with typings of the $_GET php superglobal.
 *
 * An associative array of variables passed to the current script via the URL
 * parameters (aka. query string). Note that the array is not only populated
 * for GET requests, but rather for all requests with a query string.
 *
 * https://www.php.net/manual/en/reserved.variables.get.php
 */
final class Get<T> extends Superglobal {
    public function __construct(
        private classname<T> $_classname,
        public ?T $data = null,
    )[globals, rx_local]: void {
        $clazz = new \ReflectionClass($this->_classname);
        $get = self::_UNSAFE() as ?dict<_, _>;
        $obj = $clazz->newInstance();
        if (!$get) {
            return;
        }
        foreach (
            $clazz->getProperties(\ReflectionProperty::IS_PUBLIC) as $property
        ) {
            if (!$this->isValidQueryVariable($property, $get)) {
                continue;
            }
            $this->assignPropertyOnObject($obj, $property, $get);
        }
        $this->data = $obj;
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

    private function isValidQueryVariable(
        \ReflectionProperty $property,
        readonly dict<arraykey, mixed> $get,
    )[]: bool {
        return
            $property->hasAttribute(Str\split(QueryVariable::class, '\\')[1]) &&
            C\contains_key($get, $property->getName());
    }

    private function assignPropertyOnObject(
        mixed $obj,
        \ReflectionProperty $property,
        dict<arraykey, mixed> $get,
    )[globals, write_props]: void {
        $val = $get[$property->getName()] ?? null;
        switch ($property->getTypeText()) {
            case TypeText::INT:
                $property->setValue($obj, (int)$val);
                break;
            case TypeText::FLOAT:
                $property->setValue($obj, (float)$val);
                break;
            case TypeText::BOOL:
                $property->setValue($obj, (bool)$val);
                break;
            case TypeText::STRING:
            default:
                $property->setValue($obj, $val);
                break;
        }
    }
}

final class QueryVariable implements \HH\InstancePropertyAttribute {}
