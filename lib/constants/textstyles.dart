import 'package:flutter/material.dart';

TextStyle appName ({Color ?color , FontWeight? weight}){
  return TextStyle(
    fontSize: 45,
    color: color ??  Colors.white,
    fontWeight: weight ?? FontWeight.bold,
  );
}

TextStyle titleLarge ({Color ?color , FontWeight? weight}){
  return TextStyle(
    fontSize: 30,
    color: color ??  Colors.white,
    fontWeight: weight ?? FontWeight.bold,
  );
}

TextStyle appbarText ({Color ?color , FontWeight? weight}){
  return TextStyle(
    fontSize: 20,
    color: color ??  Colors.white,
    fontWeight: weight ?? FontWeight.bold,
  );
}


TextStyle titleDescription ({Color ?color , FontWeight? weight}){
  return TextStyle(
    fontSize: 20,
    color: color ??  Colors.white,
    fontWeight: weight ?? FontWeight.w300,
  );
}

TextStyle smallText ({Color ?color , FontWeight? weight}){
  return TextStyle(
    fontSize: 15,
    color: color ??  Colors.white,
    fontWeight: weight ?? FontWeight.bold,
  );
}

