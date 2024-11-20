
enum InputTypes{
  username,
  email,
  password,
  phone,
  date
}

class ValidationUtils{

  //Method to check basic validations on the input field as per the input type.
  static bool isValidInput(InputTypes inputTypes,String input,RegExp regEx, int min, int max, bool mandatory){
    bool isValid = false;

    if(mandatory){
      if(input.isEmpty){
        return false;
      }
    }else{
      if(input.isNotEmpty){
        return true;
      }
    }
    if (input.length < min || input.length > max){
      isValid = false;
    }
    else isValid = regEx.hasMatch(input);

    return isValid;
  }

}
