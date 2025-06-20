import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/data/model/trip%20models/booking_trip/booking_response_trip_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentSuccessScreen extends StatelessWidget {
  PaymentSuccessScreen({super.key, required this.model});
  BookingResponseTripModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background ribbons
            SvgPicture.asset(Assets.imageRibbons),

            // Header title
            Positioned(
              top: 70.h,
              right: isRTL(context)
                  ? MediaQuery.of(context).size.width / 2.5
                  : null,
              left: isRTL(context)
                  ? null
                  : MediaQuery.of(context).size.width / 2.5,
              child: Text(
                S.of(context).payment_receipt_title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
            ),

            // Main content card
            Positioned(
              top: 120.h,
              right:
                  isRTL(context) ? MediaQuery.of(context).size.width / 8 : null,
              left:
                  isRTL(context) ? null : MediaQuery.of(context).size.width / 8,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Main white container
                  Container(
                    height: 500.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),

                        // Success icon
                        SvgPicture.asset(Assets.imageDialogDialogSuccess),
                        SizedBox(height: 30.h),

                        // Success title
                        Text(
                          S.of(context).payment_success_title,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(height: 8.h),

                        // Success description
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            S.of(context).payment_success_description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // Payment details section
                        Text(
                          S.of(context).payment_total_payment,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "\$${model!.totalPrice}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        Spacer(),
                        // Payment details section
                        Text(
                          S.of(context).payment_total_seats,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "${model!.totalSeats}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        // Action buttons section
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: Column(
                            children: [
                              // View Receipt Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    S.of(context).payment_done_button,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),

                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    S.of(context).payment_pay_again_button,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Left circle cutout
                  Positioned(
                    top: 280.h,
                    left: -20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),

                  // Right circle cutout
                  Positioned(
                    top: 280.h,
                    right: -20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),

                  // Dashed line between circles
                  Positioned(
                    top: 300.h,
                    left: 20.w,
                    right: 20.w,
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                      size: Size(240.w, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for dashed line
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
