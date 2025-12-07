import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Houses Screen
class HousesScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const HousesScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/houses',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Houses',
      pageSubtitle: 'Manage your poultry houses',
      pageIcon: Icons.home_work,
      iconBackgroundColor: const Color(0xFFECFDF5),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add house
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Add House',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.home_work,
        title: 'No houses found',
        subtitle: 'Start managing houses by adding your first poultry house',
        buttonLabel: 'Add Your First House',
        onButtonPressed: () {
          // TODO: Navigate to add house
        },
      ),
    );
  }
}
