import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_back_btn.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_text_input_field.dart';

import '../../../../core/constrants/app_colors.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/routes/route_name.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final promoCode = TextEditingController();
  String selectedMethod = "visa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          "Confirmation",
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // feature card
                children: [
                  featuresCardWidget(),
                  SizedBox(height: 15),

                  // Choose Payment Method title
                  Text(
                    "Choose Payment Method",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  // Choose Payment Method
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      paymentMethodBoxWidget(AppImages.visa_logo, "visa"),
                      SizedBox(width: 12),
                      paymentMethodBoxWidget(AppImages.money_logo, "money"),
                      SizedBox(width: 12),
                      paymentMethodBoxWidget(
                        AppImages.exportMoney_logo,
                        "export",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Promo code",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  // promo code input field
                  CustomTextField(
                    controller: promoCode,
                    hintText: "Promo code",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.BtnColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Apply",
                            style: getMediumStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Payment Details title
                  Text(
                    "Payment Details",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  // sub total title
                  Text(
                    "Payment Details",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  // price
                  paymentTitleAndAmountWidget("Price", "\$119.98"),
                  // Tax
                  paymentTitleAndAmountWidget("Tax", "\$1.5"),

                  // app fee
                  paymentTitleAndAmountWidget("App fee", "\$1"),
                  SizedBox(height: 10),
                  // Divider
                  Divider(),
                  SizedBox(height: 10),
                  ListTile(
                    minLeadingWidth: 2,
                    visualDensity: const VisualDensity(vertical: -4),
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      "Total",
                      style: getRegularStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      "\$",
                      style: getSemiBoldStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.addNewCardScreen,
                        );
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
      ),
    );
  }

  // Payment title and Amount widget
  ListTile paymentTitleAndAmountWidget(String title, String money) {
    return ListTile(
      minLeadingWidth: 2,
      visualDensity: const VisualDensity(vertical: -4),
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Text(title, style: getRegularStyle(color: Colors.grey)),
      trailing: Text(money, style: getSemiBoldStyle(color: Colors.white)),
    );
  }

  // .....................Payment method widget...........................
  Widget paymentMethodBoxWidget(String assetsPath, String methodName) {
    bool isSelected = selectedMethod == methodName;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = methodName;
        });
      },
      child: Container(
        width: 75,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white.withOpacity(0.4),
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(assetsPath, fit: BoxFit.contain),
      ),
    );
  }

  // features card widget
  Widget featuresCardWidget() {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Features you’ll get",
                style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 8),
              customListTile("Man City last 5: W W W D W (avg xG 2.1)"),
              customListTile(
                "Arsenal missing LB — conceded 1.4 goals avg without him",
              ),
              customListTile(
                "Head-to-head last 10: City 6 / Arsenal 2 / Draw 2",
              ),
              customListTile(
                "Home advantage: 78% win rate at Etihad this season",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom ListTile
  ListTile customListTile(String title) {
    return ListTile(
      minLeadingWidth: 2,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.lightbulb_outline, color: AppColors.BtnColor),
      title: Text(
        title,
        style: getRegularStyle(color: Colors.grey.shade400, fontSize: 14),
      ),
    );
  }
}
