use type Superglobals\Globals;
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{
    get_provider_multiple_args,
    get_provider_single_arg,
    global_test_setup,
    global_test_teardown,
    modify_global_dict,
};
use namespace HH\Lib\{Dict};
use function HH\{global_get};
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class GlobalGetTest extends HackTest {
    const string OLD_GET_PLACEHOLDER = 'OLD_GET';

    <<__Override>>
    public async function beforeEachTestAsync(): Awaitable<void> {
        global_test_setup(GlobalEnum::GET, self::OLD_GET_PLACEHOLDER);
    }

    <<__Override>>
    public async function afterEachTestAsync(): Awaitable<void> {
        global_test_teardown(GlobalEnum::GET, self::OLD_GET_PLACEHOLDER);
    }

    public function queryStringProviderSingleArg(): vec<(arraykey, mixed)> {
        return get_provider_single_arg();
    }

    public function queryStringProviderMultipleArgs(
    ): vec<vec<(arraykey, mixed)>> {
        return get_provider_multiple_args();
    }

    <<DataProvider('queryStringProviderSingleArg')>>
    public function testQueryStringSingleArg(
        arraykey $key,
        mixed $value,
    ): void {
        modify_global_dict(GlobalEnum::GET, dict[$key => $value]);
        $g = (new Globals())->GET;
        expect($g::$queryString)->toBeSame(global_get(GlobalEnum::GET));
    }

    <<DataProvider('queryStringProviderMultipleArgs')>>
    public function testQueryStringMultipleArgs(
        (arraykey, mixed) ...$args
    ): void {
        modify_global_dict(GlobalEnum::GET, Dict\from_entries($args));
        $g = (new Globals())->GET;
        expect($g::$queryString)->toBeSame(global_get(GlobalEnum::GET));
    }
}
