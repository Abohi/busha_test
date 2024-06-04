class Validators {
  static String countryCode = '';
  static String phoneNumber = '';

  static String? validateIsEmail(String? email,
      {String error = "Enter a valid email address"}) {
    return isEmail(email)! ? null : error;
  }

  static bool? isEmail(String? email) {
    if (email != null) {
      String p = r"[a-zA-Z0-9\+\.\_\%\-\+]{1,256}"
          "\\@"
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
          "("
          "\\."
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
          ")+";
      return RegExp(p).hasMatch(email);
    }
    return null;
  }

  static String? validateIsEmpty(String? value) {
    if (value != null) {
      if (value.length < 2) {
        return 'Field is not valid';
      }
      return null;
    }
    return null;
  }

  static String? validateRequired(dynamic value) {
    if (value != null) {
      if (value.isEmpty) {
        return '* required';
      }
      return null;
    }
    return null;
  }

  static String? validateMinimumAmount(dynamic value) {
    if (value == null || value.isEmpty) {
      return '* required';
    }
    String amountStr =
        value.replaceAll("₦", "").replaceAll(",", "").toString().split(".")[0];
    if (int.tryParse(amountStr) != null) {
      int amount = int.parse(amountStr);
      if (amount < 500) {
        return 'Minimum amount is 500';
      }
    } else {
      return 'Invalid amount';
    }
    return null;
  }

  static String? validatePhoneNumber(dynamic value) {
    if (value != null) {
      if (value.length < 9) {
        return 'Invalid phone number *';
      }
      return null;
    }
    return null;
  }

  static String? validateInputLength({
    required dynamic value,
    required int length,
    String errorMessage = "Invalid digit *",
  }) {
    if (value != null) {
      if (value.length < length || value.toString().contains(" ")) {
        return errorMessage;
      }
      return null;
    }
    return null;
  }

  static String? validatePassword(dynamic value) {
    Pattern pattern =
        r"^(?=.*[A-Za-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";

    RegExp regex = RegExp(pattern.toString());
    if (value != null) {
      if (value.isEmpty) {
        return 'Please enter password';
        // return '';
      } else {
        if (!regex.hasMatch(value)) {
          // return "";
          return 'Include Minimum of eight characters,\nAt least one uppercase, one lowercase, \none number and one special character';
        } else {
          return null;
        }
      }
    } else {
      return null;
    }
  }
}
