import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  BuildContext context;
  DialogHelper(this.context);

  showSuccessDialog({
    required String message,
    required String title,
    required List<Widget>? actions,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(message),
        actions: actions,
      ),
    );
  }

  showErroeDialog({required String message}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          S.of(context).warning,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }
}
