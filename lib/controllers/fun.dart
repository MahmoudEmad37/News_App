import 'package:clipboard/clipboard.dart';
import 'package:news_app/constant.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun {
  static openLink(String link) async {
    if (!await launch(link)) throw 'Could Not Launch $link';
  }

  static shareLink(String link) {
    Share.share(link);
  }

  static copyLink(String link) {
    FlutterClipboard.copy('News APP $link');
  }

  static changeTheme() {
    if (backGround == backGroundB) {
      backGround = backGroundD;
      textColor = textColorD;
      cardColor = cardColorD;
    } else {
      backGround = backGroundB;
      textColor = textColorB;
      cardColor = cardColorB;
    }
  }
}
