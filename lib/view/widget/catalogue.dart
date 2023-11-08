import 'package:flutter/material.dart';

class catalog extends StatelessWidget {
  const catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ SizedBox( width:7,),
        Container(

            child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                  fit: BoxFit.cover,
                  height: 50,
                  width: 100,
                  "https://images.pexels.com/photos/9962890/pexels-photo-9962890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black26, borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("Marvel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
            )
          ],
        )),
      ],
    );
  }
}
