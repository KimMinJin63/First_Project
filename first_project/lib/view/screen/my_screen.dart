import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});
  static const route = '/myScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Screen'),
      ),
    );
  }
}