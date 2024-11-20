
class RegEx{
  final RegExp name = RegExp(r'^[a-zA-Z\s]*$');
  final RegExp email = RegExp(r'[a-zA-Z0-9._-]+@[a-z]+\.+[a-z]+');
  final RegExp mobile = RegExp(r'^[0-9]+$');
  final RegExp password = RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{4,}$');
  final RegExp address = RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
}