import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? title;
  final String? subtitle;

  const NoInternetScreen({
    super.key,
    this.onRetry,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.wifi_square,
                  size: 60.sp,
                  color: AppColorLight.errorColor,
                ),
              ),

              SizedBox(height: 32.h),

              Text(
                title ?? "No Internet Connection",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColorLight.errorColor,
                    ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              Text(
                subtitle ??
                    "Please check your internet connection and try again.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 48.h),

              // Retry Button
              if (onRetry != null)
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: Icon(
                      Iconsax.refresh_2,
                      size: 20.sp,
                    ),
                    label: Text(
                      "Try Again",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

              SizedBox(height: 24.h),

              // Troubleshooting Tips
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.info_circle,
                          size: 20.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Troubleshooting Tips",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    _buildTip(
                      context,
                      "Check your WiFi or mobile data connection",
                    ),
                    SizedBox(height: 8.h),
                    _buildTip(
                      context,
                      "Make sure airplane mode is turned off",
                    ),
                    SizedBox(height: 8.h),
                    _buildTip(
                      context,
                      "Try moving to an area with better signal",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip(BuildContext context, String tip) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.h),
          height: 4.h,
          width: 4.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            tip,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
          ),
        ),
      ],
    );
  }
}

// Alternative Minimal Version
class SimpleNoInternetScreen extends StatelessWidget {
  final VoidCallback? onRetry;

  const SimpleNoInternetScreen({
    super.key,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.wifi_square,
                size: 80.sp,
                color: Theme.of(context).colorScheme.error,
              ),
              SizedBox(height: 24.h),
              Text(
                "No Internet Connection",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                "Please check your connection and try again",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                textAlign: TextAlign.center,
              ),
              if (onRetry != null) ...[
                SizedBox(height: 32.h),
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: Icon(Iconsax.refresh_2),
                  label: Text("Retry"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Usage Examples:
/*
// Full featured version
NoInternetScreen(
  title: "Oops! No Internet",
  subtitle: "It looks like you're offline. Check your connection and try again.",
  onRetry: () {
    // Handle retry logic
    context.read<CheckConnectionCubit>().checkConnection();
  },
)

// Simple version
SimpleNoInternetScreen(
  onRetry: () {
    // Handle retry logic
  },
)

// Without retry button
NoInternetScreen(
  title: "Connection Lost",
  subtitle: "Please check your internet settings.",
)
*/
