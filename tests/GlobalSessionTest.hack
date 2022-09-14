use type Superglobals\{
    Session,
    SessionData,
    SessionVariable,
    SuperglobalException,
};
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{modify_superglobal};
use type Facebook\HackTest\{HackTest};
use function Facebook\FBExpect\expect;

<<SessionData>>
final class PersonSession {
    <<SessionVariable>> public ?int $age;
    <<SessionVariable>> public ?string $name;
}

<<SessionData>>
final class TestSession {
    <<SessionVariable>> public ?int $foo;
    <<SessionVariable>> public ?float $bar;
    <<SessionVariable>> public ?bool $baz;
    <<SessionVariable>> public ?string $woops;
}

final class InvalidSession {}

final class GlobalSessionTest extends HackTest {
    public function testUserDefinedSession(): void {
        modify_superglobal(
            GlobalEnum::SESSION,
            dict<arraykey, mixed>['name' => 'foo', 'age' => 99],
        );
        $session = new Session(PersonSession::class);
        $unsafeSession = Session::_UNSAFE() as nonnull;
        expect($session?->data?->age)->toBeSame($unsafeSession['age']);
        expect($session?->data?->name)->toBeSame($unsafeSession['name']);
    }

    public function testSessionWithAllPrimitives(): void {
        modify_superglobal(
            GlobalEnum::SESSION,
            dict<arraykey, mixed>[
                'foo' => 0,
                'bar' => 1.2,
                'baz' => true,
                'woops' => 'doops',
            ],
        );
        $session = new Session(TestSession::class);
        $unsafeSession = Session::_UNSAFE() as nonnull;
        expect($session?->data?->foo)->toBeSame($unsafeSession['foo']);
        expect($session?->data?->bar)->toBeSame($unsafeSession['bar']);
        expect($session?->data?->baz)->toBeSame($unsafeSession['baz']);
        expect($session?->data?->woops)->toBeSame($unsafeSession['woops']);
    }

    public function testInvalidSessionClass(): void {
        expect(() ==> new Session(InvalidSession::class))->toThrow(
            SuperglobalException::class,
        );
    }
}
