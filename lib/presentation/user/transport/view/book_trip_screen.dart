import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:aoun_app/data/model/map%20models/route_model/route_model.dart';
import 'package:aoun_app/data/model/trip%20models/booking_trip/booking_request_trip_model.dart';
import 'package:aoun_app/data/model/trip%20models/trip_model/trip_model.dart';
import 'package:aoun_app/presentation/user/transport/view_model/booking_trip/booking_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view/map_select_meeting_point_meet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:aoun_app/presentation/widgets/common/title_Info_trip_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({super.key});

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
  int _selectedSeats = 1;
  TripModel? _tripModel;
  RouteModel? _routeModel;
  TextEditingController noteController = TextEditingController();
  dynamic meetPointSelected;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as List;
    if (arguments != null) {
      _tripModel = arguments[0];
      _routeModel = arguments[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).book_trip_title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSeatSelection(),
              const DividerWidget(),
              _buildMeetingPointSection(),
              const DividerWidget(),
              _buildNoteSection(),
              SizedBox(height: 15.h),
              ElevatedButton(
                onPressed: () {
                  if (meetPointSelected != null) {
                    context.read<BookingTripCubit>().bookingTrip(
                          BookingTripRequestModel(
                            tripId: _tripModel!.id,
                            numberOfSeats: _selectedSeats,
                            note: noteController.text,
                          ),
                        );
                  } else {
                    SnackbarHelper.showError(
                      context,
                      title: "Must select a meeting point",
                    );
                  }
                },
                child: BlocConsumer<BookingTripCubit, BookingTripState>(
                  listener: (context, state) {
                    if (state is BookingTripSucess) {
                      Navigator.pushNamed(
                        context,
                        AppRoutesName.paymentScreenRoute,
                        arguments: state.bookingResponseTripModel,
                      );
                    } else if (state is BookingTripFailure) {
                      log(state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is BookingTripLoading) {
                      return SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      );
                    } else {
                      return Text(S.of(context).book_trip_continue_payment);
                    }
                  },
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeatSelection() {
    return Row(
      children: [
        TitleInfoTripWidget(title: S.of(context).book_trip_number_of_seats),
        const Spacer(),
        InkWell(
          onTap: () => _showSeatPicker(context),
          child: Text(
            "${S.of(context).seats(_selectedSeats)}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }

  void _showSeatPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          children:
              List.generate(_tripModel!.basicInfo!.availableSeats!, (index) {
            final seatCount = index + 1;
            return ListTile(
              title: Text('${S.of(context).seats(seatCount)}'),
              onTap: () {
                setState(() {
                  _selectedSeats = seatCount;
                });
                Navigator.pop(context);
              },
            );
          }),
        );
      },
    );
  }

  Widget _buildMeetingPointSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleInfoTripWidget(title: S.of(context).book_trip_meeting_point_title),
        Text(
          S.of(context).book_trip_meeting_point_desc,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(height: 7.h),
        SizedBox(
          height: 180.h,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            child: OpenContainer<LatLng?>(
              closedElevation: 0,
              openElevation: 0,
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (context, action) => MapSelectMeetingPointMeetScreen(
                routeModel: _routeModel,
              ),
              onClosed: (data) => meetPointSelected = data,
              closedBuilder: (context, action) => InkWell(
                onTap: action,
                child: Image.asset(
                  Assets.imageMapMakerMap,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleInfoTripWidget(title: S.of(context).book_trip_add_note),
        SizedBox(height: 7.h),
        TextField(
          controller: noteController,
          maxLines: 3,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            errorMaxLines: 2,
            hintText: S.of(context).book_trip_note_hint,
            hintStyle: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
