import 'package:anything_that_i_like/common/router.dart';
import 'package:anything_that_i_like/notifier/calender_notifier.dart';
import 'package:anything_that_i_like/state/calender_list_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart'; 

class ResistDialog extends ConsumerWidget {
  const ResistDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(calenderProvider.notifier);
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("【2023年6月28日】"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '出費額'
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'メモ',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                      color: Colors.amber,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                      color: Colors.amber,
                      )
                    ),
                  ),
                  autofocus: true,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[200],
                ),
                onPressed: () {
                  notifier.resisterAmount();
                  Navigator.pop(context);
                },
                child: const Text('保存', 
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}