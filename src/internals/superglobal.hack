namespace Superglobals\Internals;
use type Superglobals\SuperglobalException;
use namespace HH\Lib\{C, Str};

enum TypeText: string as string {
    INT = '?HH\int';
    FLOAT = '?HH\float';
    BOOL = '?HH\bool';
    STRING = '?HH\string';
}

abstract class Superglobal<T> {
    abstract public static function _UNSAFE()[globals]: mixed;

    protected function getDataForObject(
        classname<T> $classname,
        string $classAttribute,
        string $instancePropertyAttribute,
    ): T {
        $clazz = new \ReflectionClass($classname);
        if (!$clazz->hasAttribute(Str\split($classAttribute, '\\')[1])) {
            throw new SuperglobalException(
                'You need to decorate '.$classname.'with '.$classAttribute,
            );
        }
        $global = static::_UNSAFE() as ?dict<_, _>;
        $obj = $clazz->newInstance();
        if (!$global) {
            return $obj;
        }
        foreach (
            $clazz->getProperties(\ReflectionProperty::IS_PUBLIC) as $property
        ) {
            if (
                $this->isValidVariable(
                    $property,
                    Str\split($instancePropertyAttribute, '\\')[1],
                    $global,
                )
            ) {
                $this->assignPropertyOnObject($obj, $property, $global);
            }
        }
        return $obj;
    }

    private function assignPropertyOnObject(
        mixed $obj,
        \ReflectionProperty $property,
        dict<arraykey, mixed> $global,
    )[globals, write_props, rx_local]: void {
        $val = $global[$property->getName()] ?? null;
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

    private function isValidVariable(
        \ReflectionProperty $property,
        string $classname,
        readonly dict<arraykey, mixed> $global,
    )[]: bool {
        return $property->hasAttribute($classname) &&
            C\contains_key($global, $property->getName());
    }
}
