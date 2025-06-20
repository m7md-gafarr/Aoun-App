import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20dashboard/driver_dashboard_cubit.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view_model/transactions/transactions_cubit.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view_model/withdraw_from_wallet/withdraw_from_wallet_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/empty_data.dart';
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
        title: S.of(context).driver_wallet_earnings_title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
              if (state is TransactionsSuccess) {
                if (state.transactionsList.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          S.of(context).driver_wallet_earnings_balance,
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
                            await bottomSheet(state.balance);
                          },
                          child: Text(
                              S.of(context).driver_wallet_earnings_withdrawal),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S
                                  .of(context)
                                  .driver_wallet_earnings_last_transaction,
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
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          S.of(context).driver_wallet_earnings_balance,
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
                            await bottomSheet(state.balance);
                          },
                          child: Text(
                              S.of(context).driver_wallet_earnings_withdrawal),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S
                                  .of(context)
                                  .driver_wallet_earnings_last_transaction,
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
                                      .driver_wallet_earnings_no_transactions,
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
          Text(S.of(context).driver_wallet_earnings_card_number),
          TextFormField(
            controller: cardEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S
                    .of(context)
                    .driver_wallet_earnings_card_number_required;
              } else if (value.replaceAll(' ', '').length != 16) {
                return S.of(context).driver_wallet_earnings_card_number_length;
              } else if (!RegExp(r'^[0-9 ]+$').hasMatch(value)) {
                return S.of(context).driver_wallet_earnings_card_number_digits;
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

  Future bottomSheet(double balance) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).driver_wallet_earnings_withdrawal_request,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: amountWithdrawalController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).driver_wallet_earnings_amount_required;
                  } else if (double.parse(value) <= 0) {
                    return S.of(context).driver_wallet_earnings_amount_min;
                  } else if (double.parse(value) > balance) {
                    return S.of(context).driver_wallet_earnings_amount_exceeds;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: S.of(context).driver_wallet_earnings_amount_hint,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 45.h,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor:
                      Theme.of(context).textTheme.labelLarge!.color,
                  indicatorAnimation: TabIndicatorAnimation.linear,
                  indicatorColor: Colors.transparent,
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 15.sp,
                          ),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15.sp,
                      ),
                  tabs: [
                    _buildTab(Iconsax.wallet, S.of(context).payment_wallet_tab),
                    _buildTab(Iconsax.card, S.of(context).payment_card_tab),
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
                    if (_formKey.currentState!.validate()) {
                      final today = DateTime.now();
                      if (today.weekday != DateTime.wednesday) {
                        Navigator.pop(context);
                        SnackbarHelper.showError(context,
                            title: S
                                .of(context)
                                .driver_wallet_earnings_withdrawal_wednesday_only);

                        return;
                      }
                      context
                          .read<WithdrawFromWalletCubit>()
                          .withdrawFromWallet(
                            amount: int.parse(
                              amountWithdrawalController.text,
                            ),
                          );
                    }
                  },
                  child: BlocConsumer<WithdrawFromWalletCubit,
                      WithdrawFromWalletState>(
                    listener: (context, state) {
                      if (state is WithdrawFromWalletSuccess) {
                        context
                            .read<TransactionsCubit>()
                            .transactions(forceRefresh: true);
                        context.read<DriverDashboardCubit>().getDashboard();
                        Navigator.pop(context);
                        DialogHelper(context).showSuccessDialog(
                          message: S
                              .of(context)
                              .driver_wallet_earnings_withdrawal_success_message,
                          title: S
                              .of(context)
                              .driver_wallet_earnings_withdrawal_success_title,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S
                                      .of(context)
                                      .user_edit_profile_update_success_ok,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ))
                          ],
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is WithdrawFromWalletLoading) {
                        return SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      } else {
                        return Text(
                            S.of(context).driver_wallet_earnings_withdraw);
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
  }
}
