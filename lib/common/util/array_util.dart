List<int> range({required int start, required int end}) {
  final list = <int>[];
  for (var i = start; i <= end; i++) {
    list.add(i);
  }
  return list;
}