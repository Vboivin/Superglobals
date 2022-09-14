namespace TestUtils;
use namespace HH\Lib\{Dict};

function modify_superglobal(
    string $selectedGlobal,
    dict<arraykey, mixed> $newValues,
)[globals]: void {
    \HH\global_set(
        $selectedGlobal,
        Dict\merge(
            $newValues,
            \HH\global_get($selectedGlobal) as ?dict<_, _> ?? dict[],
        ),
    );
}
