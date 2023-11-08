import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  const searchbar({super.key});

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
          IconButton(onPressed: (){},icon: Icon(Icons.search)),

        ],
      ),
    );
  }
}
