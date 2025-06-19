import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: SvgPicture.asset(Assets.imageDialogDialogSuccess),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: actions,
      ),
    );
  }

  showErroeDialog({required String message}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: SvgPicture.asset(Assets.imageDialogDialogFaliure),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
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
