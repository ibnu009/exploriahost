import 'package:exploriahost/modules/verification/screen/verification_address_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationSecondScreen extends StatefulWidget {
  const VerificationSecondScreen({Key? key}) : super(key: key);

  @override
  _VerificationSecondScreenState createState() =>
      _VerificationSecondScreenState();
}

class _VerificationSecondScreenState extends State<VerificationSecondScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Verifikasi Data Diri",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Text(
                  "Harap mengisi data diri dengan benar untuk memudahkan tim kami memverifikasi data kamu.",
                  style: ExploriaTheme.bodyText,
                ),
              ),
              _buildTextInputHint("Nama Lengkap*"),
              _buildTextInput(_nameController, 1, null),
              _buildTextInputHint("Headline*"),
              _buildTextInput(
                  _headlineController, 1, "Deksripsi singkat tentang dirimu"),
              _buildTextInputHint("Nomor Telfon Aktif*"),
              _buildTextNumberInput(_phoneController, 1, null),
              _buildTextInputHint("Deskripsi*"),
              _buildTextInput(_descriptionController, 5, "Deksripsikan dirimu"),
              const SizedBox(
                height: 24,
              ),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Lanjut',
                  isEnabled: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (c) => const VerificationAddresscreen(),
                        ),
                      );
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputHint(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 15, 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTextInput(
      TextEditingController? controller, int maxLines, String? hintText) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: TextFormField(
        showCursor: true,
        controller: controller,
        keyboardType: TextInputType.text,
        validator: (value) =>
        value == null || value.isEmpty ? "Field ini tidak boleh kosong" : null,
        maxLines: maxLines,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildTextNumberInput(
      TextEditingController? controller, int maxLines, String? hintText) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: TextFormField(
        showCursor: true,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLines: maxLines,
        cursorColor: Colors.black45,
        validator: (value) =>
        value == null || value.isEmpty ? "Field ini tidak boleh kosong" : null,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
