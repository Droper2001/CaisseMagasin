 import 'package:grocery_admin_panel/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_admin_panel/Comm/genTextFormField.dart';
import 'package:grocery_admin_panel/Comm/genLoginSignupHeader.dart';
import 'package:grocery_admin_panel/screens/main_screen.dart';

import 'SignPage.dart';



class logPage extends StatefulWidget {
  
  FirebaseFirestore firestore=FirebaseFirestore.instance;

  @override
  _logPageState createState() => _logPageState();
}

class _logPageState extends State<logPage> {
  final TextEditingController _conEmail = TextEditingController();
  final TextEditingController _conPassword = TextEditingController();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Login with Signup'),
       ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Login'),
                getTextFormField(
                    controller: _conEmail,
                    icon: Icons.email,
                    hintName: 'Adresse email'),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Mot de passe ',
                  isObscureText: true,
                ),
                loading ?CircularProgressIndicator(): Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 50,

                    onPressed:(){Navigator.push(context,
                               MaterialPageRoute(builder: (_) => MainScreen()));}
                    // async{
                     
                    
                    //   setState((){loading=true;
                    //      });
                    //      if(_conEmail.text==""||_conPassword.text==""){
                    //        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("remplir les champs!"),
                    //        backgroundColor:Colors.red,));
                    //      } 
                    //      else{
                    //          User? result= await AuthService().login(_conEmail.text,_conPassword.text,context);
                    //          if(result!=null){
                    //            print(result.email);
                    //            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MainScreen()), (route) => false);
                    //          }
                    //        }
                    //        setState((){loading=false;
                    //      });
                    //        },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Avez-vous un compte ? '),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text('Enregistrer'),
                        onPressed: () {
                           Navigator.push(context,
                               MaterialPageRoute(builder: (_) => SignPage()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   }