import 'package:flutter/material.dart';
import 'package:despesas_flutter/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Lanche',
      amount: 42.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Filme',
      amount: 43.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Passeio',
      amount: 44.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text('Relatório'), Text("Despesas vão aqui")]),
    );
  }
}
