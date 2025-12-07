import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Sales Screen
class SalesScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const SalesScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/sales',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Sales',
      pageSubtitle: 'Track your sales transactions',
      pageIcon: Icons.shopping_bag,
      iconBackgroundColor: const Color(0xFFECFDF5),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add sale
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Add Sale',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.shopping_bag,
        title: 'No sales records found',
        subtitle: 'Start tracking sales by adding your first transaction',
        buttonLabel: 'Add Your First Sale',
        onButtonPressed: () {
          // TODO: Navigate to add sale
        },
      ),
    );
  }
}
