import 'package:flutter/material.dart';

class TicketCreateDto {
  final String title;
  final int point;

  TicketCreateDto({
    required this.title,
    required this.point,
  }) {
    if(title.isEmpty) {
      throw ArgumentError('チケット名は必須です');
    }
    if(point <= 0) {
      throw ArgumentError('ポイントは0以上を入力してください');
    }
  }
}