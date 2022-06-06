import 'package:exploriahost/modules/auth/bloc/auth_bloc.dart';
import 'package:exploriahost/modules/auth/bloc/auth_event.dart';
import 'package:exploriahost/modules/auth/helper/auth_delegate.dart';
import 'package:exploriahost/modules/auth/register/screen/register_screen.dart';
import 'package:exploriahost/modules/home/home_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_component.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements AuthDelegate {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AuthBloc();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
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
                    'Masuk',
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
                    "Silahkan masuk ke aplikasi menggunakan akun anda..",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                _buildLoginSection(),
                exploriaPrimaryButton(
                  context: context,
                  text: 'Masuk',
                  isEnabled: true,
                  onPressed: () async {
                    _loginUser();
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Daftar Yuk",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ExploriaTheme.primaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextInputHint("Email"),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: TextField(
            showCursor: true,
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
        _buildTextInputHint("Password"),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: TextField(
            obscureText: !_passwordVisible,
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
        Padding(
          padding: const EdgeInsets.only(left: 210),
          child: TextButton(
              onPressed: () {
                // Lupa Password
              },
              child: const Text(
                "Lupa Password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: ExploriaTheme.primaryColor,
                    decoration: TextDecoration.underline),
              )),
        ),
      ],
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

  void _loginUser() {
    _bloc.add(LoginUser(
        email: _emailController.value.text,
        password: _passwordController.value.text,
        delegate: this));
  }

  @override
  void onError(String message) {
    showFailedDialog(
        context: context,
        title: "Gagal Login",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }

  @override
  void onSuccess() {
    showSuccessDialog(
        context: context,
        title: "Berhasil Login!",
        message: "Selamat datang di aplikasi Exploria",
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
  }

  @override
  void onLoading() {
    showLoadingDialog(context: context);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
