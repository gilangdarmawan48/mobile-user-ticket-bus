import 'package:booking_ticket_bus_mobile/AddTicket.dart';
import 'package:flutter/material.dart';

class BookingTicketScreen extends StatelessWidget {
  // const BookingTicketScreen({Key? key}) : super(key: key);
  final Map ticket;
  BookingTicketScreen({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTicket(
                          bus_schedules: ticket['id'],
                        )));
          }),
      appBar: AppBar(title: Text("Detail Ticket")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Jadwal Bus : " + ticket['tanggal'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "From : " + ticket['asal'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "To : " + ticket['tujuan'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Class : " + ticket['kelas'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Price : " + ticket['tarif'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Slot Parent : " + ticket['tempat_duduk_orang_tua'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Slot Children : " + ticket['tempat_duduk_anak'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
      ]),
    );
  }
}
