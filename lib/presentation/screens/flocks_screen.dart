import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Flocks Screen
class FlocksScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const FlocksScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/flocks',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Flocks',
      pageSubtitle: 'Manage your bird flocks',
      pageIcon: Icons.eco,
      iconBackgroundColor: const Color(0xFFECFDF5),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add flock
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Add Flock',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.eco,
        title: 'No flocks found',
        subtitle: 'Get started by adding your first flock',
        buttonLabel: 'Add Your First Flock',
        onButtonPressed: () {
          // TODO: Navigate to add flock
        },
      ),
    );
  }
}
