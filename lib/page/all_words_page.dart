import 'package:englishapp/models/english_today.dart';
import 'package:englishapp/values/app_colors.dart';
import 'package:englishapp/values/app_styles.dart';
import 'package:flutter/material.dart';

import '../values/app_assets.dart';

class AllWordsPage extends StatelessWidget {
  final List<EnglishToday> words;

  const AllWordsPage({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        title: Text(
          'All words',
          style:
          AppStyles.h3.copyWith(color: AppColors.blackGray, fontSize: 24),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: words.map((e) => Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Text(
              e.noun ?? '',
              style: AppStyles.h4.copyWith(
                shadows: [
                  const BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1.5, 1.5),
                      blurRadius: 3
                  )
                ]
              ),
            ),
          )).toList(),
        )
      ),
    );
  }
}
