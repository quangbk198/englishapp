import 'package:englishapp/values/app_assets.dart';
import 'package:englishapp/values/app_colors.dart';
import 'package:englishapp/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);  // Hide navigation bar and status bar
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome to',
                    style: AppStyles.h3,
                  ),
                )
            ),
            Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'English',
                        style: AppStyles.h2.copyWith(
                          color: AppColors.blackGray,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          'Quotes',
                          textAlign: TextAlign.end,
                          style: AppStyles.h4.copyWith(height: 0.5),
                        ),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: RawMaterialButton(
                    shape: const CircleBorder(),
                    fillColor: AppColors.lightBlue,
                    onPressed: () {},
                    child: Image.asset(AppAssets.rightArrow),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
