import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';

import '../../../../core/constrants/app_images.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/custom_back_btn.dart';
import '../../widgets/custom_text_input_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final locatonController = TextEditingController();
  String selectedGender = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: customBackButton(context),
        title: Text(
          "Profile",
          style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile
                  Center(
                    child: InkWell(
                      onTap: () {
                        _showPickImageDialog(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(1.5),
                        decoration: const BoxDecoration(
                          color: Color(0xFF00E676),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(AppImages.profile),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // first name title
                  Text(
                    "First Name",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // first name input field
                  CustomTextField(
                    controller: fNameController,
                    hintText: "Jone",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 10),
                  // last name title
                  Text(
                    "Last Name",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // last name input field
                  CustomTextField(
                    controller: lNameController,
                    hintText: "Doe",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 10),
                  // email title
                  Text(
                    "Email",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // email input field
                  CustomTextField(
                    controller: emailController,
                    hintText: "@gmail.com",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 10),
                  // dob title
                  Text(
                    "Date of Birth",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // dob input field
                  CustomTextField(
                    controller: dobController,
                    hintText: "20 February 1999",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2026),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            dobController.text =
                                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  // location title
                  Text(
                    "Location",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // location input field
                  CustomTextField(
                    controller: locatonController,
                    hintText: "Las Vegas, USA",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // gender title
                  Text(
                    "Gender",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // gender select
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      genderWidget("Male"),
                      SizedBox(width: 10),
                      genderWidget("Female"),
                    ],
                  ),
                  SizedBox(height: 30),

                  // continue button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: () {},
                      child: Text(
                        "Save Change",
                        style: getSemiBoldStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // gender Card Widget
  Expanded genderWidget(String gender) {
    bool isSelected = selectedGender == gender;
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 4, right: 12),
          horizontalTitleGap: 0,
          leading: Checkbox(
            value: isSelected,
            shape: const CircleBorder(),
            checkColor: Colors.white,
            activeColor: AppColors.BtnColor,
            onChanged: (bool? value) {
              setState(() {
                selectedGender = gender;
              });
            },
          ),
          title: Text(
            gender,
            style: getRegularStyle(color: ColorManager.hintText),
          ),
        ),
      ),
    );
  }

  // image picker popup
  void _showPickImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ), // Adjust blur intensity
          child: Dialog(
            backgroundColor: const Color(0xFF101407),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Change your picture",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  _dialogOption(Icons.camera_alt, "Take Image", () {
                    // Logic for camera
                    Navigator.pop(context);
                  }),
                  const SizedBox(height: 10),
                  _dialogOption(Icons.photo_library, "Choose from Gallery", () {
                    // Logic for gallery
                    Navigator.pop(context);
                  }),
                  const SizedBox(height: 10),
                  _dialogOption(Icons.delete, "Remove Image", () {
                    // Logic for delete
                    Navigator.pop(context);
                  }, isDelete: true),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper for the dialog buttons
  Widget _dialogOption(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isDelete = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: ListTile(
        leading: Icon(icon, color: isDelete ? Colors.red : Colors.white),
        title: Text(
          title,
          style: getRegularStyle(color: isDelete ? Colors.red : Colors.white),
        ),
        onTap: onTap,
      ),
    );
  }
}
