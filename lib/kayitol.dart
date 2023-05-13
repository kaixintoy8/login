
import 'package:flutter/material.dart';
import 'package:login/main.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({Key? key}) : super (key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hide = true;
  TextEditingController sifre = TextEditingController();
  TextEditingController sifretekrari = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  Colors.lightGreen,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: Text("Yeni Hesap \nYarat", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w300),),
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
                Text("Kayıt Ol",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400 ),),
                SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "E-mail",
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: sifre,
                  obscureText:hide ,
                  decoration: InputDecoration(
                      hintText: "Şifre",
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                        });hide = !hide;
                      }, icon:hide?Icon(Icons.visibility_off):Icon(Icons.visibility),)
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: sifretekrari,
                  obscureText:hide ,
                  decoration: InputDecoration(
                      hintText: "Şifre Tekrarı",
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                        });hide = !hide;
                      }, icon:hide?Icon(Icons.visibility_off):Icon(Icons.visibility),)
                  ),
                ),
                SizedBox(height: 15,),

                Center(
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 60)
                      ),
                      onPressed: (){
                        if(sifre.text != sifretekrari.text){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Bildirim"),
                              content: Text("Şifreler aynı değil!"),
                            );
                          });
                        }
                      } , child: Text("Kayıt Ol")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hesabınız zaten var mı?"),
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                    } , child: Text("Giriş Yap"))
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