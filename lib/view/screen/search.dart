import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widget/customappbar.dart';
import 'package:wallpaper_app/view/widget/searchbar.dart';
import 'package:wallpaper_app/view/widget/catalogue.dart';

class searchscreen extends StatelessWidget {
  const searchscreen({super.key});

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
