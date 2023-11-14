import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallpaper_app/model/photoModel.dart';
class APIoperation {
  static List trendingWallpapers = [];
  static List
  static getTrendingWallpaper() async {
    await http.get(
      Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {
        "Authorization":
            "ytmDLMpfaqxwemhJasRTlX65hObj50qszIaW33SwdpA6ptiov50wbSpr"
      },
    ).then((value) {Map<String,dynamic> jsonData=jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos. forEach((element){
      photoModel.fromAPI2App(element);
      });
      });
  }
}
