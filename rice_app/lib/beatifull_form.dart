

import 'dart:io';

import 'package:flutter/material.dart';

import 'model_class.dart';

class Beautiful extends StatefulWidget {
  final User user;
  const Beautiful({Key? key, required this.user}) : super(key: key);

  @override
  State<Beautiful> createState() => _BeautifulState();
}

class _BeautifulState extends State<Beautiful> {
  static const String _title = 'Rice App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(_title),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)))),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 7,
              shadowColor: Colors.grey,
              child: ListView(children: <Widget>[
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Seller Information',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )),
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text('Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(widget.user.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Phone #',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(widget.user.phone,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Location',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(widget.user.location,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Num of Bag',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(widget.user.numofbag,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Weight of Bag',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                      DataCell(Text(widget.user.wigofbag,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                    ]),
                  ],
                ),
                 const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // ignore: unnecessary_null_comparison
                    widget.user.file != null
                        ? Wrap(
                            children: widget.user.file .map((imageone) {
                              return Card(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.file(File(imageone.path)),
                                ),
                              );
                            }).toList(),
                          )
                        : Container()
                  ],
                ),
              ),
              ])),
        ));
  }
}
