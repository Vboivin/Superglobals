use type Superglobals\{Get, QueryVariable};
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{modify_superglobal};
use type Facebook\HackTest\{HackTest};
use function Facebook\FBExpect\expect;

final class PersonQuery {
    <<QueryVariable>> public ?int $age;
    <<QueryVariable>> public ?string $name;
}

final class TestQuery {
    <<QueryVariable>> public ?int $foo;
    <<QueryVariable>> public ?float $bar;
    <<QueryVariable>> public ?bool $baz;
    <<QueryVariable>> public ?string $woops;
}

final class GlobalGetTest extends HackTest {
    public function testQueryStringUserDefinedProperties(): void {
        modify_superglobal(
            GlobalEnum::GET,
            dict<arraykey, mixed>['name' => 'foo', 'age' => 99],
        );
        $query = new Get<PersonQuery>(PersonQuery::class);
        $unsafeQuery = Get::_UNSAFE() as dict<_, _>;
        expect($query?->data?->age)->toBeSame($unsafeQuery['age']);
        expect($query?->data?->name)->toBeSame($unsafeQuery['name']);
    }

    public function testQueryStringWithAllPrimitives(): void {
        modify_superglobal(
            GlobalEnum::GET,
            dict<arraykey, mixed>[
                'foo' => 0,
                'bar' => 1.2,
                'baz' => true,
                'woops' => 'doops',
            ],
        );
        $query = new Get<TestQuery>(TestQuery::class);
        $unsafeQuery = Get::_UNSAFE() as dict<_, _>;
        expect($query?->data?->foo)->toBeSame($unsafeQuery['foo']);
        expect($query?->data?->bar)->toBeSame($unsafeQuery['bar']);
        expect($query?->data?->baz)->toBeSame($unsafeQuery['baz']);
        expect($query?->data?->woops)->toBeSame($unsafeQuery['woops']);
    }
}
