namespace TestUtils;
use namespace HH\Lib\{Dict};

function global_test_teardown(
    string $selectedGlobal,
    string $globalPlaceholder,
)[globals]: void {
    \HH\global_set($selectedGlobal, \HH\global_get($globalPlaceholder));
}

function global_test_setup(
    string $selectedGlobal,
    string $globalPlaceholder,
)[globals]: void {
    \HH\global_set($globalPlaceholder, \HH\global_get($selectedGlobal));
}

function modify_global_dict(
    string $selectedGlobal,
    dict<arraykey, mixed> $newValues,
)[globals]: void {
    \HH\global_set(
        $selectedGlobal,
        Dict\merge($newValues, \HH\global_get($selectedGlobal) as dict<_, _>),
    );
}

function get_provider_single_arg(): vec<(arraykey, mixed)> {
    return vec[
        tuple('foo', 'bar'),
        tuple(1, 2),
        tuple('1', '2'),
        tuple('null', null),
        tuple('+_#@!', 0),
        tuple(0, 'woops'),
        tuple('float', 1.0),
        tuple('bool', false),
        tuple('&', 0),
        tuple('Robert\');DROP TABLE PROD;', 'woops'),
    ];
}

function get_provider_multiple_args(): vec<vec<(arraykey, mixed)>> {
    return vec[
        vec[tuple('foo', 'bar'), tuple(1, 2)],
        vec[tuple('1', '2'), tuple(1, 2)],
        vec[tuple('null', null), tuple(0, 'woops'), tuple('bool', false)],
        vec[],
        vec[
            tuple('foo', 'bar'),
            tuple('1', '2'),
            tuple('float', 1.0),
            tuple('&', 0),
            tuple(123, 124),
        ],
    ];
}
