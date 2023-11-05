import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
 
class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});
  static const route = '/likeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Like Screen'),
      ),
    );
  }
}