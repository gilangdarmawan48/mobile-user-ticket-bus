import 'package:booking_ticket_bus_mobile/ListTicketScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Ticket Bus',
      home: ListTicketScreen(),
    );
  }
}
