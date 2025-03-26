abstract class ValidationHelper {
  static String? email(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  static String? empty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    
    return null;
  }
}
