import 'package:aoun_app/data/model/payment_models/transaction_model/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TransactionWidget extends StatelessWidget {
  TransactionWidget({super.key, required this.model});
  DTransaction model;
  List<dynamic> getStatusTransaction(String status) {
    switch (status) {
      case "Withdrawal":
        return [const Color(0xFFE53935), 0];
      case "TripEarnings":
        return [const Color(0xFF4CAF50), 1];
      default:
        return [Colors.grey, "Unknown"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(
              Radius.circular(7.r),
            ),
          ),
          height: 50.h,
          width: 50.h,
          child: Icon(
            getStatusTransaction(model.operation!)[1] == 0
                ? Iconsax.arrow_down
                : Iconsax.arrow_up_3,
            color: getStatusTransaction(model.operation!)[0],
          ),
        ),
        title: Text(
          model.formattedDate!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: Text(
          "\$${model.amount!}",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: getStatusTransaction(model.operation!)[0],
              ),
        ),
      ),
    );
  }
}
