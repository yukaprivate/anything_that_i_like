// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calender_list_state.freezed.dart';

@freezed
class CalenderListState with _$CalenderListState {
  // ignore: unused_element
  const CalenderListState._();

  const factory CalenderListState({
   @Default(false) bool isLoading,
   @Default([]) List<DateTime> dateList,
  }) = _CalenderListState;
}