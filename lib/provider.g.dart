// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonHash() => r'90385b0bf58867a857a7ae264aa023d0b3dfada9';

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

/// See also [pokemon].
@ProviderFor(pokemon)
const pokemonProvider = PokemonFamily();

/// See also [pokemon].
class PokemonFamily extends Family<AsyncValue<List<Pokemon>>> {
  /// See also [pokemon].
  const PokemonFamily();

  /// See also [pokemon].
  PokemonProvider call(
    String? term,
  ) {
    return PokemonProvider(
      term,
    );
  }

  @override
  PokemonProvider getProviderOverride(
    covariant PokemonProvider provider,
  ) {
    return call(
      provider.term,
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
  String? get name => r'pokemonProvider';
}

/// See also [pokemon].
class PokemonProvider extends AutoDisposeFutureProvider<List<Pokemon>> {
  /// See also [pokemon].
  PokemonProvider(
    String? term,
  ) : this._internal(
          (ref) => pokemon(
            ref as PokemonRef,
            term,
          ),
          from: pokemonProvider,
          name: r'pokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonHash,
          dependencies: PokemonFamily._dependencies,
          allTransitiveDependencies: PokemonFamily._allTransitiveDependencies,
          term: term,
        );

  PokemonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.term,
  }) : super.internal();

  final String? term;

  @override
  Override overrideWith(
    FutureOr<List<Pokemon>> Function(PokemonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonProvider._internal(
        (ref) => create(ref as PokemonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        term: term,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Pokemon>> createElement() {
    return _PokemonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonProvider && other.term == term;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, term.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PokemonRef on AutoDisposeFutureProviderRef<List<Pokemon>> {
  /// The parameter `term` of this provider.
  String? get term;
}

class _PokemonProviderElement
    extends AutoDisposeFutureProviderElement<List<Pokemon>> with PokemonRef {
  _PokemonProviderElement(super.provider);

  @override
  String? get term => (origin as PokemonProvider).term;
}

String _$pokemonByIdHash() => r'48744779ea3eb1d37acb5b850a97c49c8d31db12';

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

String _$evolutionChainHash() => r'3924e47f35c692ce516c2cfea7915c58731e89d3';

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

String _$typeHash() => r'2204a202902ed3604c8e2dce81b908636b95ec83';

/// See also [type].
@ProviderFor(type)
const typeProvider = TypeFamily();

/// See also [type].
class TypeFamily extends Family<AsyncValue<PokemonType?>> {
  /// See also [type].
  const TypeFamily();

  /// See also [type].
  TypeProvider call(
    String pokemonId,
  ) {
    return TypeProvider(
      pokemonId,
    );
  }

  @override
  TypeProvider getProviderOverride(
    covariant TypeProvider provider,
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
  String? get name => r'typeProvider';
}

/// See also [type].
class TypeProvider extends AutoDisposeFutureProvider<PokemonType?> {
  /// See also [type].
  TypeProvider(
    String pokemonId,
  ) : this._internal(
          (ref) => type(
            ref as TypeRef,
            pokemonId,
          ),
          from: typeProvider,
          name: r'typeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$typeHash,
          dependencies: TypeFamily._dependencies,
          allTransitiveDependencies: TypeFamily._allTransitiveDependencies,
          pokemonId: pokemonId,
        );

  TypeProvider._internal(
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
    FutureOr<PokemonType?> Function(TypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TypeProvider._internal(
        (ref) => create(ref as TypeRef),
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
  AutoDisposeFutureProviderElement<PokemonType?> createElement() {
    return _TypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TypeProvider && other.pokemonId == pokemonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TypeRef on AutoDisposeFutureProviderRef<PokemonType?> {
  /// The parameter `pokemonId` of this provider.
  String get pokemonId;
}

class _TypeProviderElement
    extends AutoDisposeFutureProviderElement<PokemonType?> with TypeRef {
  _TypeProviderElement(super.provider);

  @override
  String get pokemonId => (origin as TypeProvider).pokemonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
