import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../models/account.dart';

Future<Account?> signIn(
    {required String email, required String password}) async {
  try {
    Response response = await Dio().post(
      'https://ayajafar001.pythonanywhere.com/api/auth/signin/',
      data: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> accountOut = response.data['account'];
      accountOut['token'] = response.data['token'];
      // print(accountOut);
      return Account.fromJson(accountOut);
    } else if (response.statusCode == 404) {
      Get.snackbar(
        (response.data['message']),
        "Please try again",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      Get.snackbar(
        (response.data['detail'][0]['msg']),
        "Please try again",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  } catch (e) {
    Get.snackbar(
      "Please try again",
      "Make sure your email and password is correct",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
    return null;
  }
}

Future<Account?> signUp(
    {required String userName,
    required String email,
    required String password1,
    required String password2,
    required String phoneNumber}) async {
  try {
    Response response = await Dio().post(
      'https://ayajafar001.pythonanywhere.com/api/auth/signup/',
      data: jsonEncode({
        "user_name": userName,
        "email": email,
        "password1": password1,
        "password2": password2,
        "phone_number": phoneNumber
      }),
      // headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      print(201);
      print(response.data);
      Map<String, dynamic> data = response.data['account'];
      return Account.fromJson(data);
    }
    // else if (response.statusCode == 404) {
    //   // print(404);
    //   print(response.data);
    //   // return (jsonDecode(response.body)['message']);
    // } else {
    //   print((response.data));

    //   // return (jsonDecode(response.body)['detail'][0]['msg']);
    // }
  } catch (e) {
    // print(e);
    Get.snackbar(
      "Registeration failed",
      "Please try again",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
    // return null;
  }
}
