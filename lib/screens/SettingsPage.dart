import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/screens/logPage.dart';
// import 'package:caisse4/services/firestore.dart';
import 'package:flutter/material.dart';
// import 'package:caisse4/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(SettingsPage());
}


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key ? key}) : super(key: key);
  
@override
  _SettingsPageState createState() => _SettingsPageState();
  
}

class _SettingsPageState extends State<SettingsPage> {
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    appBar: AppBar(
        title: const Text("paramètres des comptes"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              ),
        ),
        elevation: 0.00,
        backgroundColor: Colors.blue[400],
      ),
    body:
    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(
         
        // Card(
        //   child: SizedBox(
        //     width: 100,
        //     height: 150,
        //     child: Padding(padding: const EdgeInsets.all(20.0),
        //     child: Column(children: [ CircleAvatar(
        //             backgroundColor: Colors.blueGrey,
        //             radius: 108,
        //             child:  CircleAvatar(
        //               radius: 100,
        //               child: Image.asset('images/shop.png'),
        //             ), //CircleAvatar
        //           ), //CircleAvatar
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           ]),
        //     ),
        //   ),
        // ),
        ),
        const SizedBox(
                    height: 50,
                  ),
        InkWell(
          onTap: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateShop(),),);
        },
          child:Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),),
          elevation: 40,
          shadowColor: Colors.blueAccent,
          color: Colors.white24,
          child:ListTile(
          title: Text("Votre  Magasin ",style: TextStyle(fontSize: 20.0)),
          
          subtitle: Text("Paramètres du compte",style: TextStyle(fontSize: 10.0)),
          leading: 
          CircleAvatar(backgroundImage: AssetImage('images/shop.png',
          ),
          ),
          )
          ),
          ),
          const SizedBox(
                    height: 20,
                  ),
        InkWell(
          onTap: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateShop(),),);
        },
        child:Card(
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
          child:ListTile( title: Text("Utilisateur ",style: TextStyle(fontSize: 20.0)),
          subtitle: Text("modifier les informations de profil",style: TextStyle(fontSize: 10.0)), 
          
          //  CircleAvatar(backgroundImage: AssetImage('images/')),
           trailing: Icon(Icons.admin_panel_settings) ),
          elevation: 40,
          shadowColor: Colors.blueAccent,
          color: Colors.white24,
          ),
          ),
           const SizedBox(
                    height: 20,
                  ),
       InkWell(  
        onTap: (){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateShop(),),);
        },
        child:Card(
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
          child:ListTile( title: Text("signaler un problème",style: TextStyle(fontSize: 20.0)), trailing: Icon(Icons.report_problem)),
        elevation: 40,
          shadowColor: Colors.blueAccent,
          color: Colors.white24,),),
           const SizedBox(
                    height: 20,
                  ),
        
          
      ],
    ),
     );
  }
}