class RegisterDriverModel {
  final String title;
  final String image;
  final List<String> description;
  final bool isGallerySelectable;

  RegisterDriverModel({
    required this.title,
    required this.image,
    required this.description,
    required this.isGallerySelectable,
  });

  static RegisterDriverModel personalPicture() => RegisterDriverModel(
        title: "Personal Picture",
        image: "assets/images/profile.png",
        description: [
          "Upload a clear profile picture.",
          "Make sure your face is fully visible.",
        ],
        isGallerySelectable: false,
      );

  static List<RegisterDriverModel> driverLicense() => [
        RegisterDriverModel(
          title: "Driver License (Front)",
          image: "assets/images/license_front.png",
          description: [
            "Upload the front side of your driver’s license.",
            "Ensure all details are readable.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Driver License (Back)",
          image: "assets/images/license_back.png",
          description: [
            "Upload the back side of your driver’s license.",
            "Ensure the document is not expired.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Selfie with License",
          image: "assets/images/selfie_license.png",
          description: [
            "Take a selfie holding your license near your face.",
            "Make sure the license details are visible.",
          ],
          isGallerySelectable: true,
        ),
      ];

  static List<RegisterDriverModel> personalDocuments() => [
        RegisterDriverModel(
          title: "National ID (Front)",
          image: "assets/images/id_front.png",
          description: [
            "Upload the front side of your National ID.",
            "Ensure all details are clear and visible.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "National ID (Back)",
          image: "assets/images/id_back.png",
          description: [
            "Upload the back side of your National ID.",
            "Ensure it is not expired.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Criminal Status Record",
          image: "assets/images/criminal_record.png",
          description: [
            "Upload your Criminal Status Record document.",
            "Ensure it is recently issued.",
          ],
          isGallerySelectable: true,
        ),
      ];
  static List<RegisterDriverModel> vehicleInformation() => [
        RegisterDriverModel(
          title: "National ID (Front)",
          image: "assets/images/id_front.png",
          description: [
            "Upload the front side of your National ID.",
            "Ensure all details are clear and visible.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "National ID (Back)",
          image: "assets/images/id_back.png",
          description: [
            "Upload the back side of your National ID.",
            "Ensure it is not expired.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Criminal Status Record",
          image: "assets/images/criminal_record.png",
          description: [
            "Upload your Criminal Status Record document.",
            "Ensure it is recently issued.",
          ],
          isGallerySelectable: true,
        ),
      ];
}
