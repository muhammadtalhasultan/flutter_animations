import 'package:flutter/material.dart';
import 'package:flutter_animations/constant.dart';
import 'package:flutter_animations/screens/widget/flipbtn_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlipButtonWidget(
          color: white,
          backgroundColor: red,
          leftLable: 'Photo',
          rightLable: 'Video',
          onChange: ((isLeftActive) {}),
        ),
      ),
    );
  }
}
