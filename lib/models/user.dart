import 'address.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String companyName;
  final Address address;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.companyName,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
		return User(
			id: json['id'] as int,
			name: json['name'] as String? ?? '',
			username: json['username'] as String? ?? '',
			email: json['email'] as String? ?? '',
			phone: json['phone'] as String? ?? '',
			website: json['website'] as String? ?? '',
			companyName: json['company']?['name'] as String? ?? '',
			address: json['addres'] != null
			  ? Address.fromJson(json['address'] as Map<String, dynamic>)
				: const Address(street: '', suite: '', city: '', zipcode: '')
		);
	}
}
