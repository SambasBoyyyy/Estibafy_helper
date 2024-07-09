class User {
  String? imagePath;
  String name;
  String email;
  String phoneNumber;
  String? address;
  String? city;
  String? state;
  String? country;
  String password;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.address,
    this.city,
    this.state,
    this.country,
    this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      };

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['street_address'],
        city = json['city'],
        state = json['state'],
        country = json['country'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        password = json['password'];
}
