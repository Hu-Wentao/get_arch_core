// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/5/12
// Time  : 9:34
extension IntToHexX on int {
  String get hex => '(0x)${this.toRadixString(16)}';
}

extension IntListToHexX on List<int> {
  String get hex =>
      '(0x)${this.map((i) => i.toRadixString(16)).toList().toString()}';
}
