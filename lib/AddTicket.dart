import 'package:booking_ticket_bus_mobile/HomeScreen.dart';
import 'package:booking_ticket_bus_mobile/KodeBookingScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddTicket extends StatelessWidget {
  // const AddTicket({Key? key}) : super(key: key);
  final int bus_schedules;
  AddTicket({required this.bus_schedules});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaOrtuController = TextEditingController();
  TextEditingController _umurOrtuController = TextEditingController();
  TextEditingController _jkOrtuController = TextEditingController();
  TextEditingController _namaAnakController = TextEditingController();
  TextEditingController _umurAnakController = TextEditingController();
  TextEditingController _jkAnakController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nomorTlpController = TextEditingController();

  Future saveBooking() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2:8000/api/bus-booking"), body: {
      "bus_schedule_id": bus_schedules.toString(),
      "nama_orang_tua": _namaOrtuController.text,
      "umur_orang_tua": _umurOrtuController.text,
      "jenis_kelamin_orang_tua": _jkOrtuController.text,
      "nama_anak": _namaOrtuController.text,
      "umur_anak": _umurOrtuController.text,
      "jenis_kelamin_anak": _jkOrtuController.text,
      "email": _emailController.text,
      "nomor_telepon": _nomorTlpController.text,
    });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Ticket")),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _namaOrtuController,
                  decoration: InputDecoration(labelText: "Nama Orang Tua"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Nama Orang Tua";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _umurOrtuController,
                  decoration: InputDecoration(labelText: "Umur Orang Tua"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Umur Orang Tua";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _jkOrtuController,
                  decoration:
                      InputDecoration(labelText: "Jenis Kelamin Orang Tua"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Jenis Kelamin Orang Tua";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _namaAnakController,
                  decoration: InputDecoration(labelText: "Nama Anak"),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Nama Anak";
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  controller: _umurAnakController,
                  decoration: InputDecoration(labelText: "Umur Anak"),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Umur Anak";
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  controller: _jkAnakController,
                  decoration:
                      InputDecoration(labelText: "Jenis Kelamin Anak Anak"),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Jenis Kelamin Anak";
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nomorTlpController,
                  decoration: InputDecoration(labelText: "Nomor Telpon"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Nomor Telpon";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveBooking().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    KodeBookingScreen(booking: value)));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Ticket Berhasil Di Pesan")));
                      });
                    }
                  },
                  child: Text("Pesan"),
                )
              ],
            )),
      ),
    );
  }
}
