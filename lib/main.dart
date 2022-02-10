
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_fightingbulls/core/constants/color_constants.dart';
import 'package:sti_fightingbulls/core/init/provider_list.dart';
import 'package:sti_fightingbulls/screens/dashboard/components/mainpage.dart';
import 'package:sti_fightingbulls/screens/dashboard/components/buy_ticket.dart';
import 'package:sti_fightingbulls/screens/login/login_create_ticket.dart';
import 'package:sti_fightingbulls/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pagemain ;
    if (defaultTargetPlatform == TargetPlatform.windows) {
     // pagemain = CodeUnlock();
      // pagemain = LoginCreateTicket();
    pagemain = Mainpage();
   //  pagemain = Login(title: "Wellcome to the Admin & Dashboard Panel");
    }else{
      pagemain = Mainpage();
     // pagemain = Login(title: "Wellcome to the Admin & Dashboard Panel");
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'สนามกีฬาชนโค ทุ่งทะเลหลวงสุโขทัย',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        buttonColor: greenColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: pagemain,
    );
  }
}
