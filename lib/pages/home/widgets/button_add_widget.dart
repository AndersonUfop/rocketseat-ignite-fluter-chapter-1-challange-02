import 'package:flutter/material.dart';

class ButtonAddWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ButtonAddWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_circle_rounded),
      iconSize: 42,
      tooltip: 'Adicionar nota',
      color: Colors.purple,
      onPressed: onPressed,
    );
  }
}
