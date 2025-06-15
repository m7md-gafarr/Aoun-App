import 'dart:developer';

import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20dashboard/driver_dashboard_cubit.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view_model/transactions/transactions_cubit.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view_model/withdraw_from_wallet/withdraw_from_wallet_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/driver/transaction_widget.dart';
import 'package:aoun_app/presentation/widgets/shimmer/driver_wallet_and_earnings_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DriverWalletAndEarningsScreen extends StatefulWidget {
  const DriverWalletAndEarningsScreen({super.key});

  @override
  State<DriverWalletAndEarningsScreen> createState() =>
      _DriverWalletAndEarningsScreenState();
}

class _DriverWalletAndEarningsScreenState
    extends State<DriverWalletAndEarningsScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController amountWithdrawalController = TextEditingController();
  TextEditingController walletEditingController = TextEditingController();
  TextEditingController cardEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<TransactionsCubit>().transactions();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    amountWithdrawalController.dispose();
    walletEditingController.dispose();
    cardEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Wallet and earnings",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
              if (state is TransactionsSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "Balance Your",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "\$${state.balance.toStringAsFixed(1)}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 15.h),
                      ElevatedButton(
                        onPressed: () async {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            backgroundColor: Colors.white,
                            builder: (context) => Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                                left: 16,
                                right: 16,
                                top: 16,
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Withdrawal Request (Wednesdays only)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    SizedBox(height: 16.h),
                                    TextFormField(
                                      controller: amountWithdrawalController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter the amount";
                                        } else if (double.parse(value) <= 0) {
                                          return "Amount must be greater than 0";
                                        } else if (double.parse(value) >
                                            state.balance) {
                                          return "Amount exceeds your available balance";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            "Enter the amount to withdraw",
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Container(
                                      height: 45.h,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      child: TabBar(
                                        controller: _tabController,
                                        dividerColor: Colors.transparent,
                                        indicator: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        labelColor:
                                            Theme.of(context).primaryColor,
                                        unselectedLabelColor: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .color,
                                        indicatorAnimation:
                                            TabIndicatorAnimation.linear,
                                        indicatorColor: Colors.transparent,
                                        overlayColor: WidgetStatePropertyAll(
                                            Colors.transparent),
                                        unselectedLabelStyle: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontSize: 15.sp,
                                            ),
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 15.sp,
                                            ),
                                        tabs: [
                                          _buildTab(Iconsax.wallet,
                                              S.of(context).payment_wallet_tab),
                                          _buildTab(Iconsax.card,
                                              S.of(context).payment_card_tab),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    SizedBox(
                                      height: 130.h,
                                      child: TabBarView(
                                        physics: NeverScrollableScrollPhysics(),
                                        controller: _tabController,
                                        children: [
                                          _walletWidget(),
                                          _cardWidget(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final today = DateTime.now();
                                            if (today.weekday !=
                                                DateTime.wednesday) {
                                              Navigator.pop(context);
                                              SnackbarHelper.showError(context,
                                                  title:
                                                      "Withdrawal is only allowed on Wednesdays.");

                                              return;
                                            }
                                            context
                                                .read<WithdrawFromWalletCubit>()
                                                .withdrawFromWallet(
                                                  amount: int.parse(
                                                    amountWithdrawalController
                                                        .text,
                                                  ),
                                                );
                                          }
                                        },
                                        child: BlocConsumer<
                                            WithdrawFromWalletCubit,
                                            WithdrawFromWalletState>(
                                          listener: (context, state) {
                                            if (state
                                                is WithdrawFromWalletSuccess) {
                                              context
                                                  .read<TransactionsCubit>()
                                                  .transactions(
                                                      forceRefresh: true);
                                              context
                                                  .read<DriverDashboardCubit>()
                                                  .getDashboard();
                                              Navigator.pop(context);
                                            } else if (state
                                                is WithdrawFromWalletFailure) {
                                              log(state.errorMessage);
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state
                                                is WithdrawFromWalletLoading) {
                                              return SizedBox(
                                                height: 30,
                                                width: 30,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                ),
                                              );
                                            } else {
                                              return Text("Withdraw");
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text("Withdrawal"),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Last Transaction",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.transactionsList.length,
                        itemBuilder: (context, index) => TransactionWidget(
                          model: state.transactionsList[index],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return DriverWalletAndEarningsShimmer();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTab(IconData icon, String title) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget _cardWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text("Card number"),
          TextFormField(
            controller: cardEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the card number';
              } else if (value.replaceAll(' ', '').length != 16) {
                return 'Card number must be 16 digits';
              } else if (!RegExp(r'^[0-9 ]+$').hasMatch(value)) {
                return 'Only numbers are allowed';
              }
              return null;
            },
            maxLength: 16,
            decoration: InputDecoration(
              hintText: "XXXX XXXX XXXX XXXX",
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(S.of(context).payment_wallet_number),
          TextFormField(
            controller: walletEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).payment_phone_required;
              }

              if (!value.startsWith('010') &&
                  !value.startsWith('011') &&
                  !value.startsWith('012') &&
                  !value.startsWith('015')) {
                return S.of(context).payment_phone_prefix;
              }

              if (value.length != 11) {
                return S.of(context).payment_phone_length;
              }

              return null;
            },
            maxLength: 11,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              errorMaxLines: 2,
              hintText: S.of(context).payment_phone_hint,
            ),
          ),
        ],
      ),
    );
  }
}
