import 'package:bwa_cozy/auth.dart';
import 'package:bwa_cozy/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/models/background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bwa_cozy/models/dummy_data.dart';
import 'register_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();
  loginCheck() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("isUser") != null && prefs.getBool("isUser") == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(labelText: "Username/email"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _pass,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Forgot your password?",
                style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textStyle: TextStyle(color: Colors.white),
                  padding: const EdgeInsets.all(0),
                ),
                child: GestureDetector(
                  onTap: () async {
                    AuthenticationService service =
                        AuthenticationService(FirebaseAuth.instance);
                    bool res = await service.signIn(
                        email: _username.text, password: _pass.text);
                    if (res) {
                      final prefs = await SharedPreferences.getInstance();
                      var user = await service.getCurrentUser();
                      prefs.setBool("isUser", true);
                      prefs.setString("displayName", user.displayName);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    }
                  },

                  // _login, //() => {Navigator.push(context,MaterialPageRoute(builder: (context) => MainPage()))},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(
                            colors: [Colors.blue, Colors.purple])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                // onTap: () => {
                //   //Navigator.push(context,MaterialPageRoute(builder: (context) => ))
                // },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    if (_cekUsers()) {
      saveUser(_username.text, _pass.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      for (var item in DummyData.data) {
        if (item.containsValue(_username.text) &&
            item.containsValue(_pass.text)) {
          prefs.setInt("user_id", item["id"]);
        }
      }
      ;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal Login"),
        ),
      );
    }
  }

  void saveUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isUser', true);
  }

  bool _cekUsers() {
    for (Map<String, dynamic> item in DummyData.data) {
      if (item["username"] == _username.text &&
          item["password"] == _pass.text) {
        return true;
      }
    }
    return false;
  }
}
