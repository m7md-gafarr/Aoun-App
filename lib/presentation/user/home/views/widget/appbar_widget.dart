import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppbarWidgetWelcomeAndNotification extends StatelessWidget {
  const AppbarWidgetWelcomeAndNotification({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      actions: [
        SizedBox(width: 13),
        Text(
          "Welcome $userName ,",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(
          flex: 1,
        ),
        Icon(
          Iconsax.notification,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 13),
      ],
    );
  }
}
