import 'package:flutter/material.dart';

String image = "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1578620671/wwa6sd5wyp1wxjrder5i.png";

class BuildBannerList extends StatelessWidget {
  const BuildBannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // String image = ads[index].pictureUrl;
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 330,
              margin: const EdgeInsets.only(left: 18),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(image, fit: BoxFit.cover))),
            ),
          );
        },
      ),
    );
  }
}
