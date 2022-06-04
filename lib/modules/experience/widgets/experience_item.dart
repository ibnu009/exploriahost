import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String imageP = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNGn2ApoDdsvsla7BGl_jx7lZXFoeb0nkvG-oxwdRE9DRvfdshJPE7nZwOOLc1NLKYf_E&usqp=CAU";

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({Key? key}) : super(key: key);

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
                  imageP, width: 80, height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox(height: 12,),
                  const Text(
                    "Sculpting Sulfur With Local Miners",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8,),
                  Row(children: [
                    Text("Rp 250.000", style: ExploriaTheme.title.copyWith(fontSize: 20),),
                    const Text("/orang")
                  ],),
                  Text("Durasi 1 Hari 12 Jam"),
                  const SizedBox(height: 8,),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: _buildIndicator()),
                  const SizedBox(height: 12,),
                ],
              ),
            ),
          ],
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
          border: Border.all(color: Colors.red)
      ),
      child: const Center(
        child: Text("Rejected", textAlign: TextAlign.center, style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        )),
      ),
    );
  }
}
