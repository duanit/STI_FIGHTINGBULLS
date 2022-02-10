// import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sti_fightingbulls/core/constants/color_constants.dart';
import 'package:sti_fightingbulls/dao/messageuser_dao.dart';
import 'package:sti_fightingbulls/screens/dashboard/components/buy_ticket.dart';
import 'package:sti_fightingbulls/screens/dashboard/components/recent_users.dart';
import 'package:sti_fightingbulls/screens/home/home_screen.dart';
import 'package:sti_fightingbulls/service/user_service.dart';
// import 'package:sti_fightingbulls/core/constants/color_constants.dart';
// import 'package:sti_fightingbulls/core/utils/colorful_tag.dart';
// import 'package:sti_fightingbulls/core/widgets/app_button_widget.dart';
// import 'package:sti_fightingbulls/core/widgets/input_widget.dart';
// import 'package:sti_fightingbulls/models/recent_user_model.dart';
// import 'package:sti_fightingbulls/screens/home/home_screen.dart';
// import 'package:sti_fightingbulls/screens/login/login_screen.dart';
// import 'dart:ui' as ui;

class LoginCreateTicket extends StatelessWidget {
  LoginCreateTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Image.asset("assets/logo/logo_icon.png", scale: 5)),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("สนามกีฬาชนโค ทุ่งทะเลหลวงสุโขทัยww"),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: MediaQuery.of(context).size.width < 500
                ? Content()
                : Row(children: [
                    // Container(
                    //   width: 200.0,
                    //   child: Menu()
                    // ),
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Content(),
                          )),
                    )
                  ]),
          ),
        ),
      );
}

class Content extends StatelessWidget {
  FocusNode myFocusNode = FocusNode();

  final focusnum1 = FocusNode();
  final focusnum2 = FocusNode();
  final focusnum3 = FocusNode();
  final focusnum4 = FocusNode();
  final focusnum5 = FocusNode();
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();
  TextEditingController myController4 = TextEditingController();
  TextEditingController myController5 = TextEditingController();
  var pass = "";
  @override
  Widget build(context) {
    // var focusnum1 = FocusNode();
    // var focusnum2 = FocusNode();
    // var focusnum3 = FocusNode();
    // var focusnum4 = FocusNode();
    // var focusnum5 = FocusNode();
    var AlertDialogcheck ;
    
    
     
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 400,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    autofocus: true,
                    onKey: (v) {
                      // print(v.logicalKey);
                      if (v.logicalKey == LogicalKeyboardKey.backspace) {
                        //  // _deleteFloorplan(index);
                        // Navigator.pop(context);

                        if (focusnum1.hasFocus == true) {
                          FocusScope.of(context).requestFocus(focusnum1);
                        }
                        if (focusnum2.hasFocus == true) {
                          FocusScope.of(context).requestFocus(focusnum1);
                        }
                        if (focusnum3.hasFocus == true) {
                          FocusScope.of(context).requestFocus(focusnum2);
                        }
                        if (focusnum4.hasFocus == true) {
                          FocusScope.of(context).requestFocus(focusnum3);
                        }
                        if (focusnum5.hasFocus == true) {
                          FocusScope.of(context).requestFocus(focusnum4);
                          myController5.clear();
                        }
                           }
                        print(pass.length);
 if (pass.length == 5) {
                        if (pass == "11111") {
                          Future<MessageUserDao> msg = UserService.randomDog();
                          msg.then(
                            (data) => {
                              print(data.message),
                              if (data.status == "success")
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BuyTicket()),
                                  )
                                }
                            },
                          );
                          AlertDialogcheck = Text("tess");
                        } else {
                         AlertDialogcheck = AlertDialog(
                           title: Text('Confirmation'),
                            content: Text('Do you want to save?'),
                            actions: <Widget>[
                              
                              FlatButton(
                          
                                onPressed: () {
                                 
                                  Navigator.of(context, rootNavigator: true).pop(
                                      true); // dismisses only the dialog and returns true
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ) ;
                        }
                      }
                      print(pass.length);

                      print(pass);
                        // FocusScope.of(context).nextFocus()
                   
                     
                    },
                    
                    child: Row(
                      children: [
                        if(pass.length == 5) ...[ 
                          if (pass == "11111") ...[
Text(pass),
                        ]

                        ],
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            child: TextField(
                              controller: myController1,
                              focusNode: focusnum1,
                              autofocus: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                              ),
                              obscureText: true,
                              obscuringCharacter: '*',

                              maxLength: 1,
                              //decoration: InputDecoration(counterText: ''),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.orange,
                                  filled: true,
                                  counterText: ''),
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusnum2);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            child: TextField(
                              focusNode: focusnum2,
                              controller: myController2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                              ),
                              obscureText: true,
                              obscuringCharacter: '*',

                              maxLength: 1,
                              //decoration: InputDecoration(counterText: ''),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.orange,
                                  filled: true,
                                  counterText: ''),
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusnum3);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            child: TextField(
                              focusNode: focusnum3,
                              controller: myController3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                              ),
                              obscureText: true,
                              obscuringCharacter: '*',

                              maxLength: 1,
                              //decoration: InputDecoration(counterText: ''),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.orange,
                                  filled: true,
                                  counterText: ''),
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusnum4);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            child: TextField(
                              focusNode: focusnum4,
                              controller: myController4,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                              ),
                              obscureText: true,
                              obscuringCharacter: '*',

                              maxLength: 1,
                              //decoration: InputDecoration(counterText: ''),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.orange,
                                  filled: true,
                                  counterText: ''),
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusnum5);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 45,
                            child: TextField(
                                focusNode: focusnum5,
                                controller: myController5,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                                obscureText: true,
                                obscuringCharacter: '*',
                                maxLength: 1,
                                //decoration: InputDecoration(counterText: ''),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.orange,
                                    filled: true,
                                    counterText: ''),
                                onChanged: (value) {
                                  if (myController1 != "") {
                                    pass = myController1.text;
                                  }
                                  if (myController2 != "") {
                                    pass += myController2.text;
                                  }
                                  if (myController3 != "") {
                                    pass += myController3.text;
                                  }
                                  if (myController4 != "") {
                                    pass += myController4.text;
                                  }
                                  if (myController5 != "") {
                                    pass += myController5.text;
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: greenColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          //_loginScreen(context),
        ],
      ),
    );
  }
}

Container _loginScreen(BuildContext context) {
  return Container(
    // width: MediaQuery.of(context).size.width - 800,
    // constraints: BoxConstraints(
    //   minHeight: MediaQuery.of(context).size.height - 400.0,
    // ),
    child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: SizedBox(
                        width: 45,
                        child: TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          obscureText: true,
                          obscuringCharacter: '*',

                          maxLength: 1,
                          //decoration: InputDecoration(counterText: ''),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.orange,
                              filled: true,
                              counterText: ''),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: SizedBox(
                        width: 45,
                        child: TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          obscureText: true,
                          obscuringCharacter: '*',

                          maxLength: 1,
                          //decoration: InputDecoration(counterText: ''),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.orange,
                              filled: true,
                              counterText: ''),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: SizedBox(
                        width: 45,
                        child: TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          obscureText: true,
                          obscuringCharacter: '*',

                          maxLength: 1,
                          //decoration: InputDecoration(counterText: ''),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.orange,
                              filled: true,
                              counterText: ''),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: SizedBox(
                        width: 45,
                        child: TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          obscureText: true,
                          obscuringCharacter: '*',

                          maxLength: 1,
                          //decoration: InputDecoration(counterText: ''),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.orange,
                              filled: true,
                              counterText: ''),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: SizedBox(
                        width: 45,
                        child: TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          obscureText: true,
                          obscuringCharacter: '*',

                          maxLength: 1,
                          //decoration: InputDecoration(counterText: ''),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.orange,
                              filled: true,
                              counterText: ''),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   width: 45,
          //   child: InputWidget(
          //     //topLabel: "Password",
          //     obscureText: true,
          //     //hintText: "Enter Password",
          //     onSaved: (String? uPassword) {},
          //     onChanged: (String? value) {},
          //     validator: (String? value) {},
          //   ),
          // ),
          // SizedBox(height: 24.0),
          // AppButton(
          //   type: ButtonType.PRIMARY,
          //   text: "Sign In",
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //   },
          // ),
          // SizedBox(height: 24.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Row(
          //       children: <Widget>[
          //         // Checkbox(
          //         //   value: isChecked,
          //         //   onChanged: (bool? value) {
          //         //     setState(() {
          //         //       isChecked = value!;
          //         //     });
          //         //   },
          //         // ),
          //         Text("Remember Me")
          //       ],
          //     ),
          //     GestureDetector(
          //       onTap: () {},
          //       child: Text(
          //         "Forget Password?",
          //         textAlign: TextAlign.right,
          //         style: Theme.of(context)
          //             .textTheme
          //             .bodyText2!
          //             .copyWith(color: greenColor),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 24.0),
          // Center(
          //   child: Wrap(
          //     runAlignment: WrapAlignment.center,
          //     crossAxisAlignment: WrapCrossAlignment.center,
          //     children: [
          //       Text(
          //         "Don't have an account yet?",
          //         style: Theme.of(context)
          //             .textTheme
          //             .bodyText1!
          //             .copyWith(fontWeight: FontWeight.w300),
          //       ),
          //       SizedBox(
          //         width: 8,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}
