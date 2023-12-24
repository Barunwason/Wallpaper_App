import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:wallpaper_app/model/photoModel.dart';
import 'package:wallpaper_app/model/categoryModel.dart';
import 'package:wallpaper_app/view/screen/search.dart';

class APIoperation {
  static List<photoModel> trendingWallpapers = [];
  static List<photoModel> searchWallpapers = [];
  static List<CategoryModel> categoryModelList = [];

  static Future<List<photoModel>> getTrendingWallpaper() async {
    await http.get(
      Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {
        "Authorization":
            "ytmDLMpfaqxwemhJasRTlX65hObj50qszIaW33SwdpA6ptiov50wbSpr"
      },
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(photoModel.fromAPI2App(element));
      });
    });
    return trendingWallpapers;
  }

  static Future<List<photoModel>> Getsearchwallpaper(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "ytmDLMpfaqxwemhJasRTlX65hObj50qszIaW33SwdpA6ptiov50wbSpr"
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List photos = jsonData['photos'];
        List<photoModel> searchWallpapers = [];

        photos.forEach((element) {
          searchWallpapers.add(photoModel.fromAPI2App(element));
        });

        return searchWallpapers;
      } else {
        print('Failed to fetch search wallpapers: ${response.statusCode}');
        return []; // Return an empty list in case of a failed response
      }
    } catch (e) {
      print('Error fetching search wallpapers: $e');
      return []; // Return an empty list in case of an error
    }
  }

  static Future<List<CategoryModel>> getCategoriesList() async {
    List<String> categoryNameList = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];
    categoryModelList.clear();

    for (var catName in categoryNameList) {
      try {
        List<photoModel> photos = await Getsearchwallpaper(catName);
        final _random = Random();
        int index = _random.nextInt(photos.length);
        String imgUrl = photos[index].imgsrc;
        categoryModelList.add(CategoryModel(catImgUrl: imgUrl, catName: catName));
      } catch (e) {
        print('Error fetching category $catName: $e');
      }
    }

    return categoryModelList;
  }
}