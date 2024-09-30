// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countriesHash() => r'5d96ae074211f2532b0d36951f0b2a61e81e2ddf';

/// See also [countries].
@ProviderFor(countries)
final countriesProvider = AutoDisposeFutureProvider<List<Country>>.internal(
  countries,
  name: r'countriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountriesRef = AutoDisposeFutureProviderRef<List<Country>>;
String _$topicsHash() => r'9b38d79e973e4fdb0c9624c330d783c3dc723079';

/// See also [topics].
@ProviderFor(topics)
final topicsProvider = AutoDisposeFutureProvider<List<Topics>>.internal(
  topics,
  name: r'topicsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$topicsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TopicsRef = AutoDisposeFutureProviderRef<List<Topics>>;
String _$sourcesHash() => r'df282a6eb0800f89d12bce8178e003b35e8cb748';

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

/// See also [sources].
@ProviderFor(sources)
const sourcesProvider = SourcesFamily();

/// See also [sources].
class SourcesFamily extends Family<AsyncValue<Sources>> {
  /// See also [sources].
  const SourcesFamily();

  /// See also [sources].
  SourcesProvider call(
    User user,
  ) {
    return SourcesProvider(
      user,
    );
  }

  @override
  SourcesProvider getProviderOverride(
    covariant SourcesProvider provider,
  ) {
    return call(
      provider.user,
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
  String? get name => r'sourcesProvider';
}

/// See also [sources].
class SourcesProvider extends AutoDisposeFutureProvider<Sources> {
  /// See also [sources].
  SourcesProvider(
    User user,
  ) : this._internal(
          (ref) => sources(
            ref as SourcesRef,
            user,
          ),
          from: sourcesProvider,
          name: r'sourcesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourcesHash,
          dependencies: SourcesFamily._dependencies,
          allTransitiveDependencies: SourcesFamily._allTransitiveDependencies,
          user: user,
        );

  SourcesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final User user;

  @override
  Override overrideWith(
    FutureOr<Sources> Function(SourcesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SourcesProvider._internal(
        (ref) => create(ref as SourcesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Sources> createElement() {
    return _SourcesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SourcesProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SourcesRef on AutoDisposeFutureProviderRef<Sources> {
  /// The parameter `user` of this provider.
  User get user;
}

class _SourcesProviderElement extends AutoDisposeFutureProviderElement<Sources>
    with SourcesRef {
  _SourcesProviderElement(super.provider);

  @override
  User get user => (origin as SourcesProvider).user;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
