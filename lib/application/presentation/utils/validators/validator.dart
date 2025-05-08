bool isAlphabet(String input) {
  final alphabetsRegex = RegExp(r'^[a-zA-Z]+$');
  return alphabetsRegex.hasMatch(input);
}

bool isValidAge(String input) {
  final ageRegex = RegExp(r'^[1-9][0-9]{0,2}$');
  return ageRegex.hasMatch(input);
}

bool isValidPhoneNumber(String input) {
  final phoneNumberRegex = RegExp(r'\b\d{10}\b');
  return phoneNumberRegex.hasMatch(input);
}

// Regular expression for password validation
bool isValidPassword(String value) {
  final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  return passwordRegExp.hasMatch(value);
}

// Regular expression for email validation
bool isValidEmail(String value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{1,10}$');
  return emailRegExp.hasMatch(value);
}

bool isValidName(String input) {
  final nameRegex = RegExp(r'^[a-zA-Z]+(\s[a-zA-Z]+)?$');
  return nameRegex.hasMatch(input);
}

bool hasCapsLetter(String input) {
  final hasCapitalRegExp = RegExp(r'[A-Z]');
  return hasCapitalRegExp.hasMatch(input);
}

bool hasLowerCase(String input) {
  final hasSmallRegExp = RegExp(r'[a-z]');
  return hasSmallRegExp.hasMatch(input);
}

bool hasNumbers(String input) {
  final hasNumbersRegExp = RegExp(r'\d+');
  return hasNumbersRegExp.hasMatch(input);
}

bool hasSpecialChar(String input) {
  final hasSpecialCharsRegExp = RegExp(r'[^\w\s]');
  return hasSpecialCharsRegExp.hasMatch(input);
}
