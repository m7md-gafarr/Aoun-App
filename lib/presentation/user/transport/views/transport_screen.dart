import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/data/model/payment%20models/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/repositories/local/hive.dart';
import 'package:aoun_app/presentation/user/transport/view_model/get_trips/get_trips_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/view%20debit%20card/view_all_debit_card_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/trip_shimmer_widget.dart';
import 'package:aoun_app/presentation/widgets/specific/empty_debit_card.dart';
import 'package:aoun_app/presentation/widgets/specific/trip_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconsax/iconsax.dart';

import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/presentation/widgets/specific/debit_card.dart';
import 'package:provider/provider.dart';

class TransportScreen extends StatefulWidget {
  const TransportScreen({super.key});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<GetTripsCubit>().getTrips(includePast: true);
        context.read<ViewAllDebitCardCubit>().fetchDebitcard();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 7.h),
        ),
        BlocBuilder<ViewAllDebitCardCubit, ViewAllDebitCardState>(
          builder: (context, state) {
            if (state is ViewAllDebitCardSuccess &&
                state.debitCardList.isNotEmpty) {
              return _buildCardSwiper(state.debitCardList);
            } else if (state is ViewAllDebitCardNull) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 160.h,
                    child: const EmptyDebitCardWidget(),
                  ),
                ),
              );
            } else {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 160.h,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              );
            }
          },
        ),
        _buildLocationFields(context),
        SliverToBoxAdapter(
          child: Divider(
            height: 50.h,
            endIndent: 35.w,
            indent: 35.w,
          ),
        ),
        // _buildLastedTitle(
        //     context, "Our premium services tailored\nto your location"),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => TripShimmerWidget(),
        //     childCount: 3,
        //   ),
        // ),
        _buildLastedTitle(context, "Lasted trips"),
        _buildTripList(),
        SliverToBoxAdapter(
          child: SizedBox(height: 7.h),
        ),
      ],
    );
  }

  Widget _buildCardSwiper(List<DebitCardModel> model) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 160.h,
          child: CardSwiper(
            cardsCount: model.length,
            isLoop: true,
            numberOfCardsDisplayed: model.length,
            padding: EdgeInsets.zero,
            backCardOffset: const Offset(0, 20),
            scale: 0.9,
            cardBuilder: (context, index, _, __) {
              return Stack(
                children: [
                  DebitCardWidget(
                    model: model[index],
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) async {
                        if (!mounted) return;
                        if (value == 'delete') {
                          await HiveService().deleteDebitCard(index);
                          context
                              .read<ViewAllDebitCardCubit>()
                              .fetchDebitcard();
                        } else if (value == "add") {
                          Navigator.pushNamed(
                              context, AppRoutesName.addNewCardScreenRoute);
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'add',
                          child: Text(
                            'Add New Card',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(
                            'Delete',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLocationFields(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      sliver: SliverToBoxAdapter(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                SizedBox(height: 40.h),
                Consumer<LocationProvider>(
                  builder: (context, provider, child) {
                    return _buildLocationField(
                      context,
                      icon: Iconsax.location,
                      text:
                          "${provider.placemark?.subAdministrativeArea}, ${provider.placemark?.locality}" ??
                              "Loading...",
                    );
                  },
                ),
                SizedBox(height: 20.h),
                _buildLocationField(
                  context,
                  icon: Iconsax.search_normal,
                  text: "To",
                ),
              ],
            ),
            Positioned(
              top: 70.h,
              right: -25,
              child: _buildSwapButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationField(BuildContext context,
      {required IconData icon, required String text}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.searchTripScreenRoute);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        height: 40.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22.w),
            const SizedBox(width: 5),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwapButton(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Icon(
        Iconsax.arrow_3,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  Widget _buildLastedTitle(BuildContext contex, String text) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: isRTL(context) ? 0 : 13,
          right: isRTL(context) ? 13 : 0,
          bottom: 7.h,
          top: 7.h,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildTripList() {
    return BlocBuilder<GetTripsCubit, GetTripsState>(
      builder: (context, state) {
        if (state is GetTripsSuccess) {
          if (state.tripModel.isNotEmpty) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final trip = state.tripModel[index];
                  return TripWidget(trip: trip);
                },
                childCount: state.tripModel.length,
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(child: Text("No trips found.")),
            );
          }
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TripShimmerWidget(),
              childCount: 5,
            ),
          );
        }
      },
    );
  }
}
