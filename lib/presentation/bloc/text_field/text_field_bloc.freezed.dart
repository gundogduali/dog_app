// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_field_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextFieldEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool focus) focusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool focus)? focusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool focus)? focusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FocusChanged value) focusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FocusChanged value)? focusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FocusChanged value)? focusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldEventCopyWith<$Res> {
  factory $TextFieldEventCopyWith(
          TextFieldEvent value, $Res Function(TextFieldEvent) then) =
      _$TextFieldEventCopyWithImpl<$Res, TextFieldEvent>;
}

/// @nodoc
class _$TextFieldEventCopyWithImpl<$Res, $Val extends TextFieldEvent>
    implements $TextFieldEventCopyWith<$Res> {
  _$TextFieldEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TextFieldEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TextFieldEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool focus) focusChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool focus)? focusChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool focus)? focusChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FocusChanged value) focusChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FocusChanged value)? focusChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FocusChanged value)? focusChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TextFieldEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FocusChangedImplCopyWith<$Res> {
  factory _$$FocusChangedImplCopyWith(
          _$FocusChangedImpl value, $Res Function(_$FocusChangedImpl) then) =
      __$$FocusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool focus});
}

/// @nodoc
class __$$FocusChangedImplCopyWithImpl<$Res>
    extends _$TextFieldEventCopyWithImpl<$Res, _$FocusChangedImpl>
    implements _$$FocusChangedImplCopyWith<$Res> {
  __$$FocusChangedImplCopyWithImpl(
      _$FocusChangedImpl _value, $Res Function(_$FocusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focus = null,
  }) {
    return _then(_$FocusChangedImpl(
      focus: null == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FocusChangedImpl implements _FocusChanged {
  const _$FocusChangedImpl({required this.focus});

  @override
  final bool focus;

  @override
  String toString() {
    return 'TextFieldEvent.focusChanged(focus: $focus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusChangedImpl &&
            (identical(other.focus, focus) || other.focus == focus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusChangedImplCopyWith<_$FocusChangedImpl> get copyWith =>
      __$$FocusChangedImplCopyWithImpl<_$FocusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool focus) focusChanged,
  }) {
    return focusChanged(focus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool focus)? focusChanged,
  }) {
    return focusChanged?.call(focus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool focus)? focusChanged,
    required TResult orElse(),
  }) {
    if (focusChanged != null) {
      return focusChanged(focus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FocusChanged value) focusChanged,
  }) {
    return focusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FocusChanged value)? focusChanged,
  }) {
    return focusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FocusChanged value)? focusChanged,
    required TResult orElse(),
  }) {
    if (focusChanged != null) {
      return focusChanged(this);
    }
    return orElse();
  }
}

abstract class _FocusChanged implements TextFieldEvent {
  const factory _FocusChanged({required final bool focus}) = _$FocusChangedImpl;

  bool get focus;
  @JsonKey(ignore: true)
  _$$FocusChangedImplCopyWith<_$FocusChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TextFieldState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() focused,
    required TResult Function() unfocused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? focused,
    TResult? Function()? unfocused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? focused,
    TResult Function()? unfocused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Focused value) focused,
    required TResult Function(_Unfocused value) unfocused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Focused value)? focused,
    TResult? Function(_Unfocused value)? unfocused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Focused value)? focused,
    TResult Function(_Unfocused value)? unfocused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldStateCopyWith<$Res> {
  factory $TextFieldStateCopyWith(
          TextFieldState value, $Res Function(TextFieldState) then) =
      _$TextFieldStateCopyWithImpl<$Res, TextFieldState>;
}

/// @nodoc
class _$TextFieldStateCopyWithImpl<$Res, $Val extends TextFieldState>
    implements $TextFieldStateCopyWith<$Res> {
  _$TextFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FocusedImplCopyWith<$Res> {
  factory _$$FocusedImplCopyWith(
          _$FocusedImpl value, $Res Function(_$FocusedImpl) then) =
      __$$FocusedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FocusedImplCopyWithImpl<$Res>
    extends _$TextFieldStateCopyWithImpl<$Res, _$FocusedImpl>
    implements _$$FocusedImplCopyWith<$Res> {
  __$$FocusedImplCopyWithImpl(
      _$FocusedImpl _value, $Res Function(_$FocusedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FocusedImpl implements _Focused {
  const _$FocusedImpl();

  @override
  String toString() {
    return 'TextFieldState.focused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FocusedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() focused,
    required TResult Function() unfocused,
  }) {
    return focused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? focused,
    TResult? Function()? unfocused,
  }) {
    return focused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? focused,
    TResult Function()? unfocused,
    required TResult orElse(),
  }) {
    if (focused != null) {
      return focused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Focused value) focused,
    required TResult Function(_Unfocused value) unfocused,
  }) {
    return focused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Focused value)? focused,
    TResult? Function(_Unfocused value)? unfocused,
  }) {
    return focused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Focused value)? focused,
    TResult Function(_Unfocused value)? unfocused,
    required TResult orElse(),
  }) {
    if (focused != null) {
      return focused(this);
    }
    return orElse();
  }
}

abstract class _Focused implements TextFieldState {
  const factory _Focused() = _$FocusedImpl;
}

/// @nodoc
abstract class _$$UnfocusedImplCopyWith<$Res> {
  factory _$$UnfocusedImplCopyWith(
          _$UnfocusedImpl value, $Res Function(_$UnfocusedImpl) then) =
      __$$UnfocusedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnfocusedImplCopyWithImpl<$Res>
    extends _$TextFieldStateCopyWithImpl<$Res, _$UnfocusedImpl>
    implements _$$UnfocusedImplCopyWith<$Res> {
  __$$UnfocusedImplCopyWithImpl(
      _$UnfocusedImpl _value, $Res Function(_$UnfocusedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnfocusedImpl implements _Unfocused {
  const _$UnfocusedImpl();

  @override
  String toString() {
    return 'TextFieldState.unfocused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnfocusedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() focused,
    required TResult Function() unfocused,
  }) {
    return unfocused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? focused,
    TResult? Function()? unfocused,
  }) {
    return unfocused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? focused,
    TResult Function()? unfocused,
    required TResult orElse(),
  }) {
    if (unfocused != null) {
      return unfocused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Focused value) focused,
    required TResult Function(_Unfocused value) unfocused,
  }) {
    return unfocused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Focused value)? focused,
    TResult? Function(_Unfocused value)? unfocused,
  }) {
    return unfocused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Focused value)? focused,
    TResult Function(_Unfocused value)? unfocused,
    required TResult orElse(),
  }) {
    if (unfocused != null) {
      return unfocused(this);
    }
    return orElse();
  }
}

abstract class _Unfocused implements TextFieldState {
  const factory _Unfocused() = _$UnfocusedImpl;
}
