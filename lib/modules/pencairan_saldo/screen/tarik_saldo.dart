import 'package:exploriahost/ui/component/dropdown/exploria_dropdown_value.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_generic_dropdown.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class TarikSaldoScreen extends StatefulWidget {
  const TarikSaldoScreen({Key? key}) : super(key: key);

  @override
  _TarikSaldoScreenState createState() => _TarikSaldoScreenState();
}

class _TarikSaldoScreenState extends State<TarikSaldoScreen> {
  String _selectedItem = initialBankItem;
  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "Tarik Saldo",
              style: ExploriaTheme.smallTitle
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(18, 20, 18, 15),
                      child: Text('Masukkan rekening bank kamu untuk kami mencairkan saldo Exploria Host kamu. Harap input rekening bank dengan benar!.', 
                        style: ExploriaTheme.text1,)
                  ),
                  ExploriaGenericTextInputHint(text: 'Jumlah Saldo'),
                  Text('Rp. 100000', style: ExploriaTheme.title.copyWith(fontSize: 16),),
                  ExploriaGenericTextInputHint(text: 'Jumlah Saldo yang Ingin Ditarik'),
                  ExploriaGenericTextInput(controller: _moneyController, inputType: TextInputType.number),
                  _buildDivider(),
                  ExploriaGenericTextInputHint(text: 'Pilih Bank'),
                  ExploriaGenericDropdown(
                      selectedItem: _selectedItem,
                      items: bankItems,
                      onChanged: (String? newVal) {
                        setState(() {
                          _selectedItem = newVal ?? "";
                        });
                      }),
                  ExploriaGenericTextInputHint(text: 'Nomer Rekening'),
                  ExploriaGenericTextInput(controller: _numberController, inputType: TextInputType.number)
                ],
              ),
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