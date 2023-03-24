class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final double lat;
  final double lng;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final address = json['address'];
    final geo = address['geo'];

    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      street: address['street'],
      suite: address['suite'],
      city: address['city'],
      zipcode: address['zipcode'],
      lat: double.parse(geo['lat']),
      lng: double.parse(geo['lng']),
    );
  }
}
