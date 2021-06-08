import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter01_app/provider/page_notifiler.dart';
import 'package:provider/provider.dart';

class AuthPage extends Page {
  static final String pageNume = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => AuthWidget(),
    );
  }
}

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();

  bool isRegister = false;

  Duration _duration = Duration(milliseconds: 300);



  static final double _cornerRadius = 8.0;

  OutlineInputBorder _border = OutlineInputBorder(
    // 클릭 안한 상태
    borderRadius: BorderRadius.circular(_cornerRadius),
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/bagimg.gif'),
          ),
        ),
        child: Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("로그인 화면"),
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  reverse: true,
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 36,
                      child: Text(
                        '로고 위치',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isRegister = false;
                              });
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: isRegister
                                      ? FontWeight.w400
                                      : FontWeight.w600,
                                  color: isRegister
                                      ? Colors.white38
                                      : Colors.white),
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isRegister = true;
                              });
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: isRegister
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isRegister
                                      ? Colors.white
                                      : Colors.white38),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _buildTextFormField("Email Address", _emailController),
                    SizedBox(
                      height: 8,
                    ),
                    _buildTextFormField("Password", _passwordController),
                    SizedBox(
                      height: 8,
                    ),
                    AnimatedContainer(
                      duration: _duration,
                      child: _buildTextFormField(
                          "Confirm Password", _cPasswordController),
                      height: isRegister?60:0,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print("모든 입력값이 올바르구나!!!");
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_cornerRadius)),
                        padding: EdgeInsets.all(16),
                      ),
                      child: Text(
                        isRegister ? "Register" : "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Divider(
                      height: 31,
                      thickness: 1,
                      color: Colors.white54,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          'assets/google.png',
                          () {},
                        ),
                        _buildSocialButton(
                          'assets/facebook.png',
                          () {},
                        ),
                        _buildSocialButton(
                          'assets/apple.png',
                          () {},
                        ),
                      ],
                    ),
                  ].reversed.toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSocialButton(String imagePath, Function onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white54),
      child: IconButton(
        icon: ImageIcon(AssetImage(imagePath)),
        onPressed: onPressed,
      ),
    );
  }

  TextFormField _buildTextFormField(
      String hintText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      validator: (text) {
        // 원하는 값인지 체크 할수 있는곳
        if (text == null || text.isEmpty) {
          return "입력창이 비어있어요!";
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.black54,
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _border.copyWith(
            borderSide: BorderSide(color: Colors.black, width: 3)),
        errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
