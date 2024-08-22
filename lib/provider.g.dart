// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonHash() => r'f33ab6a681d510c060ad5c556bd0604ad6e69327';

/// See also [pokemon].
@ProviderFor(pokemon)
final pokemonProvider = AutoDisposeFutureProvider<List<Pokemon>>.internal(
  pokemon,
  name: r'pokemonProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pokemonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonRef = AutoDisposeFutureProviderRef<List<Pokemon>>;
String _$pokemonByIdHash() => r'976b5e66840eed47256ee5d21137a6cbb3be3b0e';

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

/// See also [pokemonById].
@ProviderFor(pokemonById)
const pokemonByIdProvider = PokemonByIdFamily();

/// See also [pokemonById].
class PokemonByIdFamily extends Family<AsyncValue<Pokemon?>> {
  /// See also [pokemonById].
  const PokemonByIdFamily();

  /// See also [pokemonById].
  PokemonByIdProvider call(
    String id,
  ) {
    return PokemonByIdProvider(
      id,
    );
  }

  @override
  PokemonByIdProvider getProviderOverride(
    covariant PokemonByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'pokemonByIdProvider';
}

/// See also [pokemonById].
class PokemonByIdProvider extends AutoDisposeFutureProvider<Pokemon?> {
  /// See also [pokemonById].
  PokemonByIdProvider(
    String id,
  ) : this._internal(
          (ref) => pokemonById(
            ref as PokemonByIdRef,
            id,
          ),
          from: pokemonByIdProvider,
          name: r'pokemonByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonByIdHash,
          dependencies: PokemonByIdFamily._dependencies,
          allTransitiveDependencies:
              PokemonByIdFamily._allTransitiveDependencies,
          id: id,
        );

  PokemonByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Pokemon?> Function(PokemonByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonByIdProvider._internal(
        (ref) => create(ref as PokemonByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Pokemon?> createElement() {
    return _PokemonByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PokemonByIdRef on AutoDisposeFutureProviderRef<Pokemon?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PokemonByIdProviderElement
    extends AutoDisposeFutureProviderElement<Pokemon?> with PokemonByIdRef {
  _PokemonByIdProviderElement(super.provider);

  @override
  String get id => (origin as PokemonByIdProvider).id;
}

String _$evolutionChainHash() => r'008a287bfd6144311b1f33f47ca5849c56e7c106';

/// See also [evolutionChain].
@ProviderFor(evolutionChain)
const evolutionChainProvider = EvolutionChainFamily();

/// See also [evolutionChain].
class EvolutionChainFamily extends Family<AsyncValue<EvolutionChain?>> {
  /// See also [evolutionChain].
  const EvolutionChainFamily();

  /// See also [evolutionChain].
  EvolutionChainProvider call(
    String pokemonId,
  ) {
    return EvolutionChainProvider(
      pokemonId,
    );
  }

  @override
  EvolutionChainProvider getProviderOverride(
    covariant EvolutionChainProvider provider,
  ) {
    return call(
      provider.pokemonId,
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
  String? get name => r'evolutionChainProvider';
}

/// See also [evolutionChain].
class EvolutionChainProvider
    extends AutoDisposeFutureProvider<EvolutionChain?> {
  /// See also [evolutionChain].
  EvolutionChainProvider(
    String pokemonId,
  ) : this._internal(
          (ref) => evolutionChain(
            ref as EvolutionChainRef,
            pokemonId,
          ),
          from: evolutionChainProvider,
          name: r'evolutionChainProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$evolutionChainHash,
          dependencies: EvolutionChainFamily._dependencies,
          allTransitiveDependencies:
              EvolutionChainFamily._allTransitiveDependencies,
          pokemonId: pokemonId,
        );

  EvolutionChainProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonId,
  }) : super.internal();

  final String pokemonId;

  @override
  Override overrideWith(
    FutureOr<EvolutionChain?> Function(EvolutionChainRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EvolutionChainProvider._internal(
        (ref) => create(ref as EvolutionChainRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonId: pokemonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EvolutionChain?> createElement() {
    return _EvolutionChainProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EvolutionChainProvider && other.pokemonId == pokemonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EvolutionChainRef on AutoDisposeFutureProviderRef<EvolutionChain?> {
  /// The parameter `pokemonId` of this provider.
  String get pokemonId;
}

class _EvolutionChainProviderElement
    extends AutoDisposeFutureProviderElement<EvolutionChain?>
    with EvolutionChainRef {
  _EvolutionChainProviderElement(super.provider);

  @override
  String get pokemonId => (origin as EvolutionChainProvider).pokemonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
