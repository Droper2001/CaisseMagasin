


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   void initState() {  
    super.initState();  
    Timer(Duration(seconds: 10),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => SignPage(), 
            )  
         )  
    );  
  }  
  @override  
  Widget build(BuildContext context) {  
    return Container(  
         child:
        Image(image: AssetImage('images/caisse1.png'),
        fit:BoxFit.fill),  
    );  
  }  
}  