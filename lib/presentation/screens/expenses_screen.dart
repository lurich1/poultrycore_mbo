import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Expenses Screen
class ExpensesScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const ExpensesScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/expenses',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Expenses',
      pageSubtitle: 'Track your farm expenses',
      pageIcon: Icons.attach_money,
      iconBackgroundColor: const Color(0xFFFEF2F2),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add expense
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Add Expense',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.attach_money,
        title: 'No expenses found',
        subtitle: 'Start tracking expenses by adding your first record',
        buttonLabel: 'Add Your First Expense',
        onButtonPressed: () {
          // TODO: Navigate to add expense
        },
      ),
    );
  }
}
