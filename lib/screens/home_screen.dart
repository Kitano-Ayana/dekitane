import 'package:flutter/material.dart';
import 'admin/admin_home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('adminHome');
                  },
                  child: const Text('保護'),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text('子ども'),
                )
              ],
            ),
        ),
    );
  }
}