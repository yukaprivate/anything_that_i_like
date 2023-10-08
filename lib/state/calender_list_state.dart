// ignore: unused_import
import 'package:anything_that_i_like/common/util/date_util.dart';
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
   required DateTime selectDate,
  }) = _CalenderListState;

  String get selectedStrYearMonth {
    return formatToStrYearMonth(selectDate);
  }

  bool get disableArrowBackIcon {
    final now = DateTime.now();
    return selectDate.isAtSameMomentAs(DateTime(now.year, now.month - 12));
  }
  
  bool get disableArrowForwardIcon {
    final now = DateTime.now();
    return selectDate.isAtSameMomentAs(DateTime(now.year, now.month + 12));
  }
}