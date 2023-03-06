// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grid_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GridListPropsTearOff {
  const _$GridListPropsTearOff();

  GridItems listOf(List<GridListItemProps> value) {
    return GridItems(
      value,
    );
  }

  InProgress inProgress() {
    return const InProgress();
  }

  Failed failed(String message) {
    return Failed(
      message,
    );
  }
}

/// @nodoc
const $GridListProps = _$GridListPropsTearOff();

/// @nodoc
mixin _$GridListProps {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GridListItemProps> value) listOf,
    required TResult Function() inProgress,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GridItems value) listOf,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridListPropsCopyWith<$Res> {
  factory $GridListPropsCopyWith(
          GridListProps value, $Res Function(GridListProps) then) =
      _$GridListPropsCopyWithImpl<$Res>;
}

/// @nodoc
class _$GridListPropsCopyWithImpl<$Res>
    implements $GridListPropsCopyWith<$Res> {
  _$GridListPropsCopyWithImpl(this._value, this._then);

  final GridListProps _value;
  // ignore: unused_field
  final $Res Function(GridListProps) _then;
}

/// @nodoc
abstract class $GridItemsCopyWith<$Res> {
  factory $GridItemsCopyWith(GridItems value, $Res Function(GridItems) then) =
      _$GridItemsCopyWithImpl<$Res>;
  $Res call({List<GridListItemProps> value});
}

/// @nodoc
class _$GridItemsCopyWithImpl<$Res> extends _$GridListPropsCopyWithImpl<$Res>
    implements $GridItemsCopyWith<$Res> {
  _$GridItemsCopyWithImpl(GridItems _value, $Res Function(GridItems) _then)
      : super(_value, (v) => _then(v as GridItems));

  @override
  GridItems get _value => super._value as GridItems;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(GridItems(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<GridListItemProps>,
    ));
  }
}

/// @nodoc

class _$GridItems implements GridItems {
  const _$GridItems(this.value);

  @override
  final List<GridListItemProps> value;

  @override
  String toString() {
    return 'GridListProps.listOf(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GridItems &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $GridItemsCopyWith<GridItems> get copyWith =>
      _$GridItemsCopyWithImpl<GridItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GridListItemProps> value) listOf,
    required TResult Function() inProgress,
    required TResult Function(String message) failed,
  }) {
    return listOf(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
  }) {
    return listOf?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (listOf != null) {
      return listOf(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GridItems value) listOf,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Failed value) failed,
  }) {
    return listOf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
  }) {
    return listOf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (listOf != null) {
      return listOf(this);
    }
    return orElse();
  }
}

abstract class GridItems implements GridListProps {
  const factory GridItems(List<GridListItemProps> value) = _$GridItems;

  List<GridListItemProps> get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GridItemsCopyWith<GridItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InProgressCopyWith<$Res> {
  factory $InProgressCopyWith(
          InProgress value, $Res Function(InProgress) then) =
      _$InProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$InProgressCopyWithImpl<$Res> extends _$GridListPropsCopyWithImpl<$Res>
    implements $InProgressCopyWith<$Res> {
  _$InProgressCopyWithImpl(InProgress _value, $Res Function(InProgress) _then)
      : super(_value, (v) => _then(v as InProgress));

  @override
  InProgress get _value => super._value as InProgress;
}

/// @nodoc

class _$InProgress implements InProgress {
  const _$InProgress();

  @override
  String toString() {
    return 'GridListProps.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GridListItemProps> value) listOf,
    required TResult Function() inProgress,
    required TResult Function(String message) failed,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GridItems value) listOf,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Failed value) failed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgress implements GridListProps {
  const factory InProgress() = _$InProgress;
}

/// @nodoc
abstract class $FailedCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) then) =
      _$FailedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$FailedCopyWithImpl<$Res> extends _$GridListPropsCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(Failed _value, $Res Function(Failed) _then)
      : super(_value, (v) => _then(v as Failed));

  @override
  Failed get _value => super._value as Failed;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Failed(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Failed implements Failed {
  const _$Failed(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GridListProps.failed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failed &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $FailedCopyWith<Failed> get copyWith =>
      _$FailedCopyWithImpl<Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GridListItemProps> value) listOf,
    required TResult Function() inProgress,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GridListItemProps> value)? listOf,
    TResult Function()? inProgress,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GridItems value) listOf,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GridItems value)? listOf,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed implements GridListProps {
  const factory Failed(String message) = _$Failed;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailedCopyWith<Failed> get copyWith => throw _privateConstructorUsedError;
}
