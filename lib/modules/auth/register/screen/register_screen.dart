import 'package:exploriahost/modules/auth/bloc/auth_bloc.dart';
import 'package:exploriahost/modules/auth/bloc/auth_event.dart';
import 'package:exploriahost/modules/auth/helper/auth_delegate.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_component.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements AuthDelegate {
  late AuthBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _passwordVisible = true;
  bool _passwordConfirmVisible = true;

  @override
  void initState() {
    super.initState();
    _bloc = AuthBloc();
    _passwordVisible = false;
    _passwordConfirmVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                    child: Image.asset(
                      'assets/logoexploria.png',
                      height: 80,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 32, 10, 0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: ExploriaTheme.primaryColorDarker,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 8, 24, 5),
                  child: Text(
                    "Bergabung dan membagikan petualangan anda kepada dunia!",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 22,),
                _buildRegisterSection(),
                const SizedBox(height: 22,),
                exploriaPrimaryButton(
                  context: context,
                  text: 'Daftar',
                  isEnabled: true,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _registerUser();
                    }
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login disini",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ExploriaTheme.primaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterSection() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextInputHint("Nama Lengkap"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan nama lengkapmu"
                  : null,
              controller: _fullNameController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          ),
          _buildTextInputHint("Email"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              validator: (value) =>
                  value == null || value.isEmpty ? "Masukkan email mu" : null,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          ),
          _buildTextInputHint("Kata Sandi"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              obscureText: !_passwordVisible,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan Password mu"
                  : value.length < 6
                      ? "Password tidak boleh kurang dari 6 karakter"
                      : null,
              cursorColor: Colors.black45,
              keyboardType: TextInputType.text,
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          _buildTextInputHint("Konfirmasi Kata Sandi"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              obscureText: !_passwordConfirmVisible,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan konfirmasi password mu"
                  : value != _passwordController.value.text
                      ? "Passwordmu tidak sama"
                      : null,
              cursorColor: Colors.black45,
              keyboardType: TextInputType.text,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordConfirmVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordConfirmVisible = !_passwordConfirmVisible;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
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

  void _registerUser() {
    _bloc.add(RegisterUser(
        _fullNameController.value.text,
        _emailController.value.text,
        _passwordController.value.text,
        this));
  }

  @override
  void onError(String message) {
    showFailedDialog(context: context, title: "Gagal Daftar", message: message);
  }

  @override
  void onSuccess() {
    String message =
        "Kamu sudah berhasil mendaftarkan akun mu, sekarang kamu bisa login di aplikas exploria host";
    showSuccessDialog(
        context: context,
        title: "Berhasil Daftar!",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }

  @override
  void onLoading() {
    showLoadingDialog(context: context);
  }
}
