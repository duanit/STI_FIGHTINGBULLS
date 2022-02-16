// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sti_fightingbulls/core/constants/color_constants.dart';
import 'package:sti_fightingbulls/core/utils/colorful_tag.dart';
import 'package:sti_fightingbulls/dao/messageuser_dao.dart';
import 'package:sti_fightingbulls/models/biller_model.dart';
import 'package:sti_fightingbulls/models/recent_user_model.dart';
import 'package:sti_fightingbulls/models/ticket_transaction_model.dart';
import 'package:sti_fightingbulls/screens/dashboard/components/recent_users.dart';
import 'package:sti_fightingbulls/service/biller_service.dart';
import 'package:sti_fightingbulls/service/buy_ticket_service.dart';
import 'package:sti_fightingbulls/service/user_service.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key}) : super(key: key);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  FocusNode myFocusNode = FocusNode();
  FocusNode buttonFocusNode = FocusNode();
  TextEditingController myController = TextEditingController();
  List<Widget> _results = <Widget>[];
  late Future<List<TicketTransaction>> ticketTransaction =
      BuyTicketService().getTicketBuyAll();
  List<TicketTransaction> transactionTicket = <TicketTransaction>[];
  final accountItems = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  int total = 0;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ticketTransaction.then((data) {
      setState(() {
        transactionTicket = data;
        //  total = data.length;
      });
    });
//print(transactionTicket.length);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Form widgets'),
      // ),
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          SizedBox(
            child: Form(
              key: _formKey,
              child: Scrollbar(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...[
                              TextFormField(
                                autofocus: true,
                                focusNode: myFocusNode,
                                controller: myController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  hintText: 'แสกนบาร์โค้ด',
                                  labelText: 'เลขบาร์โค้ด',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    title = value;
                                  });
                                },
                                onFieldSubmitted: (value) async {
                                  //     print("dddd");
                                  //    myController.clear();
                                  //accountItems.add("tttttt");
                                  // print(accountItems);
                                  //  _buildNetwork();

                                  if (value != '') {
                                    var datasave = {
                                      "ticket_number": [value],
                                      "code_buy": "0001",
                                    };
                                    await BuyTicketService()
                                        .saveTransaction(datasave)
                                        .then(
                                      (value) {
                                        var data = BuyTicketService()
                                            .getTicketBuyAll()
                                            .then((data) {
                                          // print(data.length);
                                          // print(data[0].ticketNumber);

                                          setState(() {
                                            myController.clear();

                                            ticketTransaction =
                                                BuyTicketService()
                                                    .getTicketBuyAll();

                                            // recentUsers.add(RecentUser(
                                            //   icon: "assets/icons/xd_file.svg",
                                            //   name: "Deniz Çolak" + value,
                                            //   role: data[0].ticketNumber,
                                            //   email: "de***ak@huawei.com",
                                            //   date: "01-03-2021",
                                            //   posts: "4",
                                            // ));
                                          });
                                        });
                                        // setState(() {
                                        //   myController.clear();
                                        //   ticketTransaction = data;
                                        //   //  total = (total + 1);
                                        //   //accountItems.add(value);
                                        // });
                                      },
                                    );
                                    //   addTransaction(value);
                                  } else {
                                    myFocusNode.requestFocus();
                                  }

                                  // _buildbarcodeGridView();
                                  // _buildbarcodeGridView(accountItems);
                                  // _buildNetwork();

                                  // UserService.randomDog();
                                  // FutureBuilder<MessageUserDao>(
                                  //     future: UserService.randomDog(),
                                  //     builder: (context, snapshot) {
                                  //       print(snapshot.data);
                                  //       // MessageUserDao msg = snapshot.data;
                                  //       // if (snapshot.hasData) {
                                  //       //   MessageUserDao msg = snapshot.data;
                                  //       //   print("snap = ");
                                  //       //      print(msg.message);
                                  //       //   return Image.network(msg.message,width: 300,height: 200,);
                                  //       // } else {
                                  //       //   return CircularProgressIndicator();
                                  //       // }
                                  //       return CircularProgressIndicator();
                                  //     });
                                },
                              ),

                              // TextFormField(
                              //   decoration: const InputDecoration(
                              //     border: OutlineInputBorder(),
                              //     filled: true,
                              //     hintText: 'Enter a description...',
                              //     labelText: 'Description',
                              //   ),
                              //   onChanged: (value) {
                              //     description = value;
                              //   },
                              //   maxLines: 5,
                              // ),
                              // _FormDatePicker(
                              //   date: date,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       date = value;
                              //     });
                              //   },
                              // ),
                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Text(
                              //           'Estimated value',
                              //           style: Theme.of(context).textTheme.bodyText1,
                              //         ),
                              //       ],
                              //     ),
                              //     Text(
                              //       intl.NumberFormat.currency(
                              //               symbol: "\$", decimalDigits: 0)
                              //           .format(maxValue),
                              //       style: Theme.of(context).textTheme.subtitle1,
                              //     ),
                              //     Slider(
                              //       min: 0,
                              //       max: 500,
                              //       divisions: 500,
                              //       value: maxValue,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           maxValue = value;
                              //         });
                              //       },
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Checkbox(
                              //       value: brushedTeeth,
                              //       onChanged: (checked) {
                              //         setState(() {
                              //           brushedTeeth = checked;
                              //         });
                              //       },
                              //     ),
                              //     Text('Brushed Teeth',
                              //         style: Theme.of(context).textTheme.subtitle1),
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Text('Enable feature',
                              //         style: Theme.of(context).textTheme.bodyText1),
                              //     Switch(
                              //       value: enableFeature,
                              //       onChanged: (enabled) {
                              //         setState(() {
                              //           enableFeature = enabled;
                              //         });
                              //       },
                              //     ),
                              //   ],
                              // ),
//ListView(children: _results)
                            ].expand(
                              (widget) => [
                                widget,
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "จำนวน",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: getRoleColor("$total")
                                              .withOpacity(.2),
                                          border: Border.all(
                                              color: getRoleColor("$total")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0) //
                                              ),
                                        ),
                                        child: Text("$total",
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.amber,
                                            )),
                                      ),
                                      Expanded(
                                          child: Text(
                                        "ใบ",
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                        textAlign: TextAlign.right,
                                      )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "ยอดรวม",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: getRoleColor("$total")
                                              .withOpacity(.2),
                                          border: Border.all(
                                              color: getRoleColor("$total")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0) //
                                              ),
                                        ),
                                        child: Text("$total",
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.red,
                                            )),
                                      ),
                                      // Expanded(
                                      //   child: Text(
                                      //     "$total",
                                      //     style: TextStyle(
                                      //       fontSize: 30,
                                      //       color: Colors.red,
                                      //     ),
                                      //   ),
                                      // ),
                                      Expanded(
                                          child: Text(
                                        "บาท",
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                        textAlign: TextAlign.right,
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(),
                                Container(
                                  child: Row(
                                    children: [
                                      // Text(
                                      //   'จ้ดการบัญชี',
                                      //   textAlign: TextAlign.left,
                                      //   style: TextStyle(
                                      //     fontFamily: "DB HelvethaicaMon X",
                                      //     fontSize: 19.0,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      Expanded(
                                        child: _buildbarcodeGridView(),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(defaultPadding + 25),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Text(
                      "รายการขายบัตร รอบเช้า วันที่ 01/02/2556",
                      //style: TextStyle(color: primaryColor),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 114,
                  child: SingleChildScrollView(
                    // scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        horizontalMargin: 0,
                        columnSpacing: defaultPadding,
                        sortColumnIndex: 0,
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(
                            label: Text(
                              "เลขที่บาร์โค้ด",
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "ราคา",
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          // DataColumn(
                          //   label: Text("E-mail"),
                          // ),
                          // DataColumn(
                          //   label: Text("Registration Date"),
                          // ),
                          // DataColumn(
                          //   label: Text("Status"),
                          // ),
                          // DataColumn(
                          //   label: Text("Operation"),
                          // ),
                        ],
                        rows: List.generate(
                          transactionTicket.length,
                          (index) => recentUserDataRow(
                              transactionTicket[index], context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void addTransaction(ticketnumber) {
    var data = {
      "ticket_number": [ticketnumber],
      "code_buy": "0001",
    };
    BuyTicketService().saveTransaction(data);
  }

  DataRow recentUserDataRow(
      TicketTransaction tranTicket, BuildContext context) {
//print(userInfo);
    // print(ticketTransaction);
    // ticketTransaction.then((data) {
    //   print(data.length);
    // });
    // print(ticketTransaction);

    return DataRow(
      cells: [
        DataCell(
          Text(
            tranTicket.ticketNumber,
            style: TextStyle(color: Colors.white70),
          ),
        ),
        DataCell(
          Text(
            tranTicket.ticketPrice.toString(),
            style: TextStyle(color: Colors.white70),
          ),
        ),
        // DataCell(
        //   Container(
        //     padding: EdgeInsets.all(5),
        //     decoration: BoxDecoration(
        //       color: getRoleColor(tranTicket.ticketPrice.toString())
        //           .withOpacity(.2),
        //       border: Border.all(
        //           color: getRoleColor(tranTicket.ticketPrice.toString())),
        //       borderRadius: BorderRadius.all(Radius.circular(5.0) //
        //           ),
        //     ),
        //     child: Text(tranTicket.ticketPrice.toString()),
        //   ),
        // ),
        // DataCell(Text(userInfo.email!)),
        // DataCell(Text(userInfo.date!)),
        // DataCell(Text(userInfo.posts!)),
        // DataCell(
        //   Row(
        //     children: [
        //       TextButton(
        //         child: Text('View', style: TextStyle(color: greenColor)),
        //         onPressed: () {},
        //       ),
        //       SizedBox(
        //         width: 6,
        //       ),
        //       TextButton(
        //         child:
        //             Text("Delete", style: TextStyle(color: Colors.redAccent)),
        //         onPressed: () {
        //           showDialog(
        //               context: context,
        //               builder: (_) {
        //                 return AlertDialog(
        //                     title: Center(
        //                       child: Column(
        //                         children: [
        //                           Icon(Icons.warning_outlined,
        //                               size: 36, color: Colors.red),
        //                           SizedBox(height: 20),
        //                           Text("Confirm Deletion"),
        //                         ],
        //                       ),
        //                     ),
        //                     content: Container(
        //                       color: secondaryColor,
        //                       height: 70,
        //                       child: Column(
        //                         children: [
        //                           Text(
        //                               "Are you sure want to delete '${tranTicket.ticketNumber}'?"),
        //                           SizedBox(
        //                             height: 16,
        //                           ),
        //                           Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               ElevatedButton.icon(
        //                                   icon: Icon(
        //                                     Icons.close,
        //                                     size: 14,
        //                                   ),
        //                                   style: ElevatedButton.styleFrom(
        //                                       primary: Colors.grey),
        //                                   onPressed: () {
        //                                     Navigator.of(context).pop();
        //                                   },
        //                                   label: Text("Cancel")),
        //                               SizedBox(
        //                                 width: 20,
        //                               ),
        //                               ElevatedButton.icon(
        //                                   icon: Icon(
        //                                     Icons.delete,
        //                                     size: 14,
        //                                   ),
        //                                   style: ElevatedButton.styleFrom(
        //                                       primary: Colors.red),
        //                                   onPressed: () {},
        //                                   label: Text("Delete"))
        //                             ],
        //                           )
        //                         ],
        //                       ),
        //                     ));
        //               });
        //         },
        //         // Delete
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  // Expanded ttt(List<String> accountItemss) {
  //   return Expanded(child: _buildbarcodeGridView(accountItems));
  // }

  ListView _buildbarcodeGridView() {
    //print(accountItems);
    myFocusNode.requestFocus();

    final ticketsummary = ["จำนวน"];
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        itemCount: ticketsummary.length,
        itemBuilder: (context, index) {
          return new Column(
            children: <Widget>[
              ListTile(
                // leading: Text(ticketsummary[index]),
                //  minLeadingWidth: MediaQuery.of(context).size.width,
                title: Text(""),
                //trailing: Text("ใบ"),
                onTap: () {
                  // This pushes the settings page as a full page modal dialog on top
                  // of the tab bar and everything.
                },
              ),
            ],
          );
        });
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}

FutureBuilder<List<Biller>> _buildNetwork() {
  return FutureBuilder<List<Biller>>(
    future: BillerService().getBiller("1"),
    builder: (context, snapshot) {
      print(snapshot);
      print("+++++++getBiller..........+snapshot.hasData+++++++");
      print(snapshot.hasData);
      if (!snapshot.hasData) {
        return Text('You have no messages.');
      }
      if (snapshot.hasData) {
        List<Biller>? biller = snapshot.data;
        if (biller == null || biller.isEmpty) {
          return Container(
            margin: EdgeInsets.only(top: 22),
            alignment: Alignment.topCenter,
            child: Text('No data'),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // setState(() {});
          },
          // child: ListView.builder(
          //   itemCount: biller.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final billerss = biller[index];
          //     print(billerss);

          //   },
          // ),
          child: _buildBillerGridView(biller),
        );
      }
      if (snapshot.hasError) {
        return Container(
          margin: EdgeInsets.only(top: 22),
          alignment: Alignment.topCenter,
          // child: Text((snapshot.error as DioError).message),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

ListView _buildBillerGridView(List<Biller> billers) {
  return ListView.builder(
      // padding: EdgeInsets.only(
      //   left: _spacing,
      //   right: _spacing,
      //   top: _spacing,
      //   bottom: 150,
      // ),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   childAspectRatio: 0.8,
      //   crossAxisSpacing: _spacing,
      //   mainAxisSpacing: _spacing,
      // ),
      itemCount: billers.length,
      //   itemBuilder: _listBuilder,
      itemBuilder: (BuildContext context, int index) {
        //  builder: (context, BoxConstraints constraints) {
        final biller = billers[index];

        var clientIcon =
            "http://test.counterservicepay.com/images/" + biller.clientIcon;

        if (biller.clientIcon != "") {
          clientIcon = clientIcon;
        } else {
          clientIcon = "";
        }
        return SafeArea(
          top: false,
          bottom: false,
          child: Card(
            elevation: 1.5,
            margin: const EdgeInsets.fromLTRB(6, 12, 6, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: InkWell(
              // Make it splash on Android. It would happen automatically if this
              // was a real card but this is just a demo. Skip the splash on iOS.
              // onTap:
              //     defaultTargetPlatform == TargetPlatform.iOS ? null : () {},
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push<void>(
                //   CupertinoPageRoute(
                //     fullscreenDialog: true,
                //     builder: (context) {
                //       return BillDetailsCreatePage(
                //           id: widget.id, title: widget.title, biller: biller);
                //     },
                //   ),
                // );
              },

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (biller.clientIcon != "") ...[
                      Image.network(
                        '$clientIcon',
                        height: 64,
                        width: 64,
                      ),
                    ] else ...[
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          biller.clientNameTh.substring(0, 1),
                          style:
                              const TextStyle(color: Colors.white, height: 64),
                        ),
                      ),
                    ],

                    // CircleAvatar(
                    //   backgroundColor: colors[index],
                    //   child: Text(
                    //     titles[index].substring(0, 1),
                    //     style: const TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    const Padding(padding: EdgeInsets.only(left: 16)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            biller.clientNameTh,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Text(
                          //   titles[index],
                          //   style: const TextStyle(
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          // Text(
                          //   contents[index],
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Icon(Icons.arrow_forward_ios_sharp),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          // Text(
                          //   contents[index],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        // return TransactionGraphTypeItem(
        //   constraints.maxHeight,
        //   transactionGraphType,
        //   onTap: () {
        //     // Navigator.pushNamed(
        //     //   context,
        //     //   custom_route.Route.management,
        //     //   arguments: product,
        //     // ).then((value) {
        //     //   setState(() {});
        //     // });
        //   },
        // );
        //},
      });
}
