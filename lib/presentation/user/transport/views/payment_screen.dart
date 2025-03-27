import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Payment",
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("Cancel"),
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
                height: 100.h,
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
              ElevatedButton(
                onPressed: () {},
                child: Text("Pay 24EG"),
              ),
            ],
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
          _buildTab(Iconsax.wallet, "Wallet"),
          _buildTab(Iconsax.card, "Card"),
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
          Text("Pay from"),
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
            height: 200.h,
            child: Column(
              children: [
                Text(
                  "Pay from",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: 20.h),
                _buildPaymentOption("1549", "Mohamed Sokar"),
                Spacer(),
                _buildAddNewCardOption(),
              ],
            ),
          ),
        );
      },
      child: _buildContainer(
        child: Row(
          children: [
            Text(
              "1549",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 16.sp),
            ),
            VerticalDivider(width: 30.w),
            Text(
              "Mohamed Sokar",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 16.sp),
            ),
            Spacer(),
            Icon(Iconsax.arrow_down_1, size: 20.w),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String number, String name) {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          Text(
            number,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 16.sp),
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
          Icon(Iconsax.tick_circle),
        ],
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
            "Add a new card",
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
          Text("Wallet Number"),
          TextField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              errorMaxLines: 2,
              hintText: "010X XXXX XXXX",
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
            _buildSummaryRow("Number of seats", "3"),
            SizedBox(height: 7.h),
            _buildSummaryRow("Total amount", "3"),
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
