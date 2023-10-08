// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalenderListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<DateTime> get dateList => throw _privateConstructorUsedError;
  DateTime get selectDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalenderListStateCopyWith<CalenderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderListStateCopyWith<$Res> {
  factory $CalenderListStateCopyWith(
          CalenderListState value, $Res Function(CalenderListState) then) =
      _$CalenderListStateCopyWithImpl<$Res, CalenderListState>;
  @useResult
  $Res call({bool isLoading, List<DateTime> dateList, DateTime selectDate});
}

/// @nodoc
class _$CalenderListStateCopyWithImpl<$Res, $Val extends CalenderListState>
    implements $CalenderListStateCopyWith<$Res> {
  _$CalenderListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? dateList = null,
    Object? selectDate = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dateList: null == dateList
          ? _value.dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      selectDate: null == selectDate
          ? _value.selectDate
          : selectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalenderListStateCopyWith<$Res>
    implements $CalenderListStateCopyWith<$Res> {
  factory _$$_CalenderListStateCopyWith(_$_CalenderListState value,
          $Res Function(_$_CalenderListState) then) =
      __$$_CalenderListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<DateTime> dateList, DateTime selectDate});
}

/// @nodoc
class __$$_CalenderListStateCopyWithImpl<$Res>
    extends _$CalenderListStateCopyWithImpl<$Res, _$_CalenderListState>
    implements _$$_CalenderListStateCopyWith<$Res> {
  __$$_CalenderListStateCopyWithImpl(
      _$_CalenderListState _value, $Res Function(_$_CalenderListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? dateList = null,
    Object? selectDate = null,
  }) {
    return _then(_$_CalenderListState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      dateList: null == dateList
          ? _value._dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      selectDate: null == selectDate
          ? _value.selectDate
          : selectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_CalenderListState extends _CalenderListState
    with DiagnosticableTreeMixin {
  const _$_CalenderListState(
      {this.isLoading = false,
      final List<DateTime> dateList = const [],
      required this.selectDate})
      : _dateList = dateList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<DateTime> _dateList;
  @override
  @JsonKey()
  List<DateTime> get dateList {
    if (_dateList is EqualUnmodifiableListView) return _dateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateList);
  }

  @override
  final DateTime selectDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalenderListState(isLoading: $isLoading, dateList: $dateList, selectDate: $selectDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalenderListState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('dateList', dateList))
      ..add(DiagnosticsProperty('selectDate', selectDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalenderListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._dateList, _dateList) &&
            (identical(other.selectDate, selectDate) ||
                other.selectDate == selectDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_dateList), selectDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalenderListStateCopyWith<_$_CalenderListState> get copyWith =>
      __$$_CalenderListStateCopyWithImpl<_$_CalenderListState>(
          this, _$identity);
}

abstract class _CalenderListState extends CalenderListState {
  const factory _CalenderListState(
      {final bool isLoading,
      final List<DateTime> dateList,
      required final DateTime selectDate}) = _$_CalenderListState;
  const _CalenderListState._() : super._();

  @override
  bool get isLoading;
  @override
  List<DateTime> get dateList;
  @override
  DateTime get selectDate;
  @override
  @JsonKey(ignore: true)
  _$$_CalenderListStateCopyWith<_$_CalenderListState> get copyWith =>
      throw _privateConstructorUsedError;
}
