// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dummyTaskDtoHash() => r'596bdb2453a53e878f308d165c2324ff6e326cbb';

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

/// See also [dummyTaskDto].
@ProviderFor(dummyTaskDto)
const dummyTaskDtoProvider = DummyTaskDtoFamily();

/// See also [dummyTaskDto].
class DummyTaskDtoFamily extends Family<TaskDto> {
  /// See also [dummyTaskDto].
  const DummyTaskDtoFamily();

  /// See also [dummyTaskDto].
  DummyTaskDtoProvider call(
    int id,
  ) {
    return DummyTaskDtoProvider(
      id,
    );
  }

  @override
  DummyTaskDtoProvider getProviderOverride(
    covariant DummyTaskDtoProvider provider,
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
  String? get name => r'dummyTaskDtoProvider';
}

/// See also [dummyTaskDto].
class DummyTaskDtoProvider extends Provider<TaskDto> {
  /// See also [dummyTaskDto].
  DummyTaskDtoProvider(
    int id,
  ) : this._internal(
          (ref) => dummyTaskDto(
            ref as DummyTaskDtoRef,
            id,
          ),
          from: dummyTaskDtoProvider,
          name: r'dummyTaskDtoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dummyTaskDtoHash,
          dependencies: DummyTaskDtoFamily._dependencies,
          allTransitiveDependencies:
              DummyTaskDtoFamily._allTransitiveDependencies,
          id: id,
        );

  DummyTaskDtoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    TaskDto Function(DummyTaskDtoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DummyTaskDtoProvider._internal(
        (ref) => create(ref as DummyTaskDtoRef),
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
  ProviderElement<TaskDto> createElement() {
    return _DummyTaskDtoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DummyTaskDtoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DummyTaskDtoRef on ProviderRef<TaskDto> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DummyTaskDtoProviderElement extends ProviderElement<TaskDto>
    with DummyTaskDtoRef {
  _DummyTaskDtoProviderElement(super.provider);

  @override
  int get id => (origin as DummyTaskDtoProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
