// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentItemHash() => r'd2eeab1ac3d7862fdaadaf37d102bbaaea4c3ca4';

/// See also [currentItem].
@ProviderFor(currentItem)
final currentItemProvider = AutoDisposeProvider<Item>.internal(
  currentItem,
  name: r'currentItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentItemHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef CurrentItemRef = AutoDisposeProviderRef<Item>;
String _$bargenItemHash() => r'a5b0ce6502761e77261faa51f594e7d6093bd6cf';

/// See also [bargenItem].
@ProviderFor(bargenItem)
final bargenItemProvider = AutoDisposeProvider<Item>.internal(
  bargenItem,
  name: r'bargenItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bargenItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BargenItemRef = AutoDisposeProviderRef<Item>;
String _$rootHash() => r'1cd85d73316aad02169ff0f5e7af5cf1423410ff';

/// See also [root].
@ProviderFor(root)
final rootProvider = AutoDisposeProvider<int>.internal(
  root,
  name: r'rootProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rootHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RootRef = AutoDisposeProviderRef<int>;
String _$scopedHash() => r'bbf25968b1186d2dd63d10545364453712d491cf';

/// See also [scoped].
@ProviderFor(scoped)
final scopedProvider = AutoDisposeProvider<int>.internal(
  scoped,
  name: r'scopedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$scopedHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ScopedRef = AutoDisposeProviderRef<int>;
String _$example1Hash() => r'b7682e52c869aeaf5a51c8b186fa1e194750ebfb';

/// See also [example1].
@ProviderFor(example1)
final example1Provider = AutoDisposeProvider<int>.internal(
  example1,
  name: r'example1Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example1Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef Example1Ref = AutoDisposeProviderRef<int>;
String _$example2Hash() => r'a5651cf43300b11b3e75d5e39a3ce640d94c9beb';

/// See also [example2].
@ProviderFor(example2)
final example2Provider = AutoDisposeProvider<int>.internal(
  example2,
  name: r'example2Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example2Hash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef Example2Ref = AutoDisposeProviderRef<int>;
String _$example3Hash() => r'ab11c67bde5a8208cae84d954970bdf54d39093a';

/// See also [example3].
@ProviderFor(example3)
final example3Provider = AutoDisposeProvider<int>.internal(
  example3,
  name: r'example3Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example3Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef Example3Ref = AutoDisposeProviderRef<int>;
String _$example4Hash() => r'a9aa63cd3c15e496eb83c72b960f14b37bdf3202';

/// See also [example4].
@ProviderFor(example4)
final example4Provider = AutoDisposeProvider<int>.internal(
  example4,
  name: r'example4Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example4Hash,
  dependencies: <ProviderOrFamily>[scopedProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    scopedProvider,
    ...?scopedProvider.allTransitiveDependencies
  },
);

typedef Example4Ref = AutoDisposeProviderRef<int>;
String _$example5Hash() => r'd393263b65ea4b72fedaf0f25582f97bfb95ab5f';

/// See also [example5].
@ProviderFor(example5)
final example5Provider = AutoDisposeProvider<int>.internal(
  example5,
  name: r'example5Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example5Hash,
  dependencies: <ProviderOrFamily>[scopedProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    scopedProvider,
    ...?scopedProvider.allTransitiveDependencies
  },
);

typedef Example5Ref = AutoDisposeProviderRef<int>;
String _$example6Hash() => r'0355af3d5773d0dd16c279d7a2d61fe4ee4a4818';

/// See also [example6].
@ProviderFor(example6)
final example6Provider = AutoDisposeProvider<int>.internal(
  example6,
  name: r'example6Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example6Hash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef Example6Ref = AutoDisposeProviderRef<int>;
String _$example7Hash() => r'562839821147ecd9f7858303b1f9561c0ef9b78d';

/// See also [example7].
@ProviderFor(example7)
final example7Provider = AutoDisposeProvider<int>.internal(
  example7,
  name: r'example7Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$example7Hash,
  dependencies: <ProviderOrFamily>[rootProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    rootProvider,
    ...?rootProvider.allTransitiveDependencies
  },
);

typedef Example7Ref = AutoDisposeProviderRef<int>;
String _$counterHash() => r'b78bb32ce545806d68648594cd84ffc2898110a8';

/// See also [Counter].
@ProviderFor(Counter)
final counterProvider = AutoDisposeNotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
