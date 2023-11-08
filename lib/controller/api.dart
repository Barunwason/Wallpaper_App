import 'package:http/http.dart' as http;
import 'dart:convert';
class APIoperation {
  static List trendingWallpapers = [];

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
        Map<String, dynamic> src = element["src"];
        print(src["portrait"]);
      });
      });
  }
}
