import 'package:despesas_flutter/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(theme: ThemeData.dark().copyWith(), home: const Expenses()),
  );
}
