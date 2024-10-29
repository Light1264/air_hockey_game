import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_giant_hockey/core/utils/image_constants.dart';
import 'package:team_giant_hockey/screens/play_onine/enter_Id.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';
import 'package:team_giant_hockey/screens/play_onine/generat_Id.dart';
import '../../new_game/game_enum.dart';
import '../../new_game/new_game_page.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_text.dart';

enum Category {
  generateGameLink,
  enterGameLink,
}

class PlayOnline extends StatefulWidget {
  const PlayOnline({super.key, required this.paddleType});
  final String paddleType;

  @override
  State<PlayOnline> createState() => _PlayOnlineState();
}

late TabController tabController;

class _PlayOnlineState extends State<PlayOnline> with TickerProviderStateMixin {
  int selected = 0;
  int selectedIndex = 0;

    List<Widget> playOnline = const [
    GenerateGameId(),
    EnterGameId()
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  // int puckNumber = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.appBackgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_left_rounded,
            size: 70,
            color: AppTheme.whiteColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Image.asset(
            ImageConstant.playOnline,
            scale: 3.5,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                widget.paddleType,
                scale: 4,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(24)),
              child: SizedBox(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenWidth(346),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(microseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(3),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10),
                          ),
                          height: getProportionateScreenHeight(20),
                          // width:index == 1? getProportionateScreenWidth(126) : getProportionateScreenWidth(40),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppTheme.whiteColor
                                : AppTheme.appBackgroundColor,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selectedIndex == index
                                  ? AppTheme.whiteColor
                                  : AppTheme.appBackgroundColor,
                            ),
                          ),
                          child: Center(
                            child: customNormalText(
                              inputText: tabs[index].title,
                              fontSize: 18,
                              weight: FontWeight.w500,
                              colorName: selectedIndex == index
                                  ? AppTheme.appBackgroundColor
                                  : AppTheme.whiteColor,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            // TabBar(
            //   dividerColor: AppTheme.appBackgroundColor,
            //   enableFeedback: false,
            //   isScrollable: true,
            //   controller: tabController,
            //   onTap: (index) {
            //     tabController.animateTo(
            //       index,
            //       duration: const Duration(seconds: 2),
            //       curve: Curves.easeInOut,
            //     );
            //   },
            //   //padding: EdgeInsets.zero,
            //   indicatorSize: TabBarIndicatorSize.label,
            //   indicatorWeight: 2,
            //   indicatorColor: AppTheme.primaryColor,
            //   labelPadding: EdgeInsets.only(right: 20),
            //   indicatorPadding: EdgeInsets.symmetric(horizontal: 60),
            //   tabs: [
            //     for (Category item in Category.values)
            //       Tab(
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 0),
            //           child: customCentreText(
            //             inputText: item.name.capitalizeFirst.toString(),
            //             fontSize: 20,
            //             weight: FontWeight.w700,
            //             colorName: AppTheme.whiteColor,
            //           ),
            //         ),
            //       ),
            //   ],
            // ),
            const SizedBox(
              height: 8,
            ),
            Expanded(child: playOnline[selectedIndex]),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class TopTabModel {
  final String title;

  TopTabModel({
    required this.title,
  });
}

List<TopTabModel> tabs = [
  TopTabModel(
    title: 'Generate Game ID',
  ),
  TopTabModel(
    title: 'Enter Game ID',
  ),
];
