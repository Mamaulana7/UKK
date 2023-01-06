import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 67, 198, 250),
        leading: Container(
          child: Icon(Icons.menu),
        ),
        title: Container(
          padding: EdgeInsets.only(left: 100),
          child: Text('OTO',
          style: GoogleFonts.secularOne(fontSize: 45, fontWeight: FontWeight.bold,),
          
           
          ),
        ),
      ),
      // body: ListView(children: [
        
      // ],),
    );
  }
}