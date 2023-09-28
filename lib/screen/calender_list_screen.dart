
import 'package:anything_that_i_like/common/router.dart';
import 'package:anything_that_i_like/notifier/calender_notifier.dart';
import 'package:anything_that_i_like/screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

/// 商品画面
class CalenderListScreen extends ConsumerWidget {
  const CalenderListScreen({
    super.key,
  });

  static const name = 'calenderList';

  @override
  Widget build(BuildContext cx, WidgetRef ref) {
    final notifier = ref.watch(calenderProvider.notifier);
    final dateList = ref.watch(calenderProvider.select((value) => value.dateList));
    final dateFormatForDayOfWeek = DateFormat.EEEE('ja');
    final _deviceWidth = MediaQuery.of(cx).size.width;
    final _deviceHeight = MediaQuery.of(cx).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("こんにちは"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    notifier.calenderList(2023, 5);
                    // cx.goNamed(HomePageScreen.name);
                  }, 
                  child: const Text("<"),
                ),
                TextButton(
                  onPressed: () {
                    notifier.calenderList(2023, 5);
                    // cx.goNamed(HomePageScreen.name);
                  }, 
                  child: const Text("ボタンです"),
                ),
                TextButton(
                  onPressed: () {
                    notifier.calenderList(2023, 5);
                    // cx.goNamed(HomePageScreen.name);
                  }, 
                  child: const Text(">"),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              width: _deviceWidth * 0.8,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(95, 112, 112, 112)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: dateList.length,
                itemBuilder: (BuildContext context, int index) {
                  final a = dateFormatForDayOfWeek.format(dateList[index]);
                return Container(
                   decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 72, 72, 72), //枠線の色
                        width: 0.1, //枠線の太さ
                      ),
                    ),
                  ),
                  height: 30,
                  child: Row(
                    children: [
                      Text(a),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}