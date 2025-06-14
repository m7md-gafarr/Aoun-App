import 'dart:io';

import 'package:aoun_app/data/model/auth%20models/register_driver_model/register_driver_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart'
    show AppbarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class DriverImageDetailScreen extends StatefulWidget {
  DriverImageDetailScreen({super.key, required this.model});
  RegisterDriverModel model;

  @override
  State<DriverImageDetailScreen> createState() =>
      _DriverImageDetailScreenState();
}

class _DriverImageDetailScreenState extends State<DriverImageDetailScreen> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              widget.model.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                widget.model.description.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Iconsax.tick_circle),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          widget.model.description[index],
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () async {
                final XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  Navigator.pop(context, File(pickedFile.path));
                }
              },
              child: Text(S.of(context).driver_image_take_picture),
            ),
            SizedBox(height: 15.h),
            Visibility(
              visible: widget.model.isGallerySelectable,
              child: OutlinedButton(
                onPressed: () async {
                  final XFile? image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    Navigator.pop(context, File(image.path));
                  }
                },
                child: Text(S.of(context).driver_image_choose_gallery),
              ),
            ),
            Visibility(
              visible: widget.model.isGallerySelectable,
              child: SizedBox(height: 15.h),
            ),
          ],
        ),
      ),
    );
  }
}
