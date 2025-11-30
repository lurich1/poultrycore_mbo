import 'package:flutter/material.dart';
import '../../../../../presentation/widgets/base_page_screen.dart';
import '../../../../../presentation/widgets/empty_state_widget.dart';

/// Customers Screen - Main customer management interface
/// Matches the frontend FarmArchive design exactly
class CustomersScreen extends StatefulWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const CustomersScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final List<Map<String, dynamic>> _customers = []; // Empty for now
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageScreen(
      currentRoute: '/customers',
      onNavigate: widget.onNavigate,
      onLogout: widget.onLogout,
      pageTitle: 'Customers',
      pageSubtitle: 'Manage your customer database',
      pageIcon: Icons.people,
      iconBackgroundColor: const Color(0xFFF3E8FF), // bg-purple-100
      searchController: _searchController,
      actionButton: ElevatedButton.icon(
        onPressed: () {
          // TODO: Navigate to add customer
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: const Text(
          'Add Customer',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB), // bg-blue-600
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: _customers.isEmpty
          ? EmptyStateWidget(
              icon: Icons.people_outline,
              title: 'No customers found',
              subtitle: 'Get started by adding your first customer',
              buttonLabel: 'Add Your First Customer',
              onButtonPressed: () {
                // TODO: Navigate to add customer
              },
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Customers List')),
            ),
    );
  }
}
