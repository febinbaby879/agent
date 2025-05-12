import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/validators/validator.dart';

class ValidationTextField {
  static String? validateTextField(
      {required Validate validate,
      required String labelText,
      required String? value,
      String? password}) {
    switch (validate) {
      case Validate.none:
        return null;

      case Validate.notNull:
        if (value == null || value.isEmpty) {
          if (value == 'Content' && value!.length < 20) {
            return 'Content must be at least 20 characters';
          } else if (labelText == '') {
            return 'Enter $labelText';
          }
          return 'Please enter $labelText';
        }
        break;

      case Validate.email:
        if (!isValidEmail(value!)) {
          return 'Please enter a valid email address';
        }
        break;

      case Validate.password:
        if (value!.length < 8) {
          return 'Password must contain at least 8 characters';
        }
        if (!hasLowerCase(value)) {
          return 'Password must contain lowercase letters';
        } else if (!hasCapsLetter(value)) {
          return 'Password must contain uppercase letters';
        } else if (!hasNumbers(value)) {
          return 'Password must contain numbers';
        } else if (!hasSpecialChar(value)) {
          return 'Password must contain special characters';
        }
        break;

      case Validate.phone:
        if (!RegExp(r'^\+?[0-9\s\-\(\)]+$').hasMatch(value!)) {
          return 'Enter a valid phone number';
        } else if (value.replaceAll(RegExp(r'[^0-9]'), '').length < 6) {
          return 'Phone number is too short';
        } else if (value.replaceAll(RegExp(r'[^0-9]'), '').length > 15) {
          return 'Phone number is too long';
        }
        break;

      case Validate.ifValidnumber:
        if (value != null && value.isNotEmpty) {
          if (value.length != 10 || !isValidPhoneNumber(value)) {
            return 'Phone Number is not valid';
          }
        }
        return null;

      case Validate.ifValidEmail:
        if (value != null && value.isNotEmpty) {
          if (!isValidEmail(value)) {
            return 'Email is not valid';
          }
        }
        return null;

      case Validate.rePassword:
        if (password!.trim() != value) {
          return 'Passwords must be the same';
        }
        break;

      default:
        if (value == 'Content' && value!.length < 20) {
          return 'Content must be at least 20 characters';
        }
    }
    return null;
  }
}
