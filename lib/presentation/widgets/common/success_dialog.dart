import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SuccessDialogWidget {
  String message;
  String title;
  List<Widget>? actions;
  SuccessDialogWidget(
      {required this.message, required this.title, required this.actions});
  Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          S.of(context).warning,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(message),
        actions: actions,
      ),
    );
  }
}
