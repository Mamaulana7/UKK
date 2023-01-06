import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;
bool showPassword = false;
int _selectedItemIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 85, 179, 255),
                  Color.fromARGB(255, 103, 255, 204),
                ], ),
            ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 85, 179, 255),
                  Color.fromARGB(255, 103, 255, 204),
                ], ),
            ),
            child: Text(
              "OTO",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 45,
              ),
              ),
          ),
          Flexible(
            child: Container(
            padding: EdgeInsets.only(left: 38,top:60 ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 120),
                  height: 34,
                  width: 70,
                  child:  Text("Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  
                ),
                ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: 312,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: const[
                      BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius:0.1,
                    ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                  child: 
                  TextField(
                    decoration: InputDecoration(hintText: "username",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height:16,),
                Container(
                  width: 312,
                  height: 44,
                  decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),
                   boxShadow: const[
                      BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius:0.1,
                    ),
                    ],
                  borderRadius: BorderRadius.circular(10)),
                  child: buildTextField("Password",true),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 20),
                  padding: EdgeInsets.only(left: 5),
                  width: 310,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const[
                      BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius:0.1,
                    ),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                    child:DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme
                                .of(context)
                                .hintColor,
                      ),
                    ),
                    items: items
                            .map((item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                            .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
              SizedBox(height: 90,),
              GestureDetector(
                onTap:() {
                  Navigator.pushNamed(context, '/menu');
                },
                child: Container(
                padding: EdgeInsets.only(top:4,),
                height: 38,
                width: 315,
                 decoration: BoxDecoration(color: Color.fromARGB(255, 12, 243, 116),borderRadius: BorderRadius.circular(3)),
                child: Text("Login",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),),
              
              SizedBox(height: 12,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Container(
                padding: EdgeInsets.only(top:4,),
                height: 38,
                width: 315,
                decoration: BoxDecoration(color: Color.fromARGB(255, 252, 77, 77),borderRadius: BorderRadius.circular(3)),
                child: Text("Register",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ),
        
              ],
              
            ),
            
          ),
          )
        ],
      ),
    ),
    );
  }

  Widget buildTextField(String placeholder, bool isPasswordTextField){
    return TextField(
      obscureText: isPasswordTextField ? showPassword : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: isPasswordTextField 
        ?
        IconButton(
          onPressed:()  {
            setState(() {
              showPassword = !showPassword;
            });
          },
           icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
           ),
           )
           : null,
           hintText: placeholder,
      ),
    );
  }        
}