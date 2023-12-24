import 'package:flutter/material.dart';

class photoModel {
  String imgsrc;
  String photographer;

  photoModel({required this.imgsrc, required this.photographer});

  static photoModel fromAPI2App(Map<String, dynamic> photomap) {
    return photoModel(
        imgsrc: (photomap["src"])["portrait"],
        photographer: photomap["photographer"]);
  }
}
