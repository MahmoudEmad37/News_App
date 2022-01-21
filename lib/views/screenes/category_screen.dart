import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/controllers/api.dart';
import 'package:news_app/controllers/fun.dart';
import 'package:news_app/views/widgets/card_news.dart';

class CategoryScreen extends StatefulWidget {
  String category;

  CategoryScreen({required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
              padding: const EdgeInsets.only(top: 30.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.category} News',
                    style: TextStyle(color: textColor, fontSize: fontxlarge),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          Fun.changeTheme();
                        });
                      },
                      icon: backGround == backGroundB
                          ? Icon(
                              Icons.dark_mode,
                              color: textColor,
                            )
                          : Icon(
                              Icons.light_mode,
                              color: textColor,
                            ))
                ],
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: API.fetchCategoriesNews(widget.category.toLowerCase()),
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
