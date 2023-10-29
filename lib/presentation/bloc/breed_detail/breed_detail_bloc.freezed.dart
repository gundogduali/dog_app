// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BreedDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Generate value) generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Generate value)? generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Generate value)? generate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedDetailEventCopyWith<$Res> {
  factory $BreedDetailEventCopyWith(
          BreedDetailEvent value, $Res Function(BreedDetailEvent) then) =
      _$BreedDetailEventCopyWithImpl<$Res, BreedDetailEvent>;
}

/// @nodoc
class _$BreedDetailEventCopyWithImpl<$Res, $Val extends BreedDetailEvent>
    implements $BreedDetailEventCopyWith<$Res> {
  _$BreedDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GenerateImplCopyWith<$Res> {
  factory _$$GenerateImplCopyWith(
          _$GenerateImpl value, $Res Function(_$GenerateImpl) then) =
      __$$GenerateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerateImplCopyWithImpl<$Res>
    extends _$BreedDetailEventCopyWithImpl<$Res, _$GenerateImpl>
    implements _$$GenerateImplCopyWith<$Res> {
  __$$GenerateImplCopyWithImpl(
      _$GenerateImpl _value, $Res Function(_$GenerateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenerateImpl implements _Generate {
  const _$GenerateImpl();

  @override
  String toString() {
    return 'BreedDetailEvent.generate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenerateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generate,
  }) {
    return generate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? generate,
  }) {
    return generate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generate,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Generate value) generate,
  }) {
    return generate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Generate value)? generate,
  }) {
    return generate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Generate value)? generate,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate(this);
    }
    return orElse();
  }
}

abstract class _Generate implements BreedDetailEvent {
  const factory _Generate() = _$GenerateImpl;
}

/// @nodoc
mixin _$BreedDetailState {
  BreedModel get breed => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BreedDetailStateCopyWith<BreedDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedDetailStateCopyWith<$Res> {
  factory $BreedDetailStateCopyWith(
          BreedDetailState value, $Res Function(BreedDetailState) then) =
      _$BreedDetailStateCopyWithImpl<$Res, BreedDetailState>;
  @useResult
  $Res call({BreedModel breed, bool isLoading, String imageUrl});
}

/// @nodoc
class _$BreedDetailStateCopyWithImpl<$Res, $Val extends BreedDetailState>
    implements $BreedDetailStateCopyWith<$Res> {
  _$BreedDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? isLoading = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as BreedModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreedDetailStateImplCopyWith<$Res>
    implements $BreedDetailStateCopyWith<$Res> {
  factory _$$BreedDetailStateImplCopyWith(_$BreedDetailStateImpl value,
          $Res Function(_$BreedDetailStateImpl) then) =
      __$$BreedDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BreedModel breed, bool isLoading, String imageUrl});
}

/// @nodoc
class __$$BreedDetailStateImplCopyWithImpl<$Res>
    extends _$BreedDetailStateCopyWithImpl<$Res, _$BreedDetailStateImpl>
    implements _$$BreedDetailStateImplCopyWith<$Res> {
  __$$BreedDetailStateImplCopyWithImpl(_$BreedDetailStateImpl _value,
      $Res Function(_$BreedDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? isLoading = null,
    Object? imageUrl = null,
  }) {
    return _then(_$BreedDetailStateImpl(
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as BreedModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BreedDetailStateImpl implements _BreedDetailState {
  const _$BreedDetailStateImpl(
      {required this.breed, required this.isLoading, required this.imageUrl});

  @override
  final BreedModel breed;
  @override
  final bool isLoading;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'BreedDetailState(breed: $breed, isLoading: $isLoading, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedDetailStateImpl &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, breed, isLoading, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedDetailStateImplCopyWith<_$BreedDetailStateImpl> get copyWith =>
      __$$BreedDetailStateImplCopyWithImpl<_$BreedDetailStateImpl>(
          this, _$identity);
}

abstract class _BreedDetailState implements BreedDetailState {
  const factory _BreedDetailState(
      {required final BreedModel breed,
      required final bool isLoading,
      required final String imageUrl}) = _$BreedDetailStateImpl;

  @override
  BreedModel get breed;
  @override
  bool get isLoading;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$BreedDetailStateImplCopyWith<_$BreedDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
