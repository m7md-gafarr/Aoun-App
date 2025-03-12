import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:aoun_app/core/constant/constant.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const AppbarWidget({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onBack ?? () => Navigator.pop(context),
        child: Icon(
          isRTL(context) ? Iconsax.arrow_right_1 : Iconsax.arrow_left,
          size: 30,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
