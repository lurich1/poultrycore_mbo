import 'package:flutter/material.dart';
import '../widgets/base_page_screen.dart';
import '../widgets/empty_state_widget.dart';

/// Feed Usage Screen
class FeedUsageScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const FeedUsageScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return BasePageScreen(
      currentRoute: '/feed-usage',
      onNavigate: onNavigate,
      onLogout: onLogout,
      pageTitle: 'Feed Usage',
      pageSubtitle: 'Track feed consumption',
      pageIcon: Icons.inventory,
      iconBackgroundColor: const Color(0xFFF0F9FF),
      searchController: searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add feed usage record
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Record Usage',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: EmptyStateWidget(
        icon: Icons.inventory,
        title: 'No feed usage records found',
        subtitle: 'Start tracking feed consumption by adding your first record',
        buttonLabel: 'Record Your First Usage',
        onButtonPressed: () {
          // TODO: Navigate to add feed usage record
        },
      ),
    );
  }
}
