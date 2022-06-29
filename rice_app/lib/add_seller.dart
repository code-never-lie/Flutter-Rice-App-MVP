import 'package:flutter/material.dart';
import 'package:rice_app/data/temp_data.dart';

import 'package:rice_app/seller_data.dart';

class AddSeller extends StatefulWidget {
  const AddSeller({Key? key}) : super(key: key);

  @override
  State<AddSeller> createState() => _AddSellerState();
}

class _AddSellerState extends State<AddSeller> {
  static const String _title = 'Rice App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(_title),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30)))),
      body: ListView.builder(
        itemCount: TempData.userList.length,
        itemBuilder: (BuildContext context, int index) {
          // ignore: prefer_const_constructors
          return Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            shadowColor: const Color.fromARGB(255, 28, 4, 136),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.asset(
                'assets/images/rice_logo.png',
                height: 200,
              ),
              title: Text(TempData.userList[index].name),
              subtitle: Text(TempData.userList[index].phone),
              trailing: const Icon(Icons.person),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Sellerdata()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
