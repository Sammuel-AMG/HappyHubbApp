import 'package:flutter/material.dart';

class HHButton extends StatelessWidget {
  final String label;
  const HHButton(this.label, {super.key});
  @override
  Widget build(BuildContext context) =>
      ElevatedButton(onPressed: () {}, child: Text(label));
}
