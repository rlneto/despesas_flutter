import 'package:despesas_flutter/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'R\$ : ${expense.amount.toStringAsFixed(2).replaceAll('.', ',')}',
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          categoryIcons[expense.category] ??
                              Icons.question_mark,
                        ),
                        const SizedBox(width: 8),
                        Text(categoryNames[expense.category] ?? "Outros"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm),
                        Text(
                          '${expense.date.day.toString()}/${expense.date.month.toString()}/${expense.date.year.toString()}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
