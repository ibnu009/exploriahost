import 'package:exploriahost/ui/component/expansion/exploria_expansion_value.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class ExploriaExpansionPanel extends StatefulWidget {
  const ExploriaExpansionPanel({Key? key}) : super(key: key);

  @override
  _ExploriaExpansionPanelState createState() => _ExploriaExpansionPanelState();
}

class _ExploriaExpansionPanelState extends State<ExploriaExpansionPanel> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemData.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionPanelList(
          elevation: 0,
          animationDuration: Duration(milliseconds: 400),
          expandedHeaderPadding: EdgeInsets.only(top: 5),
          children: [
            ExpansionPanel(
              backgroundColor: itemData[index].expanded == true ? ExploriaTheme.primaryColorBrighter : Colors.white24,
              canTapOnHeader: true,
              body: Container(
                color: itemData[index].expanded == true ? ExploriaTheme.primaryColorVeryBrighter : Colors.white24,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 8),
                child: Text(
                  itemData[index].discription,
                  style: ExploriaTheme.text1,),
              ),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Text(
                    itemData[index].headerItem,
                    style: ExploriaTheme.smallTitle,
                  ),
                );
              },
              isExpanded: itemData[index].expanded,
            )
          ],
          expansionCallback: (int item, bool status) {
            setState(() {
              itemData[index].expanded = !itemData[index].expanded;
            });
          },
        );
      },
    );
  }
}