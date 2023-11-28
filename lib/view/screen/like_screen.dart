import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeScreen extends GetView {
  const LikeScreen({super.key});
  static const route = '/likeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/images/logo.jpeg',
            height: MediaQuery.of(context).size.height / 5,
          )),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    ));
  }
}
