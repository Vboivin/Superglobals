use type Superglobals\Get;
use type Superglobals\Internals\{GlobalEnum};
use function TestUtils\{
    get_provider_multiple_args,
    get_provider_single_arg,
    modify_superglobal,
};
use namespace HH\Lib\{Dict};
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class GlobalGetTest extends HackTest {
    const string OLD_GET_PLACEHOLDER = 'OLD_GET';

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
        modify_superglobal(GlobalEnum::GET, dict[$key => $value]);
        $g = new Get();
        expect($g->queryString)->toBeSame(Get::_UNSAFE());
    }

    <<DataProvider('queryStringProviderMultipleArgs')>>
    public function testQueryStringMultipleArgs(
        (arraykey, mixed) ...$args
    ): void {
        modify_superglobal(GlobalEnum::GET, Dict\from_entries($args));
        $g = new Get();
        expect($g->queryString)->toBeSame(Get::_UNSAFE());
    }
}
