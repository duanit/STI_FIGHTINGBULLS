// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Biller> BillerFromJson(String str) =>
    List<Biller>.from(json.decode(str).map((x) => Biller.fromJson(x)));

String BillerToJson(List<Biller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Biller {
  var id;
  var billerId;
  var type;
  var clientNameTh;
  var clientNameEn;
  var clientIcon;
  var clientShow;
  var index;
  var status;
  var statusUpdateDate;
  var regDate;
  var channelType;
  var initial;
  var billerType;
  var paymentType;
  var payment;
  var statusCoupon;
  var messageCompleteSave;
  var input_amount_flag;
  var pagkage;
  var serviceDetail;

  Biller(
      {required this.id,
      required this.billerId,
      required this.type,
      required this.clientNameTh,
      required this.clientNameEn,
      required this.clientIcon,
      required this.clientShow,
      required this.index,
      required this.status,
      required this.statusUpdateDate,
      required this.regDate,
      required this.channelType,
      required this.initial,
      required this.billerType,
      required this.paymentType,
      required this.payment,
      required this.statusCoupon,
      required this.messageCompleteSave,
      required this.input_amount_flag,
      required this.pagkage,
      required this.serviceDetail});

  factory Biller.fromJson(Map<String, dynamic> json) => Biller(
        id: json["id"],
        billerId: json["billerId"],
        type: json["type"],
        clientNameTh: json["clientNameTh"],
        clientNameEn: json["clientNameEn"],
        clientIcon: json["clientIcon"],
        clientShow: json["clientShow"],
        index: json["index"],
        status: json["status"],
        statusUpdateDate: json["statusUpdateDate"],
        regDate: json["regDate"],
        channelType: json["channelType"],
        initial: json["initial"],
        billerType: json["billerType"],
        paymentType: json["paymentType"],
        payment: json["payment"],
        statusCoupon: json["statusCoupon"],
        messageCompleteSave: json["messageCompleteSave"],
        input_amount_flag: json["input_amount_flag"],
        pagkage: json["pagkage"],
        serviceDetail: json["serviceDetail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "billerId": billerId,
        "type": type,
        "clientNameTh": clientNameTh,
        "clientNameEn": clientNameEn,
        "clientIcon": clientIcon,
        "clientShow": clientShow,
        "index": index,
        "status": status,
        "statusUpdateDate": statusUpdateDate,
        "regDate": regDate,
        "channelType": channelType,
        "initial": initial,
        "billerType": billerType,
        "paymentType": paymentType,
        "payment": payment,
        "statusCoupon": statusCoupon,
        "messageCompleteSave": messageCompleteSave,
        "input_amount_flag": input_amount_flag,
        "pagkage": pagkage,
        "serviceDetail": serviceDetail,
      };
}
