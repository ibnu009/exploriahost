import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:flutter/material.dart';

class EditNameProfile extends StatefulWidget {
  const EditNameProfile({Key? key}) : super(key: key);

  @override
  _EditNameProfileState createState() => _EditNameProfileState();
}

class _EditNameProfileState extends State<EditNameProfile> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
              "Data Nama",
              style: TextStyle(color: Colors.white, fontSize: 14)
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 15),
                  child: Text('Harap menggunakan nama asli untuk memudahkan menjual Experience kamu.')
              ),
              _buildTextInputHint('Nama'),
              Container(
                height: 55.0,
                padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: TextField(
                  showCursor: true,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintStyle: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 20.0),
                child: exploriaPrimaryButton(
                  context: context,
                  text: 'Simpan',
                  isEnabled: true,
                  onPressed: () {},
                ),
              )
            ]
        )
    );
  }

  Widget _buildTextInputHint(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 15, 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}