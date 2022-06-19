import 'package:exploriahost/core/repository/user_repository.dart';
import 'package:exploriahost/modules/auth/login/screen/LoginScreen.dart';
import 'package:exploriahost/modules/onboarding/widget/onboarding_item.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late UserRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = UserRepository.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  PageView(
                    controller: pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      const OnBoardingItem(asset: 'assets/on_boarding_1.jpg', onBoardingText: 'Ikut Bergabung di industri pariwisata dengan potensi penghasilan yang tinggi!'),
                      const OnBoardingItem(asset: 'assets/on_boarding_2.jpg', onBoardingText: 'Kenalkan Budaya, Adat, Kesenian dan keunikan daerahmu kepada wisatawan!'),
                      const OnBoardingItem(asset: 'assets/on_boarding_3.jpg', onBoardingText: 'Tawarkan "Experience" mu dan dapatkan penghasilan'),
                      const OnBoardingItem(asset: 'assets/on_boarding_4.jpg', onBoardingText: 'Ikuti Misi, Dapatkan Poin, dan tukarkan poin dengan hadiah menarik'),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/on_boarding_5.jpg',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x00FFFFFF),
                                  Colors.white
                                ],
                                stops: [0.3, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 96),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Siap memulai petualanganmu?',
                                  style: ExploriaTheme.title1.copyWith(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                    color: Colors.black87
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: exploriaPrimaryButton(context: context, text: "Mulai", isEnabled: true, onPressed: (){
                                    _repository.writeSecureTokenData('intro', "yes");
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  })
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                      child: Row(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 5,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (index) {
                              pageViewController!.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: const ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 16,
                              dotColor: Color(0x94FFFFFF),
                              activeDotColor: Colors.white,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  pageViewController!.animateToPage(
                                    pageViewController!.page!.toInt() + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Text(
                                  'Lanjut',
                                  style: ExploriaTheme.bodyText.copyWith(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}