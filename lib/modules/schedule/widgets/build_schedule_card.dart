import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class BuildScheduleCard extends StatelessWidget {
  final String image, name, price, durasi;
  const BuildScheduleCard({Key? key, required this.name, required this.price, required this.durasi, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '$BASE_URL$image',
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: ExploriaTheme.title.copyWith(fontSize: 20),
                      ),
                      const Text("/orang")
                    ],
                  ),
                  Text(durasi),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
