import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/controllers/api.dart';
import 'package:news_app/controllers/fun.dart';
import 'package:news_app/views/widgets/card_news.dart';
import 'package:news_app/views/widgets/categories_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 10.0, left: 15.0, top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose News Categories",
                    style: TextStyle(
                        color: textColor,
                        fontSize: fontlarge,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          Fun.changeTheme();
                        });
                      },
                      icon:backGround == backGroundB? Icon(Icons.dark_mode,color: textColor,):Icon(Icons.light_mode,color: textColor,))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 14,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoriesBoutton(color: blue, text: "General"),
                  CategoriesBoutton(color: orangeDark, text: "Science"),
                  CategoriesBoutton(color: green, text: "Business"),
                  CategoriesBoutton(color: orangeLight, text: "Health"),
                  CategoriesBoutton(color: red, text: "Sports"),
                  CategoriesBoutton(color: yellow, text: "Technology"),
                  CategoriesBoutton(color: brown, text: "Entertainment"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'Best News',
                style: TextStyle(color: textColor, fontSize: fontlarge),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: API.fetchNews(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.data != null
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: CardNews(
                              text: snapshot.data[index].title,
                              imageUrl: snapshot.data[index].urlToImage,
                              link: snapshot.data[index].url,
                            ),
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ))
          ],
        ),
      ),
    );
  }
}
