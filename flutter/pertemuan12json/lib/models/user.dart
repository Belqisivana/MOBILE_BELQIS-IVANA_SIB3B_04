import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

// Contoh penanganan JSON tidak kompatibel:
// - json field "user_name" dipetakan ke name
// - age bisa berupa string atau int
// - address nested optional
@JsonSerializable(explicitToJson: true)
class User {
  final int id;

  @JsonKey(name: 'user_name')
  final String name;

  // custom converter: bisa menerima "25" atau 25
  @JsonKey(fromJson: _ageFromJson, toJson: _ageToJson)
  final int age;

  final String? email;

  final Address? address;

  User({
    required this.id,
    required this.name,
    required this.age,
    this.email,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static int _ageFromJson(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static dynamic _ageToJson(int value) => value;
}

@JsonSerializable()
class Address {
  final String? city;
  final String? street;

  Address({this.city, this.street});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
