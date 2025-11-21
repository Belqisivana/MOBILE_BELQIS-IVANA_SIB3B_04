// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      name: json['user_name'] as String,
      age: User._ageFromJson(json['age']),
      email: json['email'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.name,
      'age': User._ageToJson(instance.age),
      'email': instance.email,
      'address': instance.address?.toJson(),
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      city: json['city'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
    };
