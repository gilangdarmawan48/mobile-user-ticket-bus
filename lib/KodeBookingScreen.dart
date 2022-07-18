import 'package:flutter/material.dart';

class KodeBookingScreen extends StatelessWidget {
  // const KodeBookingScreen({Key? key}) : super(key: key);

  final Map booking;
  KodeBookingScreen({required this.booking});
  bookingData(booking) {
    return booking;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bookingData(booking))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Nama Orang Tua : " + booking['nama_orang_tua'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Umur Orang Tua : " + booking['umur_orang_tua'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Jenis Kelamin Orang Tua : " +
                  booking['jenis_kelamin_orang_tua'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Nama Anak : " + booking['nama_anak'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Umur Anak : " + booking['umur_anak'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Jenis Kelamin Anak : " +
                  booking['jenis_kelamin_anak'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Email : " + booking['email'].toString(),
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Nomor Telepon : " + booking['nomor_telepon'],
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
      ]),
    );
  }
}
