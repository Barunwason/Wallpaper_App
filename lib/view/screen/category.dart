import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widget/customappbar.dart';
import 'package:wallpaper_app/view/widget/searchbar.dart';
import 'package:wallpaper_app/view/widget/catalogue.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
              SizedBox(height:1),
              Stack(
                children: [
                  Image.network(
                      height:200,
                      width:MediaQuery.of(context).size.width,
                      fit:BoxFit.cover,
                      "https://i.pinimg.com/564x/4c/85/6b/4c856b5a0d4996813f055947f831a9e3.jpg"),
                  Positioned(
                    left: 180,
                    top: 50,
                    child: Column(
                      children: [
                        Text("Category",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "DC",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 350,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: 16,
                    itemBuilder: (Context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26),
                      child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(fit: BoxFit.cover,"https://i.pinimg.com/564x/aa/78/ae/aa78ae59a957d526a09d6e53ecac385c.jpg"),),
                      height: 40,
                      width: 10,
                    )),
              )
            ],
          ),
        ));
  }
}
