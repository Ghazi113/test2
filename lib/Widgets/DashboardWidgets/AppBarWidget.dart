import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar buildAppBar(BuildContext context){
  const icon=CupertinoIcons.moon_stars;
  return AppBar(
    //backgroundColor: Colors.transparent,
    title: const Text(
        'BusWay',
        // 4
        //style: TextStyle(color: Colors.black),
      ),
    elevation: 0,
    actions: [
      IconButton(icon: Icon(icon), onPressed: (){},)
    ],
  );
}