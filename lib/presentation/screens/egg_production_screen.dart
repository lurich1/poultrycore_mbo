import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Egg Production Screen
class EggProductionScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const EggProductionScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/egg-production',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Egg Production',
      pageSubtitle: 'Track egg production records',
      pageIcon: Icons.whatshot,
      iconBackgroundColor: const Color(0xFFFFF1F2),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add egg production record
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Record Eggs',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.whatshot,
        title: 'No egg production records found',
        subtitle: 'Start tracking by recording your first egg production',
        buttonLabel: 'Record Your First Eggs',
        onButtonPressed: () {
          // TODO: Navigate to add egg production record
        },
      ),
    );
  }
}
