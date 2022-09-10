use type Superglobals\Globals;
use type Superglobals\Internals\{GlobalEnum, ServerKeys, _SERVER};
use namespace HH\Lib\{C, Dict, Vec};
use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class GlobalServerTest extends HackTest {
    <<__Override>>
    public static async function beforeFirstTestAsync(): Awaitable<void> {
        $_ = new Globals();
        $server = \HH\global_get(GlobalEnum::SERVER) as dict<_, _>;
        $clazz = new \ReflectionClass(_SERVER::class);
        $missingValues = C\reduce(
            Vec\keys(ServerKeys::getNames()),
            ($acc, $key) ==> {
                if (!C\contains_key($server, $key)) {
                    $value = $clazz->getStaticPropertyValue($key);
                    $acc[$key] = $value;
                }
                return $acc;
            },
            dict<string, mixed>[],
        );
        \HH\global_set(GlobalEnum::SERVER, Dict\merge($server, $missingValues));
    }

    public function provideServerVariables(): vec<(mixed, mixed)> {
        $unsafeServer = \HH\global_get(GlobalEnum::SERVER) as dict<_, _>;
        $clazz = new \ReflectionClass(_SERVER::class);
        return ServerKeys::getValues()
            |> Vec\map(
                $$,
                $key ==> tuple(
                    $clazz->getStaticPropertyValue($key),
                    $unsafeServer[$key],
                ),
            );
    }

    <<DataProvider('provideServerVariables')>>
    public function testServerVariables(mixed $in, mixed $out): void {
        expect($in)->toBeSame($out);
    }
}
