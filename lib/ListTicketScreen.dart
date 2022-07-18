import 'dart:convert';

import 'package:booking_ticket_bus_mobile/BookingTicketScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListTicketScreen extends StatefulWidget {
  const ListTicketScreen({Key? key}) : super(key: key);

  @override
  State<ListTicketScreen> createState() => _ListTicketScreenState();
}

class _ListTicketScreenState extends State<ListTicketScreen> {
  final String url = 'http://10.0.2.2:8000/api/bus-schedule';
  Future getTickets() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Ticket"),
      ),
      body: FutureBuilder(
        future: getTickets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as Map;
            return ListView.builder(
                itemCount: data['data'].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 180,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingTicketScreen(
                                      ticket: data['data'][index],
                                    )));
                      },
                      child: Card(
                        elevation: 5,
                        child: Row(children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      data['data'][index]['tanggal'],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      data['data'][index]['asal'],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      data['data'][index]['tujuan'],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  );
                });
          } else {
            return Text("Data error");
          }
        },
      ),
    );
  }
}
