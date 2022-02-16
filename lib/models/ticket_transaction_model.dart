import 'dart:convert';

List<TicketTransaction> TicketTransactionFromJson(String str) =>
    List<TicketTransaction>.from(
        json.decode(str).map((x) => TicketTransaction.fromJson(x)));

class TicketTransaction {
  var id;
  var ticketNumber;
  var ticketTransaction;
  var ticketAround;
  var ticketType;
  var ticketPrice;
  var ticketExpire;
  var status;
  var stage;
  var dateMatch;
  var dateBuy;
  var codeBuy;
  var codeScanDoor;
  var dateScan;

  TicketTransaction(
      {this.id,
      this.ticketNumber,
      this.ticketTransaction,
      this.ticketAround,
      this.ticketType,
      this.ticketPrice,
      this.ticketExpire,
      this.status,
      this.stage,
      this.dateMatch,
      this.dateBuy,
      this.codeBuy,
      this.codeScanDoor,
      this.dateScan});

  TicketTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketNumber = json['ticket_number'];
    ticketTransaction = json['ticket_transaction'];
    ticketAround = json['ticket_around'];
    ticketType = json['ticket_type'];
    ticketPrice = json['ticket_price'];
    ticketExpire = json['ticket_expire'];
    status = json['status'];
    stage = json['stage'];
    dateMatch = json['date_match'];
    dateBuy = json['date_buy'];
    codeBuy = json['code_buy'];
    codeScanDoor = json['code_scan_door'];
    dateScan = json['date_scan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_number'] = this.ticketNumber;
    data['ticket_transaction'] = this.ticketTransaction;
    data['ticket_around'] = this.ticketAround;
    data['ticket_type'] = this.ticketType;
    data['ticket_price'] = this.ticketPrice;
    data['ticket_expire'] = this.ticketExpire;
    data['status'] = this.status;
    data['stage'] = this.stage;
    data['date_match'] = this.dateMatch;
    data['date_buy'] = this.dateBuy;
    data['code_buy'] = this.codeBuy;
    data['code_scan_door'] = this.codeScanDoor;
    data['date_scan'] = this.dateScan;
    return data;
  }
}
