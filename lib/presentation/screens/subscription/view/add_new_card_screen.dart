import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';

import '../../../../core/constrants/app_colors.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/custom_back_btn.dart';
import '../../widgets/custom_text_input_field.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final cardNumberController = TextEditingController();
  final expireDateController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          "Add New Card",
          style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        leading: customBackButton(context),
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.card_logo),
                SizedBox(height: 30),
                // Card Number title
                Text(
                  "Card Number",
                  style: getRegularStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 7),
                // Enter Card Number input field
                CustomTextField(
                  controller: cardNumberController,
                  hintText: "Enter Card Number",
                  //errorText: watch.nameError,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20),
                // Card Holder Name title
                Text(
                  "Card Holder Name",
                  style: getRegularStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 7),
                // Card Holder Name input field
                CustomTextField(
                  controller: cardHolderNameController,
                  hintText: "Enter Card Holder Name",
                  //errorText: watch.nameError,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20),

                // Expired and CVV code section
                Row(
                  children: [
                    Expanded(
                      // Expired title and textinput field
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expired",
                            style: getRegularStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 7),
                          CustomTextField(
                            controller: expireDateController,
                            hintText: "MM/YY",
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15),
                    Expanded(
                      // CVV code title and textinput field
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVV Code",
                            style: getRegularStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 7),
                          CustomTextField(
                            controller: cvvController,
                            hintText: "CVV",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // confirm payment btn
                SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: getElevatedButtonStyle(color: AppColors.BtnColor),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.subSuccessScreen);
                    },
                    child: Text(
                      "Pay Now",
                      style: getSemiBoldStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
