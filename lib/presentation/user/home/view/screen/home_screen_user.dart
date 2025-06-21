import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/profile/view_model/get_user_info/get_user_info_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view/transport_screen.dart';
import 'package:aoun_app/presentation/user/transport/view_model/get_trips/get_trips_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/recommendation_trip/recommendation_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/view_debit_card/view_all_debit_card_cubit.dart';
import 'package:aoun_app/presentation/widgets/internet/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeUserScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void didChangeDependencies() async {
  //   context.read<RecommendationTripCubit>().getTrips(context);
  //   context.read<LocationProvider>().startListening(context);
  //   context
  //       .read<GetUserInfoCubit>()
  //       .getUserInformation(context, forceRefresh: true);
  //context.read<ViewAllDebitCardCubit>().fetchDebitcard();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: BlocListener<CheckConnectionCubit, CheckConnectionState>(
          listener: (context, state) {
            if (state is CheckConnectionHasInternet) {
              context.read<RecommendationTripCubit>().getTrips(context);
              context.read<LocationProvider>().startListening(context);
              context
                  .read<GetUserInfoCubit>()
                  .getUserInformation(context, forceRefresh: true);
              context.read<GetTripsCubit>().getTrips(includePast: false);
              context.read<ViewAllDebitCardCubit>().fetchDebitcard();
            }
          },
          child: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
            builder: (context, state) {
              if (state is CheckConnectionHasInternet ||
                  state is CheckConnectionLoading) {
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: false,
                        snap: true,
                        floating: true,
                        stretch: true,
                        actions: [
                          SizedBox(width: 13.w),
                          BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
                            builder: (context, state) {
                              if (state is GetUserInfoInitialSuccess) {
                                final user = state.userModel;
                                return Text(
                                  S
                                      .of(context)
                                      .home_user_welcome(user.userName!),
                                  style: Theme.of(context).textTheme.titleSmall,
                                );
                              } else {
                                return Shimmer.fromColors(
                                  baseColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  highlightColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  enabled: true,
                                  child: Container(
                                    width: 150.w,
                                    height: 16.w,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              print(Localizations.localeOf(context)
                                  .languageCode
                                  .toString());
                            },
                            child: Icon(
                              Iconsax.notification,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: 13.w),
                          InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.pushNamed(
                                context, AppRoutesName.userProfileScreenRoute),
                            child:
                                BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
                              builder: (context, state) {
                                if (state is GetUserInfoInitialSuccess) {
                                  final userModel = state.userModel;
                                  return CircleAvatar(
                                    maxRadius: 13.w,
                                    backgroundImage: userModel.imgUrl != null &&
                                            userModel.imgUrl!.isNotEmpty &&
                                            !userModel.imgUrl!
                                                .toLowerCase()
                                                .endsWith("null")
                                        ? NetworkImage(
                                            "https://studentpathapitest.runasp.net/${userModel!.imgUrl!.replaceAll(r'\\', '/')}")
                                        : const AssetImage(Assets.imageUser)
                                            as ImageProvider,
                                  );
                                } else {
                                  return Shimmer.fromColors(
                                    baseColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    highlightColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    enabled: true,
                                    child: Container(
                                      width: 35.w,
                                      height: 35.w,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 13.w),
                        ],
                      )
                    ];
                  },
                  body: TransportScreen(),
                );
              } else {
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: false,
                        snap: true,
                        floating: true,
                        stretch: true,
                        actions: [
                          SizedBox(width: 13.w),
                          Text(
                            S.of(context).home_user_welcome("Gest"),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          CircleAvatar(
                            maxRadius: 13.w,
                            backgroundImage: const AssetImage(Assets.imageUser)
                                as ImageProvider,
                          ),
                          SizedBox(width: 13.w),
                        ],
                      )
                    ];
                  },
                  body: NoInternetScreen(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
