import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/views/screenes/category_screen.dart';

class CategoriesBoutton extends StatelessWidget {
  Color color;
  String text;


  CategoriesBoutton({required this.color,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5,vertical: 5.0),
      child: RaisedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return CategoryScreen(category: text);
          }));
        },
        color: color,
        child: Text('$text',style: TextStyle(
          fontWeight: FontWeight.w800,color: white,
        ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
