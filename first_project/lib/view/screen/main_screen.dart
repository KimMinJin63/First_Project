import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('main screen'),
      ),
    );
  }
}