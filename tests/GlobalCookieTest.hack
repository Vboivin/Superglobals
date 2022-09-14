use type Superglobals\{Cookie, Cookies, CookiesData, SuperglobalException};
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{modify_superglobal};
use type Facebook\HackTest\{HackTest};
use function Facebook\FBExpect\expect;

<<CookiesData>>
final class PersonCookies {
    <<Cookie>> public ?int $age;
    <<Cookie>> public ?string $name;
}

<<CookiesData>>
final class TestCookies {
    <<Cookie>> public ?int $foo;
    <<Cookie>> public ?float $bar;
    <<Cookie>> public ?bool $baz;
    <<Cookie>> public ?string $woops;
}

final class InvalidCookies {}

final class GlobalCookieTest extends HackTest {
    public function testUserDefinedCookies(): void {
        modify_superglobal(
            GlobalEnum::COOKIE,
            dict<arraykey, mixed>['name' => 'foo', 'age' => 99],
        );
        $cookies = new Cookies(PersonCookies::class);
        $unsafeCookie = Cookies::_UNSAFE() as nonnull;
        expect($cookies?->data?->age)->toBeSame($unsafeCookie['age']);
        expect($cookies?->data?->name)->toBeSame($unsafeCookie['name']);
    }

    public function testCookiesWithAllPrimitives(): void {
        modify_superglobal(
            GlobalEnum::COOKIE,
            dict<arraykey, mixed>[
                'foo' => 0,
                'bar' => 1.2,
                'baz' => true,
                'woops' => 'doops',
            ],
        );
        $cookies = new Cookies(TestCookies::class);
        $unsafeCookie = Cookies::_UNSAFE() as nonnull;
        expect($cookies?->data?->foo)->toBeSame($unsafeCookie['foo']);
        expect($cookies?->data?->bar)->toBeSame($unsafeCookie['bar']);
        expect($cookies?->data?->baz)->toBeSame($unsafeCookie['baz']);
        expect($cookies?->data?->woops)->toBeSame($unsafeCookie['woops']);
    }

    public function testInvalidCookiesClass(): void {
        expect(() ==> new Cookies(InvalidCookies::class))->toThrow(
            SuperglobalException::class,
        );
    }
}
