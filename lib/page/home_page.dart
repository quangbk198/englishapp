import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:englishapp/models/english_today.dart';
import 'package:englishapp/page/control_page.dart';
import 'package:englishapp/values/app_assets.dart';
import 'package:englishapp/values/app_colors.dart';
import 'package:englishapp/values/app_styles.dart';
import 'package:englishapp/widgets/app_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> listWord = [];

  List<int> fixedListRandom({int len = 1, int max = 128, int min = 1}) {
    if (len > max || len < min) return [];

    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while(count <= len) {
      int val = random.nextInt(max);
      if(newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }

    return newList;
  }

  getEnglishToday() {
    List<String> newList = [];
    List<int> randomList = fixedListRandom(len: 5, max: nouns.length);
    randomList.forEach((index) {
      newList.add(nouns[index]);
    });

    listWord = newList.map((nounWord) => EnglishToday(
      "", nounWord, "", true
    )).toList();
  }

  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    getEnglishToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scafoldKey,
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        title: Text(
          'English today',
          style: AppStyles.h3.copyWith(
            color: AppColors.blackGray,
            fontSize: 24
          ),

        ),
        leading: InkWell(
          onTap: () {
            _scafoldKey.currentState?.openDrawer();
          },
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: size.height * 1/10,
              alignment: Alignment.centerLeft,
              child: Text(
                'It is amazing how complete is the delision that beauty is goodness',
                style: AppStyles.h5.copyWith(
                  fontSize: 12,
                  color: AppColors.blackGray
                ),
              ),
            ),
            Container(
              height: size.height * 2/3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: listWord.length,
                itemBuilder: (context, index) {

                  String word =  listWord[index].noun != null ?  listWord[index].noun! : '';

                  String firstLetter = word.substring(0, 1);
                  String leftLetter = word.substring(1, word.length);

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1, 2),
                            blurRadius: 6
                          )
                        ]
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: const TextStyle(
                                  fontFamily: FontFamily.sen,
                                  fontSize: 89,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(3, 6),
                                        blurRadius: 6
                                    )
                                  ]
                              ),
                              text: firstLetter,
                              children: [
                                TextSpan(
                                    style: const TextStyle(
                                        fontFamily: FontFamily.sen,
                                        fontSize: 52,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 6),
                                              blurRadius: 6
                                          )
                                        ]
                                    ),
                                    text: leftLetter
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 10,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildIndicator(index == _currentIndex, size);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          setState(() {
            getEnglishToday();
          });
        },
        child: Image.asset(AppAssets.exchange),
      ),

      drawer: Drawer(
        child: Container(
          color: AppColors.lightBlue,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu',
                  style: AppStyles.h4.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: AppButton(label: 'Your control', onTap: () {
                  _scafoldKey.currentState?.closeDrawer();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ControlPage()));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: isActive ? size.width * 1/5 : 24,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lightBlue : AppColors.lightGrey,
        borderRadius: BorderRadius.all(const Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(2, 3),
              blurRadius: 3
          )
        ]
      ),
    );
  }
}
