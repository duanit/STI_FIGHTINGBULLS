import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sti_fightingbulls/core/constants/color_constants.dart';
import 'package:sti_fightingbulls/core/widgets/app_button_widget.dart';
import 'package:sti_fightingbulls/core/widgets/input_widget.dart';
import 'package:sti_fightingbulls/dao/messageuser_dao.dart';

import 'package:sti_fightingbulls/screens/home/home_screen.dart';
import 'package:sti_fightingbulls/screens/login/components/slider_widget.dart';
import 'package:sti_fightingbulls/service/user_service.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Login extends StatefulWidget {
  Login({required this.title});
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  var tweenLeft = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 0))
      .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;

  var _isMoved = false;

  bool isChecked = false;
  FocusNode myFocusNode = FocusNode();
  FocusNode buttonFocusNode = FocusNode();
  TextEditingController myController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var SliderWidget ; 
    // if (defaultTargetPlatform == TargetPlatform.windows) {
    //          SliderWidget = Container(
    //             height: MediaQuery.of(context).size.height,
    //             width: MediaQuery.of(context).size.width / 2,
    //             color: Colors.white,
    //             child: SliderWidget(),
    //           );
    //            }else{
    //              SliderWidget = Container(
    //             height: 0,
    //             width: MediaQuery.of(context).size.width / 2,
    //             color: Colors.white,
    //             child: null,
    //           );
    //            }
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: SliderWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: bgColor,
                child: Center(
                  child: Card(
                    //elevation: 5,
                    color: bgColor,
                    child: Container(
                      padding: EdgeInsets.all(42),
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          Image.asset("assets/logo/logo_icon.png", scale: 2.5),
                          SizedBox(height: 24.0),
                          //Flexible(
                          //  child: _loginScreen(context),
                          //),
                          Flexible(
                            child: Stack(
                              children: [
                                SlideTransition(
                                  position:
                                      _animationController!.drive(tweenRight),
                                  child: Stack(
                                      fit: StackFit.loose,
                                      clipBehavior: Clip.none,
                                      children: [
                                        _loginScreen(context),
                                      ]),
                                ),
                                SlideTransition(
                                  position:
                                      _animationController!.drive(tweenLeft),
                                  child: Stack(
                                      fit: StackFit.loose,
                                      clipBehavior: Clip.none,
                                      children: [
                                        _registerScreen(context),
                                      ]),
                                ),
                              ],
                            ),
                          ),

                          //Flexible(
                          //  child: SlideTransition(
                          //    position: _animationController!.drive(tweenLeft),
                          //    child: Stack(
                          //        fit: StackFit.loose,
                          //        clipBehavior: Clip.none,
                          //        children: [
                          //          _registerScreen(context),
                          //        ]),
                          //  ),
                          //),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _registerScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },

              topLabel: "Name",

              hintText: "Enter Name",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            SizedBox(height: 8.0),
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },

              topLabel: "Email",

              hintText: "Enter E-mail",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            SizedBox(height: 8.0),
            InputWidget(
              topLabel: "Password",
              obscureText: true,
              hintText: "Enter Password",
              onSaved: (String? uPassword) {},
              onChanged: (String? value) {},
              validator: (String? value) {},
            ),
            SizedBox(height: 24.0),
            AppButton(
              type: ButtonType.PRIMARY,
              text: "Sign Up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("Remember Me")
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Sign In",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _loginScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ElevatedButton.icon(
            //   icon: Icon(
            //     Icons.fit_screen_sharp,
            //     color: Colors.black,
            //     size: 24.0,
            //   ),
            //   label: Text('แสกน'),
            //   onPressed: () async {
            //     //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
            //     String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            //         "#ff6666", "Cancel", false, ScanMode.DEFAULT);
            //     print(barcodeScanRes);
            //     //                             	setState(() {
            //     // 	qrCodeResult = barcodeScanRes;
            //     // });
            //   },
            //   style: ElevatedButton.styleFrom(
            //     //   primary: AppColors.cspaybutton, // background
            //     onPrimary: Colors.black,

            //     shape: new RoundedRectangleBorder(
            //       borderRadius: new BorderRadius.circular(8.0),
            //     ),
            //   ),
            // ),
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },

              topLabel: "Email",

              hintText: "Enter E-mail",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            SizedBox(height: 8.0),
            InputWidget(
              topLabel: "Password",
              obscureText: true,
              hintText: "Enter Password",
              onSaved: (String? uPassword) {},
              onChanged: (String? value) {},
              validator: (String? value) {},
              
            ),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              // The second TextField is focused
              // on when a user taps the second button
              autofocus: true,
              focusNode: myFocusNode,
              controller: myController,
              decoration: InputDecoration(
                labelText: "Second",
                labelStyle: TextStyle(fontSize: 25.0),
              ),
              // onTap: () async {
              //   String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              //       "#ff6666", "Cancel", false, ScanMode.DEFAULT);
              //   print(barcodeScanRes);
              //   //                             	setState(() {
              //   // 	qrCodeResult = barcodeScanRes;
              //   // });
              // },
              onChanged: (value) async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                print(barcodeScanRes);
              },
              onSubmitted: (value) async {
                myFocusNode.requestFocus();
                // myController.clear();

                bool result = await showDialog(
                  context: context,
                  builder: (context) {
                    return RawKeyboardListener(
// its better to initialize and dispose of the focus node only for this alert dialog
                      focusNode: FocusNode(),
                      autofocus: true,
                      onKey: (v) {
                        print(FocusNode().hasFocus);
                        if (v.logicalKey == LogicalKeyboardKey.enter) {
                          //  // _deleteFloorplan(index);
                          // Navigator.pop(context);

                          FocusScope.of(context).nextFocus();
                        }
                      },
                      child: AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Do you want to save?'),
                        actions: <Widget>[
                          // new FlatButton(
                          //   onPressed: () {
                          //     Navigator.of(context, rootNavigator: true).pop(
                          //         false); // dismisses only the dialog and returns false
                          //   },
                          //   child: Text('No'),
                          // ),
                          FlatButton(
                            autofocus: true,
                            focusNode: buttonFocusNode,
                            onPressed: () {
                              print("......mm.......");
                              print(myController.text);
                              print(".....m........");
                              myController.clear();
                              Navigator.of(context, rootNavigator: true).pop(
                                  true); // dismisses only the dialog and returns true
                            },
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                );

                if (result) {
                  print("..........");
                  print(result);

                  // Navigator.of(context).pop(_myObject);
//   if (missingvalue) {
//     Scaffold.of(context).showSnackBar(new SnackBar(
//       content: new Text('Missing Value'),
//     ));
//   } else {
//     saveObject();
//     Navigator.of(context).pop(_myObject); // dismisses the entire widget
//   }
// } else {
//   Navigator.of(context).pop(_myObject); // dismisses the entire widget
                }
              },
              onEditingComplete: () async {},
            ),
            SizedBox(height: 24.0),
            AppButton(
              type: ButtonType.PRIMARY,
              text: "Sign In",
              onPressed: () {
                Future<MessageUserDao> msg = UserService.randomDog();
                msg.then(
                  (data) => {
                    print(data.message),
                    if (data.status == "success")
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        )
                      }
                  },
                );
                //UserService.randomDog();
                //   FutureBuilder<MessageUserDao>(
                // future: UserService.randomDog(),
                // builder: (context, snapshot) {
                //  print(snapshot.data);
                // // MessageUserDao msg = snapshot.data;
                //   // if (snapshot.hasData) {
                //   //   MessageUserDao msg = snapshot.data;
                //   //   print("snap = ");
                //   //      print(msg.message);
                //   //   return Image.network(msg.message,width: 300,height: 200,);
                //   // } else {
                //   //   return CircularProgressIndicator();
                //   // }
                //   return CircularProgressIndicator();
                // });
              },
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("Remember Me")
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: greenColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Sign up",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
