import 'package:flutter/material.dart';

class BtnfilledWidget extends StatelessWidget {
  const BtnfilledWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 47),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
