class ValidationMixin {
    String validateEmail(email) {
    Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Please enter valid email';
    else
      return null;
  }

  String validatePassword(password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}