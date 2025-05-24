import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work, other }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.other: Icons.question_answer,
};

const categoryNames = {
  Category.food: "Alimentação",
  Category.travel: "Viagens",
  Category.leisure: "Lazer",
  Category.work: "Trabalho",
  Category.other: "Outros",
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id; // Deve ser unique
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
