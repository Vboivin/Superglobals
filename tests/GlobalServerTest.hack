use type Superglobals\Server;
use namespace HH\Lib\Vec;
use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class GlobalServerTest extends HackTest {
    public function provideServerVariables(): vec<(mixed, mixed)> {
        $unsafeServer = Server::_UNSAFE() as ?dict<_, _>;
        $server = new Server();
        return Vec\map(
            (new \ReflectionClass(Server::class))->getProperties(),
            ($property) ==> tuple(
                $unsafeServer[$property->getName()] ?? null,
                $property->getValue($server),
            ),
        );
    }

    <<DataProvider('provideServerVariables')>>
    public function testServerVariables(mixed $in, mixed $out): void {
        expect($in)->toBeSame($out);
    }
}
