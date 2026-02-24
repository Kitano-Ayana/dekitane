import 'package:flutter/material.dart';

abstract class TaskRepositoryInterface {
  Future<void> createTask({required String title, required int point});
}
