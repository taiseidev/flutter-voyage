// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPostUsecaseHash() => r'6830363c7ea37a3b97cbd71ef57c22852f1e3d02';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getPostUsecase].
@ProviderFor(getPostUsecase)
const getPostUsecaseProvider = GetPostUsecaseFamily();

/// See also [getPostUsecase].
class GetPostUsecaseFamily extends Family<AsyncValue<Post>> {
  /// See also [getPostUsecase].
  const GetPostUsecaseFamily();

  /// See also [getPostUsecase].
  GetPostUsecaseProvider call(
    String postId,
  ) {
    return GetPostUsecaseProvider(
      postId,
    );
  }

  @override
  GetPostUsecaseProvider getProviderOverride(
    covariant GetPostUsecaseProvider provider,
  ) {
    return call(
      provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPostUsecaseProvider';
}

/// See also [getPostUsecase].
class GetPostUsecaseProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [getPostUsecase].
  GetPostUsecaseProvider(
    String postId,
  ) : this._internal(
          (ref) => getPostUsecase(
            ref as GetPostUsecaseRef,
            postId,
          ),
          from: getPostUsecaseProvider,
          name: r'getPostUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPostUsecaseHash,
          dependencies: GetPostUsecaseFamily._dependencies,
          allTransitiveDependencies:
              GetPostUsecaseFamily._allTransitiveDependencies,
          postId: postId,
        );

  GetPostUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    FutureOr<Post> Function(GetPostUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPostUsecaseProvider._internal(
        (ref) => create(ref as GetPostUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post> createElement() {
    return _GetPostUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPostUsecaseProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPostUsecaseRef on AutoDisposeFutureProviderRef<Post> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _GetPostUsecaseProviderElement
    extends AutoDisposeFutureProviderElement<Post> with GetPostUsecaseRef {
  _GetPostUsecaseProviderElement(super.provider);

  @override
  String get postId => (origin as GetPostUsecaseProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
