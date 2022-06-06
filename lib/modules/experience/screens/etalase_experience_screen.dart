import 'package:exploriahost/modules/experience/screens/add/add_experience_screen.dart';
import 'package:exploriahost/modules/experience/widgets/etalase_experience_tab.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EtalaseExperienceScreen extends StatefulWidget {
  const EtalaseExperienceScreen({Key? key}) : super(key: key);

  @override
  _EtalaseExperienceScreenState createState() =>
      _EtalaseExperienceScreenState();
}

class _EtalaseExperienceScreenState extends State<EtalaseExperienceScreen>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController tabController;
  int currTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 4,
        vsync: this,
        animationDuration: const Duration(milliseconds: 500));
    tabController.addListener(handleTabSelection);
  }

  void handleTabSelection() {
    if (tabController.indexIsChanging ||
        tabController.index != tabController.previousIndex) {
      setState(() {
        currTab = tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ExploriaTheme.primaryColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Etalase Experience',
            style: ExploriaTheme.bodyText.copyWith(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const AddExperienceScreen()),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          initialIndex: currTab,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: TabBar(
                  isScrollable: true,
                  labelStyle: GoogleFonts.getFont(
                    'Roboto',
                  ),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  indicatorColor: Colors.transparent,
                  controller: tabController,
                  tabs: [
                    _tabItem(0, "All"),
                    _tabItem(1, "Accepted"),
                    _tabItem(2, "Pending"),
                    _tabItem(3, "Rejected")
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    EtalaseExperienceTab(status: "all"),
                    EtalaseExperienceTab(status: "accepted"),
                    EtalaseExperienceTab(status: "pending"),
                    EtalaseExperienceTab(status: "rejected"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem(int index, String title) {
    Color colTab;
    Color colText;
    Color border;

    if (index == currTab) {
      colTab = ExploriaTheme.primaryColor;
      colText = Colors.white;
      border = Colors.transparent;
    } else {
      colTab = Colors.white;
      colText = Colors.black54;
      border = const Color(0xff979797);
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
      decoration: BoxDecoration(
          color: colTab,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border)),
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colText,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
