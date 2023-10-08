
import 'package:anything_that_i_like/notifier/calender_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 商品画面
class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({
    super.key,
  });

  static const name = 'homePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(calenderProvider.notifier);
    final dateList = ref.watch(calenderProvider.select((value) => value.dateList));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "家計簿",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
          ),
        backgroundColor: Colors.yellow[200],
      ),
      body: _Body(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(calenderProvider.notifier);
    final selectedStrYearMonth = ref.watch(calenderProvider.select((value) => value.selectedStrYearMonth));
    final disableArrowBackIcon = ref.watch(calenderProvider.select((value) => value.disableArrowBackIcon));
    final disableArrowForwardIcon = ref.watch(calenderProvider.select((value) => value.disableArrowForwardIcon));
    return Center(
      child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: disableArrowBackIcon ? null : () => notifier.changeMonth(to: -1),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: disableArrowBackIcon ? Colors.grey[300] : Colors.brown,
                      ),
                    ),
                  Text(
                    selectedStrYearMonth,
                    style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    ),
                  IconButton(
                    onPressed: disableArrowForwardIcon ? null : () => notifier.changeMonth(to: 1),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: disableArrowForwardIcon ? Colors.grey[300] : Colors.brown,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    _OneWeekItems(),
                    _OneWeekItems(),
                    _Summary(),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.fromLTRB(60, 0, 60, 30),
    child: Column(
      children: const [
        SizedBox(
          width: double.infinity,
          child: Text(
            "【 今月の合計 】",
            textAlign: TextAlign.left,
            ),
        ),
        _ItemRow(
          title: "目標",
          memo: "2870円",
          canEdit: false,
        ),
        _ItemRow(
          title: "残り",
          memo: "0円",
          canEdit: false,
        ),
        _ItemRow(
          title: "合計",
          memo: "2870円",
          canEdit: false,
        ),
      ]
    ),
    );
  }
}

class _OneWeekItems extends StatelessWidget {
  const _OneWeekItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "【 6月1日~6月7日 】",
                  textAlign: TextAlign.left,
                  ),
              ),
              ...List.generate(7, (index) => _ItemRow(
                title: "${index +1}日",
                memo: "2870円",
                canEdit: true,
              )
            )
          ]
          ),
        ),
        const Divider(
          thickness: 3,
          indent: 40,
          endIndent: 40,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(60, 0, 60, 30),
          child: Column(
            children: const [
              _ItemRow(
                title: "目標",
                memo: "2870円",
                canEdit: false,
              ),
              _ItemRow(
                title: "残り",
                memo: "0円",
                canEdit: false,
              ),
              _ItemRow(
                title: "合計",
                memo: "2870円",
                canEdit: false,
              ),
            ]
          ),
        ),
      ],
    );
  }
}

class _ItemRow extends ConsumerWidget {
  const _ItemRow({
    super.key,
    required this.title,
    required this.memo,
    required this.canEdit,
  });

  final String title;
  final String memo;
  final bool canEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(calenderProvider.notifier);
    return SizedBox(
    height: 30,
    child: Row(
      children: [
        Text(title),
        const SizedBox(width: 10,),
        Text(memo),
        if (canEdit) 
          Expanded(
            child: IconButton(
              alignment: Alignment.centerRight,
              onPressed: notifier.editMemo, 
              icon: const Icon(
                Icons.edit, 
                color: Colors.brown,
                ),
              ),
            ),
      ],
    ),
                );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  static const navigatonItems = [
    _NavigatorItems(
      text: "ああああ",
      icon: Icons.heart_broken,
    ),
    _NavigatorItems(
      text: "多分ピル",
      icon: Icons.heart_broken,
    ),
    _NavigatorItems(
      text: "家計簿",
      icon: Icons.heart_broken,
    ),
    _NavigatorItems(
      text: "ああああ",
      icon: Icons.heart_broken,
    ),
    _NavigatorItems(
      text: "ああああ",
      icon: Icons.heart_broken,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[200],
      child: SafeArea(
          child: Row(
            children: navigatonItems.map((e) => e).toList(),
        ),
      ),
    );
  }
}

class _NavigatorItems extends StatelessWidget {
  const _NavigatorItems({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Icon(
              icon, 
              color: Colors.brown,
              ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              )
              ),
          ],
        ),
        ),
      );
  }
}