import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api.dart';
import 'package:wallpaper_app/view/widget/customappbar.dart';
import 'package:wallpaper_app/view/widget/searchbar.dart';
import 'package:wallpaper_app/view/widget/catalogue.dart';
import 'package:wallpaper_app/model/photoModel.dart';

class searchscreen extends StatefulWidget {
  String query;
  searchscreen({super.key, required this.query});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  List<photoModel> searchresult = [];
  void initState() {
    // TODO: implement initState
    getsearchresult();
    super.initState();
  }

  getsearchresult() async {
    searchresult = await APIoperation.Getsearchwallpaper(widget.query);
    print('Search Results: $searchresult');
    setState(() {});
  }

  @override
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 350,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: searchresult.length,
                    itemBuilder: (Context, index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black26),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                fit: BoxFit.cover, searchresult[index].imgsrc),
                          ),
                          height: 40,
                          width: 10,
                        )),
              )
            ],
          ),
        ));
  }
}
