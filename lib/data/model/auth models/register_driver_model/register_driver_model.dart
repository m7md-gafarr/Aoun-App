import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class RegisterDriverModel {
  final String title;
  final List<String> description;
  final bool isGallerySelectable;

  RegisterDriverModel({
    required this.title,
    required this.description,
    required this.isGallerySelectable,
  });

  static RegisterDriverModel personalPicture(BuildContext context) =>
      RegisterDriverModel(
        title: S.of(context).driver_register_personal_picture_title,
        description: [
          S.of(context).driver_register_personal_picture_desc_1,
          S.of(context).driver_register_personal_picture_desc_2,
          S.of(context).driver_register_personal_picture_desc_3,
        ],
        isGallerySelectable: false,
      );

  static List<RegisterDriverModel> driverLicense(BuildContext context) => [
        RegisterDriverModel(
          title: S.of(context).driver_register_license_front_title,
          description: [
            S.of(context).driver_register_license_front_desc_1,
            S.of(context).driver_register_license_front_desc_2,
            S.of(context).driver_register_license_front_desc_3,
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: S.of(context).driver_register_license_back_title,
          description: [
            S.of(context).driver_register_license_back_desc_1,
            S.of(context).driver_register_license_back_desc_2,
            S.of(context).driver_register_license_back_desc_3,
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: S.of(context).driver_register_license_selfie_title,
          description: [
            S.of(context).driver_register_license_selfie_desc_1,
            S.of(context).driver_register_license_selfie_desc_2,
            S.of(context).driver_register_license_selfie_desc_3,
          ],
          isGallerySelectable: true,
        ),
      ];

  static List<RegisterDriverModel> personalDocuments(BuildContext context) => [
        RegisterDriverModel(
          title: S.of(context).driver_register_id_front_title,
          description: [
            S.of(context).driver_register_id_front_desc_1,
            S.of(context).driver_register_id_front_desc_2,
            S.of(context).driver_register_id_front_desc_3,
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: S.of(context).driver_register_id_back_title,
          description: [
            S.of(context).driver_register_id_back_desc_1,
            S.of(context).driver_register_id_back_desc_2,
            S.of(context).driver_register_id_back_desc_3,
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: S.of(context).driver_register_criminal_record_title,
          description: [
            S.of(context).driver_register_criminal_record_desc_1,
            S.of(context).driver_register_criminal_record_desc_2,
            S.of(context).driver_register_criminal_record_desc_3,
          ],
          isGallerySelectable: true,
        ),
      ];

  static List<RegisterDriverModel> vehicleInformation(BuildContext context) => [
        RegisterDriverModel(
          title: S.of(context).driver_register_vehicle_picture_title,
          description: [
            S.of(context).driver_register_vehicle_picture_desc_1,
            S.of(context).driver_register_vehicle_picture_desc_2,
            S.of(context).driver_register_vehicle_picture_desc_3,
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: S.of(context).driver_register_vehicle_reg_front_title,
          description: [
            S.of(context).driver_register_vehicle_reg_front_desc_1,
            S.of(context).driver_register_vehicle_reg_front_desc_2,
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: S.of(context).driver_register_vehicle_reg_back_title,
          description: [
            S.of(context).driver_register_vehicle_reg_back_desc_1,
            S.of(context).driver_register_vehicle_reg_back_desc_2,
          ],
          isGallerySelectable: true,
        ),
      ];
}
