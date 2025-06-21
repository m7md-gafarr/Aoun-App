import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/data/model/user_models/user_transactaion/user_transaction_response_model/user_transaction_response_model.dart';
import 'package:aoun_app/generated/l10n.dart';

import 'package:aoun_app/presentation/user/transactions/view_model/transactions/transactions_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/empty_data.dart';

import 'package:aoun_app/presentation/widgets/shimmer/transaction_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class UserTransactionsScreen extends StatefulWidget {
  const UserTransactionsScreen({super.key});

  @override
  State<UserTransactionsScreen> createState() =>
      _DriverWalletAndEarningsScreenState();
}

class _DriverWalletAndEarningsScreenState
    extends State<UserTransactionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<UserTransactionsCubit>().transactions();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).user_transactions_title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: BlocBuilder<UserTransactionsCubit, UserTransactionsState>(
            builder: (context, state) {
              if (state is UserTransactionsSuccess) {
                if (state.transactionsList.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.transactionsList.length,
                          itemBuilder: (context, index) => _TransactionWidget(
                            model: state.transactionsList[index],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100.h,
                                ),
                                EmptyDataWidget(
                                  image: Assets.imageEmptyImageEmptyTransaction,
                                  text: S
                                      .of(context)
                                      .user_transactions_no_transactions,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              } else {
                return Column(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TransactionShimmerWidget(),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _TransactionWidget extends StatelessWidget {
  _TransactionWidget({super.key, required this.model});
  UserTransactionResponseModel model;
  List<dynamic> getStatusTransaction(String status) {
    switch (status) {
      case "Credit Card":
        return [const Color(0xFFD32F2F), 0];
      case "Wallet":
        return [const Color(0xFFF57C00), 1];
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
            getStatusTransaction(model.formattedPaymentMethod!)[1] == 0
                ? Iconsax.card
                : Iconsax.wallet,
            color: getStatusTransaction(model.formattedPaymentMethod!)[0],
          ),
        ),
        title: Text(
          model.formattedDate!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: Text(
          "\$${model.amount!}",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: getStatusTransaction(model.formattedPaymentMethod!)[0],
              ),
        ),
      ),
    );
  }
}
