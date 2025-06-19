import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view_model/driver_trips_history/driver_trips_history_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/empty_data.dart';
import 'package:aoun_app/presentation/widgets/common/primary_trip_history_widget.dart';
import 'package:aoun_app/presentation/widgets/shimmer/trip_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverHistoryTripsScreen extends StatefulWidget {
  const DriverHistoryTripsScreen({super.key});

  @override
  State<DriverHistoryTripsScreen> createState() =>
      _DriverHistoryTripsScreenState();
}

class _DriverHistoryTripsScreenState extends State<DriverHistoryTripsScreen> {
  @override
  void didChangeDependencies() {
    context.read<DriverTripsHistoryCubit>().getDriverTrips();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "History trips",
      ),
      body: BlocBuilder<DriverTripsHistoryCubit, DriverTripsHistoryState>(
        builder: (context, state) {
          if (state is DriverTripsHistorySuccess) {
            return state.tripList.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                          ),
                          EmptyDataWidget(
                            image: Assets.imageEmptyImageEmptyHistorydata,
                            text: "There are no history trip at the moment.",
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.tripList.length,
                    itemBuilder: (context, index) {
                      return TripHistoryWidget(
                        tripModel: state.tripList[index],
                      );
                    },
                  );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => TripShimmerWidget(),
              itemCount: 6,
            );
          }
        },
      ),
    );
  }
}
