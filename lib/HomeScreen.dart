import 'package:booking_ticket_bus_mobile/ListTicketScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _asalController = TextEditingController();
  TextEditingController _tujuanController = TextEditingController();

  Future searchTicket() async {
    var search = [
      _tanggalController.text,
      _asalController.text,
      _tujuanController.text
    ];

    return search;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Ticket"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(labelText: "Tanggal"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Tanggal";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _asalController,
                decoration: InputDecoration(labelText: "Asal"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Asal";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tujuanController,
                decoration: InputDecoration(labelText: "Tujuan"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Tujuan";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      searchTicket().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListTicketScreen()));
                      });
                    }
                  },
                  child: Text("Cari"))
            ],
          )),
    );
  }
}
