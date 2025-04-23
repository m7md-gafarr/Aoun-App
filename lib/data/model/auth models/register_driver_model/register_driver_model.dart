class RegisterDriverModel {
  final String title;

  final List<String> description;
  final bool isGallerySelectable;

  RegisterDriverModel({
    required this.title,
    required this.description,
    required this.isGallerySelectable,
  });

  static RegisterDriverModel personalPicture() => RegisterDriverModel(
        title: "Personal Picture",
        description: [
          "Take a recent, high-quality photo of yourself.",
          "Your full face must be clearly visible, without sunglasses or hats.",
          "Use a plain background and good lighting.",
        ],
        isGallerySelectable: false,
      );

  static List<RegisterDriverModel> driverLicense() => [
        RegisterDriverModel(
          title: "Driver License (Front)",
          description: [
            "Capture the front side of your valid driver’s license.",
            "Ensure the photo is not blurry and all text is readable.",
            "Do not cover any part of the license with your fingers.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Driver License (Back)",
          description: [
            "Capture the back side of your valid driver’s license.",
            "Make sure the document is not expired.",
            "Ensure all barcode and security features are visible.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Selfie with License",
          description: [
            "Take a selfie holding your license clearly next to your face.",
            "Make sure both your face and the license details are visible and clear.",
            "Do not use any filters or image enhancements.",
          ],
          isGallerySelectable: true,
        ),
      ];

  static List<RegisterDriverModel> personalDocuments() => [
        RegisterDriverModel(
          title: "National ID (Front)",
          description: [
            "Upload a high-resolution image of the front side of your National ID.",
            "Make sure your name, photo, and ID number are clearly visible.",
            "Avoid shadows or reflections on the card.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "National ID (Back)",
          description: [
            "Upload the back side of your National ID.",
            "Ensure the address and serial number are readable.",
            "Use natural light and place the card on a flat surface.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Criminal Status Record",
          description: [
            "Upload your Criminal Status Record issued within the last 3 months.",
            "Make sure all stamps and signatures are visible.",
            "Ensure the document is fully scanned and not cropped.",
          ],
          isGallerySelectable: true,
        ),
      ];

  static List<RegisterDriverModel> vehicleInformation() => [
        RegisterDriverModel(
          title: "Vehicle Picture",
          description: [
            "Upload a full side view of your vehicle.",
            "Ensure the license plate is visible.",
            "Vehicle must be clean and undamaged.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Vehicle Registration (Front)",
          description: [
            "Upload the front page of the official vehicle registration certificate.",
            "All registration details must be visible and readable.",
          ],
          isGallerySelectable: true,
        ),
        RegisterDriverModel(
          title: "Vehicle Registration (Back)",
          description: [
            "Upload the back page of your vehicle registration.",
            "Ensure the chassis number and expiry date are clear.",
          ],
          isGallerySelectable: true,
        ),
      ];
}
