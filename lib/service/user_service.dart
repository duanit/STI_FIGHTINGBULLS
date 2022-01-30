import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:dio/dio.dart';
import 'package:sti_fightingbulls/dao/messageuser_dao.dart';

// class UserService {
// //static Future<MessageUserDao> randomDog() async {
//      static Future<MessageUserDao> randomDog() async {
//     String url = "https://dog.ceo/api/breeds/image/random";
//     //var response = await Dio().get(url);
//     // print(response.data);
//   var response = await Http.get( Uri.parse(url));
//   //  Map map = json.decode(response.data);
 
//     //MessageUserDao msg = MessageUserDao.fromJson(response.data);
//    // print(msg.message);
   
//    // return usersFromJson(jsonEncode(response.data));
//    return MessageUserDao.fromJson(json.decode(response.data));
//   }
// }

class UserService {
  static Future<MessageUserDao> randomDog() async {
    var url = "https://dog.ceo/api/breeds/image/random";
    //var response = await Dio().get(url);
    var response = await Http.get( Uri.parse(url));
    Map map = json.decode(response.body);
    MessageUserDao msg = MessageUserDao.fromJson(json.decode(response.body));
   // print(msg.message);
    return msg;
  }
}