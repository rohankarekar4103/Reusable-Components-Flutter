
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayMessageUtils{

  //Method to change the focus of the field
  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode next
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  //Method to display the toast message
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      // backgroundColor: Colors.red,
    );
  }

  //Method to display the flushbar error message
  static void flushbarErrorMessage(BuildContext context, String message){

    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),
          message: message,
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          // flushbarPosition: FlushbarPosition.TOP,
          icon: Icon(Icons.error, size: 20, color: Colors.white,),
        )..show(context)
    );
  }

  // Method to display the snackbar message
  static snackbarMessage(BuildContext context, String message){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message))
    );
  }
}