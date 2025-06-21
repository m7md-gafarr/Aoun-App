import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/data/model/payment_models/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/model/trip_models/booking_trip/booking_response_trip_model.dart';
import 'package:aoun_app/presentation/user/transport/view/WebViewPaymob.dart';
import 'package:aoun_app/presentation/user/transport/view/payment_success.dart';
import 'package:aoun_app/presentation/user/transport/view_model/payment_card/payment_card_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/payment_wallet/payment_wallet_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/view_debit_card/view_all_debit_card_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:aoun_app/generated/l10n.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _textEditingController;

  int _selectedCard = 0;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
    context.read<ViewAllDebitCardCubit>().fetchDebitcard();
    super.initState();
  }

  BookingResponseTripModel? _bookingResponseTripModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)!.settings.arguments as BookingResponseTripModel;
    if (arguments != null) {
      _bookingResponseTripModel = arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppbarWidget(
          title: S.of(context).payment_title,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).payment_cancel,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColorLight.errorColor,
                    ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                _buildTabBar(),
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
                _buildWalletSummary(),
                MultiBlocListener(
                  listeners: [
                    BlocListener<PaymentCardCubit, PaymentCardState>(
                      listener: (context, state) {
                        if (state is PaymentCardFailure) {
                          DialogHelper(context).showErroeDialog(
                            message: state.errorMessage,
                          );
                        } else if (state is PaymentCardSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentSuccessScreen(
                                model: _bookingResponseTripModel,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    BlocListener<PaymentWalletCubit, PaymentWalletState>(
                      listener: (context, state) {
                        if (state is PaymentWalletFailure) {
                          DialogHelper(context).showErroeDialog(
                            message: state.errorMessage,
                          );
                        } else if (state is PaymentWalletSuccess) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                  S.of(context).payment_complete_payment_title),
                              content: Text(
                                S.of(context).payment_complete_payment_message,
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymobWebView(
                                          iFrameUrl: state.url.toString(),
                                          bookingResponseTripModel:
                                              _bookingResponseTripModel!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(S.of(context).payment_proceed),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_tabController.index == 0) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await context
                              .read<PaymentWalletCubit>()
                              .paymentWallet(
                                amount: _bookingResponseTripModel!.totalPrice!
                                    .toInt(),
                                bookingId: _bookingResponseTripModel!.bookingId!
                                    .toInt(),
                                walletId: _textEditingController.value.text,
                              );
                        }
                      } else if (_tabController.index == 1) {
                        List<DebitCardModel> list =
                            context.read<ViewAllDebitCardCubit>().listCards;
                        if (list.isEmpty) {
                          DialogHelper(context).showErroeDialog(
                            message: S.of(context).payment_no_card_added,
                          );
                          return;
                        }
                        await context.read<PaymentCardCubit>().makePayment(
                              context,
                              amount: _bookingResponseTripModel!.totalPrice!
                                  .toInt(),
                              bookingId:
                                  _bookingResponseTripModel!.bookingId!.toInt(),
                            );
                      }
                    },
                    child: _tabController.index == 0
                        ? BlocBuilder<PaymentWalletCubit, PaymentWalletState>(
                            builder: (context, state) {
                              if (state is PaymentWalletLoading) {
                                return SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                );
                              } else {
                                return Text(
                                  "Pay \$${_bookingResponseTripModel!.totalPrice}",
                                );
                              }
                            },
                          )
                        : BlocBuilder<PaymentCardCubit, PaymentCardState>(
                            builder: (context, state) {
                              if (state is PaymentCardLoading) {
                                return SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                );
                              } else {
                                return Text(
                                  "${S.of(context).payment_pay_amount} \$${_bookingResponseTripModel!.totalPrice}",
                                );
                              }
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
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
        unselectedLabelColor: Theme.of(context).textTheme.labelLarge!.color,
        indicatorAnimation: TabIndicatorAnimation.linear,
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
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
          Text(S.of(context).payment_pay_from),
          _buildCardSelector(),
        ],
      ),
    );
  }

  Widget _buildCardSelector() {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.all(13),
            height: 300.h,
            child: Column(
              children: [
                Text(
                  S.of(context).payment_pay_from,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: 20.h),
                BlocBuilder<ViewAllDebitCardCubit, ViewAllDebitCardState>(
                  builder: (context, state) {
                    if (state is ViewAllDebitCardSuccess) {
                      return SizedBox(
                        height: 210.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: .5,
                            );
                          },
                          itemCount: state.debitCardList.length,
                          itemBuilder: (context, index) => _buildPaymentOption(
                            state.debitCardList[index].cardNumber.substring(
                              state.debitCardList[index].cardNumber.length - 4,
                            ),
                            state.debitCardList[index].fullName,
                            () {
                              setState(() {
                                _selectedCard = index;
                              });
                              Navigator.pop(context);
                            },
                            _selectedCard == index,
                          ),
                        ),
                      );
                    } else if (state is ViewAllDebitCardLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 210.h,
                        child: Center(
                            child: Text(
                          S.of(context).payment_no_debit_card,
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                      );
                    }
                  },
                ),
                Spacer(),
                _buildAddNewCardOption(),
              ],
            ),
          ),
        );
      },
      child: BlocBuilder<ViewAllDebitCardCubit, ViewAllDebitCardState>(
        builder: (context, state) {
          if (state is ViewAllDebitCardSuccess) {
            return _buildContainer(
              child: Row(
                children: [
                  Text(
                    state.debitCardList[_selectedCard].cardNumber.substring(
                      state.debitCardList[_selectedCard].cardNumber.length - 4,
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  VerticalDivider(width: 30.w),
                  Text(
                    state.debitCardList[0].fullName,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  Spacer(),
                  Icon(Iconsax.arrow_down_1, size: 20.w),
                ],
              ),
            );
          } else if (state is ViewAllDebitCardLoading) {
            return _buildContainer(
              child: Row(
                children: [
                  Text(
                    "****",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  VerticalDivider(width: 30.w),
                  Text(
                    S.of(context).payment_loading,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  Spacer(),
                  Icon(Iconsax.arrow_down_1, size: 20.w),
                ],
              ),
            );
          } else {
            return _buildContainer(
              child: Row(
                children: [
                  Text(
                    S.of(context).payment_no_cards,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  Spacer(),
                  Icon(Iconsax.add, size: 20.w),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildPaymentOption(
      String number, String name, void Function()? onTap, bool Selected) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40.h,
        child: Row(
          children: [
            SizedBox(
              width: 45.w,
              child: Text(
                number,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16.sp),
              ),
            ),
            VerticalDivider(width: 30.w, endIndent: 15, indent: 15),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 16.sp),
            ),
            Spacer(),
            Selected ? Icon(Iconsax.tick_circle) : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewCardOption() {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.addNewCardScreenRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.add),
          SizedBox(width: 5.w),
          Text(
            S.of(context).payment_add_new_card,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
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
            controller: _textEditingController,
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

  Widget _buildWalletSummary() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: _buildContainer(
        child: Column(
          children: [
            _buildSummaryRow(S.of(context).payment_seats_count,
                _bookingResponseTripModel!.totalSeats.toString()),
            SizedBox(height: 7.h),
            _buildSummaryRow(S.of(context).payment_total_amount,
                _bookingResponseTripModel!.totalPrice.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.labelMedium),
        Spacer(),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13.r)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(15),
      child: child,
    );
  }
}
