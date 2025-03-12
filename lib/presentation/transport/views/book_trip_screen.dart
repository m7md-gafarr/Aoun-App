import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:aoun_app/presentation/widgets/common/title_Info_trip_widget.dart';
import 'package:aoun_app/presentation/widgets/specific/trip_map.dart';

class BookTripScreen extends StatefulWidget {
  const BookTripScreen({super.key});

  @override
  State<BookTripScreen> createState() => _BookTripScreenState();
}

class _BookTripScreenState extends State<BookTripScreen> {
  int _selectedSeats = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: "Book trip"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSeatSelection(),
            const DividerWidget(),
            _buildMeetingPointSection(),
            const DividerWidget(),
            _buildNoteSection(),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatSelection() {
    return Row(
      children: [
        const TitleInfoTripWidget(title: "Number of Seats"),
        const Spacer(),
        DropdownButton<int>(
          value: _selectedSeats,
          items: [1, 2, 3, 4].map((value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(
                value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedSeats = value);
            }
          },
          dropdownColor: Theme.of(context).colorScheme.primaryContainer,
          icon: Icon(Icons.arrow_drop_down,
              color: Theme.of(context).primaryColor, size: 30),
          style: Theme.of(context).textTheme.titleSmall,
          underline: Container(
            height: 1.5,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildMeetingPointSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleInfoTripWidget(title: "Meeting Point on Route (Optional)"),
        Text(
          "You can choose a place on the itinerary to meet the driver.",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(height: 7.h),
        const TripMapWidget(),
      ],
    );
  }

  Widget _buildNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleInfoTripWidget(title: "Add a Note"),
        SizedBox(height: 7.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).enter_password;
            }
            return null;
          },
          maxLines: 3,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            errorMaxLines: 2,
            hintText: "Write your notes if you have any.",
            hintStyle: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutesName.paymentScreenRoute),
        child: const Text("Continue to payment"),
      ),
    );
  }
}
