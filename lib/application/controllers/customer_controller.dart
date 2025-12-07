import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/customer.dart';
import '../../domain/usecases/create_customer_usecase.dart';
import '../../domain/usecases/get_customers_usecase.dart';
import '../states/customer_state.dart';

/// Controller - Manages customer state and coordinates use cases
class CustomerController extends StateNotifier<CustomerState> {
  final GetCustomersUseCase getCustomersUseCase;
  final CreateCustomerUseCase createCustomerUseCase;
  final String userId;
  final String farmId;

  CustomerController({
    required this.getCustomersUseCase,
    required this.createCustomerUseCase,
    required this.userId,
    required this.farmId,
  }) : super(const CustomerState()) {
    loadCustomers();
  }

  /// Load customers
  Future<void> loadCustomers() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final customers = await getCustomersUseCase(userId, farmId);
      state = state.copyWith(customers: customers, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  /// Create a new customer
  Future<bool> createCustomer(Customer customer) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await createCustomerUseCase(customer);
      // Reload customers to include the new one
      await loadCustomers();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}
