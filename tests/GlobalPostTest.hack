use type Superglobals\Post;
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{
    get_provider_multiple_args,
    get_provider_single_arg,
    modify_superglobal,
};
use namespace HH\Lib\{Dict};
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class GlobalPostTest extends HackTest {
    const string OLD_POST_PLACEHOLDER = 'OLD_POST';

    public function formDataProviderSingleArg(): vec<(arraykey, mixed)> {
        return get_provider_single_arg();
    }

    public function formDataProviderMultipleArgs(
    ): vec<vec<(arraykey, mixed)>> {
        return get_provider_multiple_args();
    }

    <<DataProvider('formDataProviderSingleArg')>>
    public function testFormDataSingleArg(arraykey $key, mixed $value): void {
        modify_superglobal(GlobalEnum::POST, dict[$key => $value]);
        $p = new Post();
        expect($p->formData)->toBeSame(Post::_UNSAFE());
    }

    <<DataProvider('formDataProviderMultipleArgs')>>
    public function testFormDataMultipleArgs((arraykey, mixed) ...$args): void {
        modify_superglobal(GlobalEnum::POST, Dict\from_entries($args));
        $p = new Post();
        expect($p->formData)->toBeSame(Post::_UNSAFE());
    }
}
