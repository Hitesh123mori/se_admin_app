import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  String phoneNumber = "";

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91$phoneNumber',
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
