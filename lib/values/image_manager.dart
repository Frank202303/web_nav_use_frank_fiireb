/// Manage all pictures: svg png and gif
/// 1. Save the file in the specified directory
/// 2. Define the name of the file in the app, the type is static String
/// 3. use
/// example: HAImage(HAMediaNames.haLogo)

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HAMediaNames {
  static String appLogo = 'assets/icons/hart.svg';
  static String appSplashLogo = 'assets/icons/icon_white_logo.svg';
  // splash
  static const haLogo = 'assets/images/logo_ha.png';

  //main tab
  static const tabIconHome = 'assets/icons/icon_tab_home.svg';
  static const iconOffersIndicator = 'assets/icons/icon_offers_indicator.svg';
  static const iconChevronBack = 'assets/icons/icon_back_chevron.svg';

  static const imgProfilePicPlaceHolder =
      'assets/images/img_profile_placeholder.png';
  static const imgLoadingImageIndicator = 'assets/images/img_image_loading.gif';

  // Video
  static const videoWelcomePageBackVideo =
      'assets/videos/welcome_page_video.mp4';

  // Home
  static const addMore = 'assets/icons/icon_add_more.svg';
  static const staffAvatar = 'assets/images/img_staff_avatar.png';
  static const heartLogo = 'assets/icons/icon_bg_heart.svg';
  static const privateWorkoutBg = 'assets/images/img_private_workout.png';
  static const privateNutritionBg = 'assets/images/img_private_nutrition.png';

//  Profile
  static const benefitHeader = 'assets/images/img_benefit_header.png';
  static const creditCardAlert = 'assets/icons/ic_credit_alert.svg';

//  Training
  static const longArrow = 'assets/icons/icon_long_arrow.svg';
  static const videoPlay = 'assets/images/ic_video_play.png';
  static const hallowCircle = 'assets/icons/icon_hallow_circle.svg';

//  Nutrition
  static const fillGrayTick = 'assets/icons/icon_fill_gray_tick.svg';
  static const rowViewShortcut = 'assets/images/img_row_view_shortcut.png';

  //  Progress
  static const arrowDownPink = 'assets/icons/icon_arrow_down_circle_pink.svg';
  static const closeButton = 'assets/images/ic_close.png';

  //  Subscription
  static const subscriptionHeader = 'assets/images/img_subscription_header.png';
  static const subscriptionHeaderTwo =
      'assets/images/img_subscription_header_two.png';

  //  quiz
  static const nutritionQuizPop = 'assets/images/img_nutrition_quiz_pop.png';
  static const trainingQuizPop = 'assets/images/img_training_quiz_pop.png';
  static const womenQuizCompleted = 'assets/images/img_women_quiz_complete.png';
}

class HAImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final Color? color;
  final VoidCallback? onTap;

  const HAImage(
    this.imagePath, {
    Key? key,
    this.width,
    this.height,
    this.paddingBottom,
    this.paddingTop,
    this.paddingLeft,
    this.paddingRight,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.endsWith(".svg")) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(paddingLeft ?? 0, paddingTop ?? 0,
              paddingRight ?? 0, paddingBottom ?? 0),
          child: SvgPicture.asset(
            imagePath,
            width: width,
            height: height,
            color: color,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(paddingLeft ?? 0, paddingTop ?? 0,
              paddingRight ?? 0, paddingBottom ?? 0),
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
          ),
        ),
      );
    }
  }
}
