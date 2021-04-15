import 'utils.dart';

String validationPassword(String value) {
  // Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
  // RegExp regex = new RegExp(pattern);
  print(value);
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!passValidator(value))
      return 'Invalid password format! (Must contain 1 lowercase letter, 1 uppercase latter and 1 number)!';
    else
      return null;
  }
}

String validationEmail(String value) {
  print(value);
  if (value.isEmpty) {
    return 'Please enter email';
  } else {
    if (!emailValidator(value))
      return 'Invalid email format!';
    else
      return null;
  }
}

String validationConfirmationCode(String value) {
  print(value);
  if (value.length != 6)
    return 'Invalid confirmation code!';
  else
    return null;
}
