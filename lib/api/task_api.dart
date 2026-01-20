import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskApi {
  Future<void> createTask({
    required String title,
    required int point,
}) async {
    await Future.delayed(const Duration(seconds: 1));

    //例外を投げる
    throw Exception('Network error');
  }
}