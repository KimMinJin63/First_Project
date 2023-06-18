import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FindPasswordPage extends StatelessWidget {
  const FindPasswordPage({super.key});
  static const route = '/findPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('find password'),
    );
  }
}