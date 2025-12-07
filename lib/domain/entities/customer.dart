/// Domain entity - Customer data
/// Pure business data model, no Flutter/API dependencies
class Customer {
  final int? customerId;
  final String farmId;
  final String userId;
  final String name;
  final String? contactEmail;
  final String? contactPhone;
  final String? address;
  final String? city;
  final DateTime? createdDate;

  const Customer({
    this.customerId,
    required this.farmId,
    required this.userId,
    required this.name,
    this.contactEmail,
    this.contactPhone,
    this.address,
    this.city,
    this.createdDate,
  });
}
