
import 'package:grocery_admin_panel/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/Comm/genLoginSignupHeader.dart';
import 'package:grocery_admin_panel/Comm/genTextFormField.dart';
import 'package:grocery_admin_panel/screens/LogPage.dart';

class SignPage extends StatefulWidget {
  _SignPageState createState() => _SignPageState();
 
   }
class _SignPageState extends State<SignPage> {
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  final TextEditingController _conEmail = TextEditingController();
  final TextEditingController _conPassword = TextEditingController();
  final TextEditingController _conPassword2 = TextEditingController();
  final TextEditingController _conUserId = TextEditingController();
  bool loading =false;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login with Signup'),
      // ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Signup'),
                  getTextFormField(
                      controller: _conUserId,
                      icon: Icons.person,
                      hintName: 'Nom utilisateur'),
                SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Adresse Email'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                    hintName: 'Mot de passe ',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),

                  getTextFormField(
                  controller: _conPassword2,
                  icon: Icons.lock,
                    hintName: 'Confirmer Mot de passe ',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  loading ?CircularProgressIndicator(): Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 50,
                      onPressed:()async{
                        
                        CollectionReference users=firestore.collection('users');
                        await users.add({
                          'name':_conUserId.text,
                          'email':_conEmail.text
                          });
                        setState((){loading=true;
                        });
    
                        if( _conUserId.text==""||_conEmail.text==""||_conPassword.text==""||_conPassword2==""){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("remplir les champs!"),
                          backgroundColor:Colors.red,));
                        } else if(_conPassword.text!=_conPassword2.text) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("les mots de passe c'est pass le meme!"),
                          backgroundColor:Colors.red,));}
                          else{
                            User? result= await AuthService().register(_conEmail.text,_conPassword.text,context);
                            if(result!=null){
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>logPage()), (route) => false);                              print(result.email);
                            }
                          }
                          setState((){loading=false;
                        });

                        
                      },
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
                        Text('avez-vous un compte? '),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text('Sign In'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => logPage()),
                                (Route<dynamic> route) => false);
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
      ),
    );
  }

 }
  
