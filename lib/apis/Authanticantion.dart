import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  String phoneNumber = "";

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    //todo : reCaptcha screen
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91${phoneNumber.toString()}',
        // RecaptchaVerifier(
        //   container: 'recaptcha',
        //   size: RecaptchaVerifierSize.compact,
        //   theme: RecaptchaVerifierTheme.dark,),
    );
    return result;
  }

  Future<bool> authenticate(ConfirmationResult confirmationResult, String otp) async {
    try{
      await confirmationResult.confirm(otp);
      return true;
    }
    catch (e){
      return false;
    }

  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}
