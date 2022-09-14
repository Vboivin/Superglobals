use type Superglobals\{Form, FormVariable, Post, SuperglobalException};
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{modify_superglobal};
use type Facebook\HackTest\{HackTest};
use function Facebook\FBExpect\expect;

<<Form>>
final class TestFormData {
    <<FormVariable>> public ?string $name;
    <<FormVariable>> public ?string $email;
    <<FormVariable>> public ?int $age;
}

final class InvalidFormClass {}

final class GlobalPostTest extends HackTest {
    public function testInvalidFormClass(): void {
        expect(() ==> new Post(InvalidFormClass::class))->toThrow(
            SuperglobalException::class,
        );
    }

    public function testFormData(): void {
        modify_superglobal(GlobalEnum::POST, dict<arraykey, mixed>[
            'name' => 'foo',
            'email' => 'bar@baz.com',
            'age' => 99,
        ]);
        $form = new Post(TestFormData::class);
        $unsafePost = Post::_UNSAFE() as nonnull;
        expect($form?->data?->name)->toBeSame($unsafePost['name']);
        expect($form?->data?->email)->toBeSame($unsafePost['email']);
        expect($form?->data?->age)->toBeSame($unsafePost['age']);
    }
}
