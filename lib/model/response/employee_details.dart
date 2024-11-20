import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'employee_details.freezed.dart';
part 'employee_details.g.dart';

List<EmployeeDetails> employeeDetailsFromJson(String str) => List<EmployeeDetails>.from(json.decode(str).map((x) => EmployeeDetails.fromJson(x)));

String employeeDetailsToJson(List<EmployeeDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class EmployeeDetails with _$EmployeeDetails {
 const factory EmployeeDetails({
  int? id,
  String? imageUrl,
  String? firstName,
  String? lastName,
  String? email,
  String? contactNumber,
  int? age,
  String? dob,
  double? salary,
  String? address,
 }) = _EmployeeDetails;

 factory EmployeeDetails.fromJson(Map<String, dynamic> json) => _$EmployeeDetailsFromJson(json);
}
