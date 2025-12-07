import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../presentation/widgets/base_page_screen.dart';
import '../../../../../presentation/widgets/empty_state_widget.dart';
import '../../../../../application/providers/customer_providers.dart';
import '../../../../../presentation/screens/add_customer_screen.dart';

/// Customers Screen - Main customer management interface
/// Matches the frontend FarmArchive design exactly
class CustomersScreen extends ConsumerStatefulWidget {
  final Function(String) onNavigate;
  final VoidCallback onLogout;

  const CustomersScreen({
    super.key,
    required this.onNavigate,
    required this.onLogout,
  });

  @override
  ConsumerState<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends ConsumerState<CustomersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load customers when screen is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(customerControllerProvider.notifier).loadCustomers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToAddCustomer() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const AddCustomerScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final customerState = ref.watch(customerControllerProvider);
    final customers = customerState.customers;
    final isLoading = customerState.isLoading;
    final error = customerState.error;

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
        onPressed: _navigateToAddCustomer,
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
      child: _buildContent(customers, isLoading, error),
    );
  }

  Widget _buildContent(List customers, bool isLoading, String? error) {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: $error',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(customerControllerProvider.notifier).loadCustomers();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (customers.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.people_outline,
        title: 'No customers found',
        subtitle: 'Get started by adding your first customer',
        buttonLabel: 'Add Your First Customer',
        onButtonPressed: _navigateToAddCustomer,
      );
    }

    // Customers list
    return Card(
      child: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF9333EA),
              child: Text(
                customer.name.isNotEmpty ? customer.name[0].toUpperCase() : 'C',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              customer.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (customer.contactEmail != null)
                  Text('Email: ${customer.contactEmail}'),
                if (customer.contactPhone != null)
                  Text('Phone: ${customer.contactPhone}'),
                if (customer.city != null) Text('City: ${customer.city}'),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to customer details
            },
          );
        },
      ),
    );
  }
}
