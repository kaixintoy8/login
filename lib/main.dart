import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login/kayitol.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super (key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hide = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.lightGreen,
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 40, left: 40),
              child: Text("Hoşgeldiniz", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w300),),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45),
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50))
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Giriş Yap",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400 ),),
                SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                      hintText: "E-mail",
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  obscureText:hide ,
                  decoration: InputDecoration(
                    hintText: "Şifre",
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                      });hide = !hide;
                    }, icon:hide?Icon(Icons.visibility_off):Icon(Icons.visibility),)
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 60)
                      ),
                      onPressed: (){} , child: Text("Giriş Yap")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hesabınz yok mu?"),
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> SignUpPage()));
                    } , child: Text("Kayıt Ol"))
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}

