import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:ukk_agil/login.dart';
import 'package:date_field/date_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? selectedDate;

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
                  margin: EdgeInsets.only(left: 110),
                  height: 34,
                  width: 100,
                  child:  Text("Register",
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
                    decoration: InputDecoration(hintText: "Email",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height:16,),
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
                margin: EdgeInsets.only(right: 40,),
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Masukkan Tanggal',
                  ),
                  firstDate: DateTime.now().add(const Duration(days: 10)),
                  lastDate: DateTime.now().add(const Duration(days: 40)),
                  initialDate: DateTime.now().add(const Duration(days: 20)),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime? e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
                  ],
                ),
              ),
                SizedBox(height: 17,),
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
              SizedBox(height: 70,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                padding: EdgeInsets.only(top:4,),
                height: 38,
                width: 314,
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
              // SizedBox(height: 20,),
              // Container(
              //   margin: EdgeInsets.only(right: 40,),
              //   child: Column(
                  
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       DateTimeFormField(
              //     decoration: const InputDecoration(
              //       hintStyle: TextStyle(color: Colors.black45),
              //       errorStyle: TextStyle(color: Colors.redAccent),
              //       border: OutlineInputBorder(),
              //       suffixIcon: Icon(Icons.event_note),
              //       labelText: 'Masukkan Tanggal',
              //     ),
              //     firstDate: DateTime.now().add(const Duration(days: 10)),
              //     lastDate: DateTime.now().add(const Duration(days: 40)),
              //     initialDate: DateTime.now().add(const Duration(days: 20)),
              //     autovalidateMode: AutovalidateMode.always,
              //     validator: (DateTime? e) =>
              //         (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              //     onDateSelected: (DateTime value) {
              //       print(value);
              //     },
              //   ),
              //     ],
              //   ),
              // ),
              
              
                       
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
