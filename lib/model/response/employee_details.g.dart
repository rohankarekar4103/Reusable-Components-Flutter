// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeDetails _$$_EmployeeDetailsFromJson(Map<String, dynamic> json) =>
    _$_EmployeeDetails(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      contactNumber: json['contactNumber'] as String?,
      age: json['age'] as int?,
      dob: json['dob'] as String?,
      salary: (json['salary'] as num?)?.toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$_EmployeeDetailsToJson(_$_EmployeeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'age': instance.age,
      'dob': instance.dob,
      'salary': instance.salary,
      'address': instance.address,
    };
