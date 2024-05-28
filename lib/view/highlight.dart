import 'package:flutter/material.dart';

class HighLightPage extends StatefulWidget {
  const HighLightPage({super.key});

  @override
  State<HighLightPage> createState() => _HighLightPageState();
}

class _HighLightPageState extends State<HighLightPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Em Alta",
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ),
    );
  }
}
