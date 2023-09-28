import 'package:anything_that_i_like/common/router.dart';
import 'package:anything_that_i_like/screen/resistModal.dart';
import 'package:anything_that_i_like/state/calender_list_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart'; 

final calenderProvider = StateNotifierProvider.autoDispose<CalenderStateNotifier, CalenderListState>((ref) => CalenderStateNotifier(ref));

class CalenderStateNotifier extends StateNotifier<CalenderListState> {
  CalenderStateNotifier(
    this._ref
  ): super(const CalenderListState());

  final Ref _ref;
  NavigatorState get _navigator =>
    _ref.read(navigatorKeyProvider).currentState!;

  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
    
  void calenderList(int currentYear, int currentMonth) {
    final endOfMonth = DateTime(2023, currentMonth+1, 0).day;
    final monthDateList = List.generate(endOfMonth, (index) => index + 1)
    .map((date) {
      return DateTime(currentYear, currentMonth, date);
    }).toList();
    state = state.copyWith(dateList: monthDateList);
    final dateFormatForDayOfWeek = DateFormat.EEEE('ja');
    print(monthDateList.map((a) => dateFormatForDayOfWeek.format(a)));
  }

  void editMemo() async {
    await showDialog(
    context: _navigator.context,
    builder: (context) => const Dialog(
      child: Card(
        child: ResistDialog(),
      ),
    )
  );
  }

  void resisterAmount() async {
    print("ここ");
    await _firestore.collection("usageAmount").doc("BYbMGRkGPldRswU5nd8Q").set(<String, dynamic>{
      'amount': 100,
      'memo': "aa",
      'date': DateTime.now(),
    });
    print("これ");
  }
}
