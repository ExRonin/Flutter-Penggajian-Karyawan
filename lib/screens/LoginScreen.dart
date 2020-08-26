import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });
    String ip = "192.168.0.1";
    
    try{
    final res = await http.post("http://" + ip + ":3000/api/login", body: {
      // final res = await http.post("https://api-karyawan.herokuapp.com/hanan/login", body: {
        'username': usernameController.text,
        'password': passwordController.text,
      }).timeout(const Duration(seconds: 60));
      print(res); 
      setState(() {
        isLoading = false;
      });
      var result = json.decode(res.body);
      if(result.length > 1){
        Navigator.pushReplacementNamed(
          context, 
          HomeScreen.routeName,
          arguments: ScreenArguments(
            result
          ));
      }else{
        SnackBar(
          content: Text("Username atau password salah!!"),
        );
      }
    }
    catch(err){
      SnackBar(
          content: Text("Tidak bisa terhubung ke server!!"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Form(
            key: _formKey,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
                Text("Aplikasi Penggajian", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),),
                Image.asset("assets/img/logo-company.png", scale: 4,),
                Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Username",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: "Password",
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          login();
                        },
                        child: Text(isLoading ? "Loading..." : "Masuk"),
                      )
                    ],
                  ),
                ),
             ],
           ),
         ),
       ),
    );
  }
}

