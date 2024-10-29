import 'package:team_giant_hockey/controller/play_online_controller.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/widgets/custom_text.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';

class EnterGameId extends StatelessWidget {
  const EnterGameId({
    super.key,
    // required this.paddleType,
  });
  // final String paddleType;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final _playOnlineController = Get.put(PlayOnlineController());
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            TextFormField(
              controller: _playOnlineController.gameId,
              cursorColor: AppTheme.primaryColor,
              style: GoogleFonts.abhayaLibre(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: AppTheme.whiteColor,
              ),
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.whiteColor,
                  ), // Change this color
                ),
                labelText: "Game ID",
                labelStyle: GoogleFonts.abhayaLibre(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.whiteColor,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30),
              ),
              child: GestureDetector(
                onTap: () {
                  // if (difficultylevels[selected].title == "Easy") {
                  //   Get.to(NewGameScreen(
                  //     gameMode: GameMode.ai,
                  //     speed: 3.0,
                  //     paddleType: widget.paddleType,
                  //   ));
                  // }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_right_sharp,
                      size: 60,
                      color: AppTheme.whiteColor,
                    ),
                    Center(
                        child: Image.asset(
                      ImageConstant.start,
                      scale: 4,
                    )),
                    const Icon(
                      Icons.arrow_left_rounded,
                      size: 60,
                      color: AppTheme.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
