import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:flutter/material.dart';

const String defaultImage = "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1578620671/wwa6sd5wyp1wxjrder5i.png";
class ExploriaImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double? width, height;
  const ExploriaImageNetwork({Key? key, required this.imageUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? defaultImage,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: ExploriaLoading(
            width: 80,
            height: 80,
          ),
        );
      },
    );
  }
}
