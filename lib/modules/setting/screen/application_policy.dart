import 'package:exploriahost/modules/setting/screen/privacy_policy.dart';
import 'package:exploriahost/modules/setting/screen/terms_and_condition.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationPolicyScreen extends StatefulWidget {
  const ApplicationPolicyScreen({Key? key}) : super(key: key);

  @override
  _ApplicationPolicyScreenState createState() => _ApplicationPolicyScreenState();
}

class _ApplicationPolicyScreenState extends State<ApplicationPolicyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
            "Kebijakan Aplikasi",
            style: ExploriaTheme.smallTitle,
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColorLighter,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.0,),
                     _buildDivider(),
                     InkWell(
                         onTap: (){
                           Navigator.push(context, CupertinoPageRoute(builder: (c) => const PrivacyPolicy()));
                         },
                         child: ExploriaGenericTextInputHint(text: 'Kebijakan Privasi')),
                     _buildDivider(),
                     InkWell(
                         onTap: (){
                           Navigator.push(context, CupertinoPageRoute(builder: (c) => const TermsAndCondition()));
                         },
                         child: ExploriaGenericTextInputHint(text: 'Syarat dan Ketentuan')),
                     _buildDivider(),
                    ]
                )
            )
        )
    );
  }
  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.black12, thickness: 1),
    );
  }
}