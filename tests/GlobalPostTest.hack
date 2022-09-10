use type Superglobals\Globals;
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{
    get_provider_multiple_args,
    get_provider_single_arg,
    global_test_setup,
    global_test_teardown,
    modify_global_dict,
};
use function HH\{global_get};
use namespace HH\Lib\{Dict};
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class GlobalPostTest extends HackTest {
    const string OLD_POST_PLACEHOLDER = 'OLD_POST';

    <<__Override>>
    public async function beforeEachTestAsync(): Awaitable<void> {
        global_test_setup(GlobalEnum::POST, self::OLD_POST_PLACEHOLDER);
    }

    <<__Override>>
    public async function afterEachTestAsync(): Awaitable<void> {
        global_test_teardown(GlobalEnum::POST, self::OLD_POST_PLACEHOLDER);
    }

    public function formDataProviderSingleArg(): vec<(arraykey, mixed)> {
        return get_provider_single_arg();
    }

    public function formDataProviderMultipleArgs(
    ): vec<vec<(arraykey, mixed)>> {
        return get_provider_multiple_args();
    }

    <<DataProvider('formDataProviderSingleArg')>>
    public function testFormDataSingleArg(arraykey $key, mixed $value): void {
        modify_global_dict(GlobalEnum::POST, dict[$key => $value]);
        $p = (new Globals())->POST;
        expect($p::$formData)->toBeSame(global_get(GlobalEnum::POST));
    }

    <<DataProvider('formDataProviderMultipleArgs')>>
    public function testFormDataMultipleArgs((arraykey, mixed) ...$args): void {
        modify_global_dict(GlobalEnum::POST, Dict\from_entries($args));
        $p = (new Globals())->POST;
        expect($p::$formData)->toBeSame(global_get(GlobalEnum::POST));
    }
}
