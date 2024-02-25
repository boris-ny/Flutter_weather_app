import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group6_alu/models/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection('users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            "User created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
          ),
        )
        .catchError((error, StackTrace) {
      Get.snackbar(
        'Erroe',
        'Something went wrong. Try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      print(error.toString());
    });
  }
}
