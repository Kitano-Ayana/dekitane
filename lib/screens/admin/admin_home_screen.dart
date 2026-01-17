import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class adminHomeScreen extends StatelessWidget {
  const adminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed('adminTask');
              },
              child: const Text('タスク'),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('チケット'),
            ),
          ],
        ),
      ),
    );
  }
}