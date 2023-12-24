import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screen/search.dart';
class searchbar extends StatelessWidget {
  searchbar({super.key});
  TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Expanded(

            child: TextField(
              controller: _searchcontroller,
              decoration: InputDecoration(
                hintText: "Search Wallpaper",
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>searchscreen(query: _searchcontroller.text)));
            },
            child: Icon(Icons.search),
          )

        ],
      ),
    );
  }
}
