import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaika_ai/general_widgets/custom_field_components.dart';
import 'package:zaika_ai/general_widgets/primary_button.dart';
import 'package:zaika_ai/utils/extension.dart';
import 'package:zaika_ai/views/authentication/phone_auth/otp_screen.dart';

import '../../../general_widgets/notch_clipper.dart';
import '../../../res/app_colors.dart';
import '../../../routers/router_names.dart';

class PhoneAuthenticationScreen extends StatefulWidget {
  const PhoneAuthenticationScreen({super.key});

  @override
  State<PhoneAuthenticationScreen> createState() =>
      _PhoneAuthenticationScreenState();
}

class _PhoneAuthenticationScreenState extends State<PhoneAuthenticationScreen> {
  CountryCode? _selectedCountryCode;
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Scaffold(backgroundColor: Colors.grey[100], body: Container()),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/phone.png',
              fit: BoxFit.fill,
              height: 380,
            ),
          ),

          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: NotchedClipper(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 800, // adjust height
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        130.height,
                        Image.asset("assets/logo/logo.JPG", height: 60),
                        10.height,
                        RichText(
                          text: TextSpan(
                            text: 'Verify your ',
                            style: TextStyle(
                              color: AppColor.brown,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '\nPhone Number',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.height,
                        Row(
                          children: [
                            CountryCodePicker(
                              onChanged: (countryCode) {
                                setState(() {
                                  _selectedCountryCode = countryCode;
                                });
                              },
                              initialSelection: 'US',
                              favorite: ['+1', 'US'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            Expanded(
                              child: CustomFieldComponents(
                                width: 120.w,
                                hint: "Phone Number",
                                controller: _phoneController,
                              ),
                            ),
                          ],
                        ),
                        26.height,
                        PrimaryButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen()));
                          },
                          childWidget: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                            ),
                          ),
                          bgColor: AppColor.black,
                          gradient: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

