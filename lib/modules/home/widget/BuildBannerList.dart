import 'package:exploriahost/ui/component/web/web_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> image = [
  "https://pinterpoin.com/wp-content/uploads/2022/03/20220317-sqtf-banner-1.jpg",
  "https://thumbs.dreamstime.com/z/christmas-tours-travel-promo-banner-design-template-vector-illu-illustration-130596950.jpg",
  "https://previews.123rf.com/images/vectorprodesign/vectorprodesign1903/vectorprodesign190300082/124521053-china-travel-concept-with-top-places-to-visit-travel-promo-asia-vector-travel-banner-design-concept-.jpg",
];

List<String> links = [
  "https://jelajahin.com/",
  "https://jelajahin.com/pages-exploria-host.html",
  "https://jelajahin.com/pages-exploria-adventurer.html",
];

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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (c) => WebViewScreen(
                    url: links[index],
                  ),
                ),
              );
            },
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
                      child: Image.network(image[index], fit: BoxFit.cover))),
            ),
          );
        },
      ),
    );
  }
}
