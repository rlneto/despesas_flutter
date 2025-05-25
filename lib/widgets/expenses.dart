import 'package:despesas_flutter/widgets/chart/chart.dart';
import 'package:despesas_flutter/widgets/expenses_list/expenses_list.dart';
import 'package:despesas_flutter/widgets/new_expense.dart';
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
  final List<Expense> _registeredExpenses = [];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Despesa excluída com sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(child: Text('Nenhuma despesa registrada.'));

    List<Widget> corpo = [
      Expanded(child: Chart(expenses: _registeredExpenses)),
      Expanded(child: mainContent),
    ];

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.fromLTRB(0, 0, 24, 0),
        title: Text("Gerenciador de Despesas"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: width < 600 ? Column(children: corpo) : Row(children: corpo),
    );
  }
}
