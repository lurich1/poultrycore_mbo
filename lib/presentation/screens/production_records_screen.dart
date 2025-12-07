import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Production Records Screen
class ProductionRecordsScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const ProductionRecordsScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/production-records',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Production Records',
      pageSubtitle: 'Track your farm production',
      pageIcon: Icons.description,
      iconBackgroundColor: const Color(0xFFFEF3C7),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add production record
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Log Production',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.description,
        title: 'No production records found',
        subtitle: 'Start tracking your production by logging your first record',
        buttonLabel: 'Log Your First Production',
        onButtonPressed: () {
          // TODO: Navigate to add production record
        },
      ),
    );
  }
}
