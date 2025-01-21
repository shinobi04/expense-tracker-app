import 'package:expense_tracker/widgets/Expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "My COurese",
        amount: 500,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "Youtube",
        amount: 99,
        date: DateTime.now(),
        category: Category.food),
  ];
  void _openAddExpenseOverly() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker "),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverly, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("Chart"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
