import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/controllers/fun.dart';
import 'package:url_launcher/url_launcher.dart';

class CardNews extends StatelessWidget {
  var imageUrl;
  var text;
  var link;

  CardNews({required this.imageUrl, required this.text,required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Fun.openLink(link);
      },
      child: Card(
        color: cardColor,
        elevation: 5,
        shadowColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageUrl == null
                      ? NetworkImage(
                          'https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png')
                      : NetworkImage("$imageUrl"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Fun.shareLink(link);
                    },
                    icon: Icon(Icons.share, color: textColor),

                  ),
                  IconButton(
                    onPressed: () {
                      Fun.copyLink(link);
                      showToast('Copyed',
                        context: context,
                        animation: StyledToastAnimation.scale,
                        reverseAnimation: StyledToastAnimation.fade,
                        position: StyledToastPosition(align: Alignment.bottomCenter,offset: 50.0),
                        animDuration: Duration(seconds: 1),
                        duration: Duration(seconds: 4),
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.linear,
                      );
                    },
                    icon: Icon(Icons.copy_rounded, color: textColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
