import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:flutter/material.dart';

class ExploriaImageRowNetwork extends StatelessWidget {
  final String imageUrl;
  const ExploriaImageRowNetwork({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Center(
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          color: Colors.black54,
          radius: const Radius.circular(12),
          dashPattern: const [5, 5],
          child: SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ExploriaImageNetwork(imageUrl: "$BASE_URL$imageUrl"),
            ),
          ),
        ),
      ),
    );
  }
}
