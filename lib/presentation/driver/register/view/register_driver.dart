import 'dart:io';

import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/register_driver_model/register_driver_model.dart';
import 'package:aoun_app/presentation/driver/register/view/image_detail.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class RegisterDriverScreen extends StatefulWidget {
  const RegisterDriverScreen({super.key});

  @override
  State<RegisterDriverScreen> createState() => _RegisterDriverScreenState();
}

class _RegisterDriverScreenState extends State<RegisterDriverScreen> {
  late PageController _pageController;
  late TextEditingController _dateOfBirthController;
  late TextEditingController _dateExpirationDateController;
  int _currentPage = 1;
  File? _personalImageFile;
  File? _driverLicenseFront;
  File? _driverLicenseBack;
  File? _selfieWithLicense;
  File? _nationalID;
  File? _nationalIDBack;
  File? _criminalStatusRecord;
  File? _vehiclePicture;
  File? _vehicleRegistrationCertificate;
  File? _vehicleRegistrationBack;
  _selectDateOfBirth() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateOfBirthController.text =
            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

        if (DateTime.now().month < pickedDate.month ||
            (DateTime.now().month == pickedDate.month &&
                DateTime.now().day < pickedDate.day)) {}
      });
    }
  }

  _selectExpirationDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateExpirationDateController.text =
            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

        if (DateTime.now().month < pickedDate.month ||
            (DateTime.now().month == pickedDate.month &&
                DateTime.now().day < pickedDate.day)) {}
      });
    }
  }

  @override
  void initState() {
    _pageController = PageController();
    _dateOfBirthController = TextEditingController();
    _dateExpirationDateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Create Driver account",
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index + 1;
              });
            },
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _personalInformationWidget(),
              _driverLicenseWidget(),
              _personalDocumentsWidget(),
              _vehicleInformationWidget(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "$_currentPage",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              " of ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Text(
              "4",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            SizedBox(
              width: 50.w,
              child: OutlinedButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(
                  isRTL(context) ? Iconsax.backward : Iconsax.arrow_left_2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            SizedBox(
              width: 120.w,
              child: ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );

                  if (_currentPage == 4) {
                    Navigator.pushNamed(
                        context, AppRoutesName.homeDriverScreenRoute);
                  }
                },
                child: Text(_currentPage == 4 ? "Register" : "Next"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _personalInformationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Personal information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            Center(
              child: _containerAddImageWidget(
                onTap: () async {
                  final File? image = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDetailScreen(
                        model: RegisterDriverModel.personalPicture(),
                      ),
                    ),
                  );

                  if (image != null) {
                    setState(() {
                      _personalImageFile = image;
                    });
                  }
                },
                title: "Personal picture",
                imageFile: _personalImageFile,
              ),
            ),
            SizedBox(height: 40.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "First name",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Surname",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              keyboardType: TextInputType.datetime,
              controller: _dateOfBirthController,
              readOnly: true,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: _selectDateOfBirth,
                    icon: Icon(Iconsax.calendar_1)),
                hintText: "Date of birth",
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _driverLicenseWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Driver License",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _containerAddImageWidget(
                  onTap: () async {
                    final File? image = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetailScreen(
                          model: RegisterDriverModel.driverLicense()[0],
                        ),
                      ),
                    );

                    if (image != null) {
                      setState(() {
                        _driverLicenseFront = image;
                      });
                    }
                  },
                  imageFile: _driverLicenseFront,
                  title: "Driver license",
                ),
                _containerAddImageWidget(
                  onTap: () async {
                    final File? image = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetailScreen(
                          model: RegisterDriverModel.driverLicense()[1],
                        ),
                      ),
                    );

                    if (image != null) {
                      setState(() {
                        _driverLicenseBack = image;
                      });
                    }
                  },
                  imageFile: _driverLicenseBack,
                  title: "Back side of license",
                ),
                _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailScreen(
                            model: RegisterDriverModel.driverLicense()[2],
                          ),
                        ),
                      );

                      if (image != null) {
                        setState(() {
                          _selfieWithLicense = image;
                        });
                      }
                    },
                    imageFile: _selfieWithLicense,
                    title: "Selfie with license"),
              ],
            )),
            SizedBox(height: 40.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "License number",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              keyboardType: TextInputType.datetime,
              controller: _dateExpirationDateController,
              readOnly: true,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: _selectExpirationDate,
                    icon: Icon(Iconsax.calendar_1)),
                hintText: "Expiration date",
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _personalDocumentsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Personal documents",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _containerAddImageWidget(
                  onTap: () async {
                    final File? image = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetailScreen(
                          model: RegisterDriverModel.personalDocuments()[0],
                        ),
                      ),
                    );

                    if (image != null) {
                      setState(() {
                        _nationalID = image;
                      });
                    }
                  },
                  imageFile: _nationalID,
                  title: "National ID",
                ),
                _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailScreen(
                            model: RegisterDriverModel.personalDocuments()[1],
                          ),
                        ),
                      );

                      if (image != null) {
                        setState(() {
                          _nationalIDBack = image;
                        });
                      }
                    },
                    imageFile: _nationalIDBack,
                    title: "Back Side of ID"),
                _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailScreen(
                            model: RegisterDriverModel.personalDocuments()[2],
                          ),
                        ),
                      );

                      if (image != null) {
                        setState(() {
                          _criminalStatusRecord = image;
                        });
                      }
                    },
                    imageFile: _criminalStatusRecord,
                    title: "Criminal Status Record"),
              ],
            )),
            SizedBox(height: 40.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "ID number",
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _vehicleInformationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Vehicle information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailScreen(
                            model: RegisterDriverModel.vehicleInformation()[0],
                          ),
                        ),
                      );
                      if (image != null) {
                        setState(() {
                          _vehiclePicture = image;
                        });
                      }
                    },
                    imageFile: _vehiclePicture,
                    title: "Vehicle picture"),
                _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailScreen(
                            model: RegisterDriverModel.vehicleInformation()[1],
                          ),
                        ),
                      );
                      if (image != null) {
                        setState(() {
                          _vehicleRegistrationCertificate = image;
                        });
                      }
                    },
                    imageFile: _vehicleRegistrationCertificate,
                    title: "Vehicle registration certificate"),
                _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageDetailScreen(
                            model: RegisterDriverModel.vehicleInformation()[2],
                          ),
                        ),
                      );
                      if (image != null) {
                        setState(() {
                          _vehicleRegistrationBack = image;
                        });
                      }
                    },
                    imageFile: _vehicleRegistrationBack,
                    title: "Back side of certificate"),
              ],
            )),
            SizedBox(height: 40.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Vehicle brand",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Vehicle model",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Vehicle color",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Production year",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Plate number",
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorMaxLines: 2,
                hintText: "Number seats",
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _containerAddImageWidget({
    required String title,
    required void Function()? onTap,
    File? imageFile,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height: 120.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Icon(
                        Iconsax.add,
                        size: 35.w,
                      ),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        ),
        Visibility(
          visible: imageFile == null ? false : true,
          child: Positioned(
            top: -15,
            right: -15,
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Icon(
                  Iconsax.add,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
