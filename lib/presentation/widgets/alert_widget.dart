import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';

dynamic AlertDialogWidget(BuildContext context, {required String content}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(content, style: Theme.of(context).textTheme.bodyMedium),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).ok_AlertDialogt),
        )
      ],
    ),
  );
}
