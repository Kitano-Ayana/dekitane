import 'package:flutter/material.dart';

class TaskCreateDto {
  final String title;
  final int point;

  TaskCreateDto({
    required this.title,
    required this.point,
  }) {
    if(title.isEmpty) {
      throw ArgumentError('タイトルは必須です');
    }
    if(point <= 0) {
      throw ArgumentError('ポイントは0以上を入力してください');
    }
  }
}