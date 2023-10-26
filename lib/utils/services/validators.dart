abstract class Validators{
  static String? nameValidator(String? name) {
    if (name == '') {
      return "Name is required";
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == '') {
      return "email is required";
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email ?? '')) {
      // log("Enter");
      return "Enter valid Email";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == '') {
      return "Password is required";
    }
    if(password!.length<8){
      return "Password must contains minimum 8 characters";
    }
    return null;
  }

  static String? phoneValidator(String? number) {
    if (number == '') {
      return "Phone number is required";
    }
    if(number!.length!=10){
      return "Enter valid phone number";
    }
    //change regexp logic to not allow numbers starting from 0
    if (!RegExp(r'^(?!0)(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(number ?? '')) {
      return "Enter valid phone number";
    }
    return null;
  }
}