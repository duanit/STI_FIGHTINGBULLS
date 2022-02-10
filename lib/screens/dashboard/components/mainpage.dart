import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:sti_fightingbulls/core/constants/color_constants.dart';
import 'package:sti_fightingbulls/core/utils/colorful_tag.dart';
import 'package:sti_fightingbulls/models/recent_user_model.dart';
import 'package:sti_fightingbulls/screens/login/login_create_ticket.dart';
import 'package:sti_fightingbulls/screens/login/login_screen.dart';
import 'dart:ui' as ui;

class Mainpage extends StatelessWidget {
  Mainpage({
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
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Image.asset("assets/logo/logo_icon.png", scale: 5)),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("สนามกีฬาชนโค ทุ่งทะเลหลวงสุโขทัย"),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        drawer: MediaQuery.of(context).size.width < 500
            ? Drawer(
                child: Menu(),
              )
            : null,
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

class Menu extends StatelessWidget {
  @override
  Widget build(context) => ListView(children: [
        // FlatButton(
        //   onPressed: () {},
        //     child: ListTile(
        //     leading: Icon(Icons.looks_one),
        //     title: Text("First Link"),
        //   )
        // ),
        // FlatButton(
        //   onPressed: () {},
        //     child: ListTile(
        //     leading: Icon(Icons.looks_two),
        //     title: Text("Second Link"),
        //   )
        // )
      ]);
}

class Content extends StatelessWidget {
  final List elements = [
    //   {
    //   "title" : "ปริ้นตั๋ว",
    //   "color": bgColor

    // },
    {"title": "ปริ้นตั๋ว", "color": primaryColor,"page":Login(title: "Wellcome to the Admin & Dashboard Panel")},
    {"title": "ขายตั๋ว", "color": greenColor,"page":LoginCreateTicket()},
    {"title": "ระบบหลับบ้าน", "color": darkgreenColor,"page":Login(title: "Wellcome to the Admin & Dashboard Panel")},
    {"title": "แสกนบัตรผ่านประตู", "color": Colors.amber,"page":Login(title: "Wellcome to the Admin & Dashboard Panel")}
  ];
  @override
  Widget build(context) => GridView.builder(
        itemCount: elements.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 280.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, i) => Card(
          color: elements[i]["color"].withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child:     InkWell( 
            onTap: () {
              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => elements[i]["page"]),
                        );
            },
            child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                elements[i]["title"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 120),
                        const Offset(0, 30),
                        <Color>[
                           Colors.white,
                           Colors.white,
                         //elements[i]["color"],
                         
                        ],
                      ),
                      ),
              ),
            ),
          ),
          
        ),
        ),
      );
}
