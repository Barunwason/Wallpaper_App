import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api.dart';
import 'package:wallpaper_app/model/photoModel.dart';
import 'package:wallpaper_app/view/widget/customappbar.dart';
import 'package:wallpaper_app/view/widget/searchbar.dart';
import 'package:wallpaper_app/view/widget/catalogue.dart';
import 'package:wallpaper_app/model/categoryModel.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<photoModel> trendingWallList = [];
  List<CategoryModel> CatModList = [];

  @override
  void initState() {
    super.initState();
    // Fetch trending wallpapers and categories when the widget initializes
    GetTrendingwallpaper();
    GetCategories();
  }

  Future<void> GetTrendingwallpaper() async {
    // Fetch trending wallpapers and update the state
    trendingWallList = await APIoperation.getTrendingWallpaper();
    setState(() {});
  }

  Future<void> GetCategories() async {
    // Fetch categories and update CatModList
    CatModList = await APIoperation.getCategoriesList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            searchbar(),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CatModList.length,
                itemBuilder: (context, index) => catalog(
                  categoryImgSrc: CatModList[index].catImgUrl,
                  categoryName: CatModList[index].catName,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 700,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                ),
                itemCount: trendingWallList.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black26,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      trendingWallList[index].imgsrc,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
