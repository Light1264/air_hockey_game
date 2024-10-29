import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/widgets/size_config.dart';
import 'package:share_plus/share_plus.dart';
import '../../controller/play_online_controller.dart';
import '../../services/app_api_clent.dart';
import '../../widgets/custom_text.dart';

class GenerateGameId extends StatefulWidget {
  const GenerateGameId({
    super.key,
    // required this.paddleType,
  });

  @override
  State<GenerateGameId> createState() => _GenerateGameIdState();
}

class _GenerateGameIdState extends State<GenerateGameId> {
  // final String paddleType;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final _playOnlineController = Get.put(PlayOnlineController());
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          customNormalText(
            inputText: "Generate game Id to share and play with friends online",
            fontSize: getProportionateScreenWidth(16),
            weight: FontWeight.bold,
            colorName: AppTheme.whiteColor,
          ),
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),
          _playOnlineController.generateId.value == ''
              ? const SizedBox()
              : Container(
                  height: 50,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.whiteColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SelectableText(
                        _playOnlineController.generateId.value,
                        style: GoogleFonts.abhayaLibre(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                          color: AppTheme.whiteColor,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          shareMethod(
                              context, _playOnlineController.generateId.value);
                        },
                        child: Icon(
                          Icons.share_rounded,
                          color: AppTheme.primaryColor,
                          size: getProportionateScreenWidth(31),
                        ),
                      ),
                    ],
                  ),
                ),
          _playOnlineController.generateId.value == ''
              ? const SizedBox()
              : SizedBox(
                  height: getProportionateScreenHeight(100),
                ),
          _playOnlineController.generateId.value == ''
              ? GestureDetector(
                  onTap: () async {
                    // _playOnlineController.generateGameId();
                    print(_playOnlineController.generateId.value);
                    // generateId.value = "30";
                    ApiClient apiClient = ApiClient();
                    dynamic response = await apiClient.generateGameId();
                    print("Generated game response $response");

                    if (response["success"] == true) {
                      _playOnlineController.generateId.value =
                          response["data"]["game_id"].toString();
                      print(_playOnlineController.generateId.value);
                    }
                    setState(() {});
                    print("------- ${_playOnlineController.generateId.value}");
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
                        ImageConstant.generate,
                        scale: 4,
                      )),
                      const Icon(
                        Icons.arrow_left_rounded,
                        size: 60,
                        color: AppTheme.whiteColor,
                      ),
                    ],
                  ),
                )
              : Padding(
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
    );
  }

  shareMethod(context, content) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      content,
      subject: "Game ID",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
