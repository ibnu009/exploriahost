import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/experience/experience_etalase_response.dart';
import 'package:exploriahost/modules/experience/screens/detail_experience_screen.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/int_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String imageP = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNGn2ApoDdsvsla7BGl_jx7lZXFoeb0nkvG-oxwdRE9DRvfdshJPE7nZwOOLc1NLKYf_E&usqp=CAU";

class ExperienceItem extends StatelessWidget {
  final Experience experience;

  const ExperienceItem({Key? key, required this.experience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (c) => DetailExperienceScreen(
              uuidExperience: experience.uuidExperience ?? "",
            ),
          ),
        );
      },
      child: Card(
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
                  child: ExploriaImageNetwork(
                    imageUrl: '$BASE_URL${experience.imageUrl}',
                    width: 80,
                    height: 100,
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
                      experience.name ?? "",
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
                          experience.price.toRupiah(),
                          style: ExploriaTheme.title.copyWith(fontSize: 20),
                        ),
                        const Text("/orang")
                      ],
                    ),
                    Text('Durasi ${experience.duration} Jam'),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: _buildIndicator()),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(){
    return Container(
      width: 80,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _statusExperienceColor(experience.accepted))),
      child: Center(
        child: Text(_statusExperience(experience.accepted),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _statusExperienceColor(experience.accepted),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            )),
      ),
    );
  }

  Color _statusExperienceColor(int statusAccepted) {
    switch (statusAccepted) {
      case 0:
        return Colors.red;
      case 1:
        return ExploriaTheme.primaryColor;
      case 2:
        return Colors.orange;
      default:
        return Colors.orange;
    }
  }

  String _statusExperience(int statusAccepted) {
    switch (statusAccepted) {
      case 0:
        return 'Rejected';
      case 1:
        return 'Accepted';
      case 2:
        return 'Pending';
      default:
        return 'Pending';
    }
  }
}
