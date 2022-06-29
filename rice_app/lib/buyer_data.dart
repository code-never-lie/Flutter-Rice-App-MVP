import 'package:flutter/material.dart';
import 'package:rice_app/beatifull_form.dart';
import 'package:rice_app/model_class.dart';

import 'data/temp_data.dart';

class Buyer extends StatefulWidget {
  const Buyer({Key? key}) : super(key: key);

  @override
  State<Buyer> createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
  static const String _title = 'Rice App';
 // TextEditingController editingController = TextEditingController();

  List<User> items = [];

  @override
  void initState() {
    items.addAll(TempData.userList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<User> dummySearchList = [];

    dummySearchList.addAll(items);
    if (query.isNotEmpty) {
      List<User> dummyListData = [];

      for (var item in dummySearchList) {
        if (item.location.toLowerCase().contains(query)) {
          dummyListData.add(item);
          
        }
        else{
          // ignore: avoid_print
          print("No Data Found");
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(TempData.userList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(_title),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30)))),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
         //   controller: editingController,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:items.length,
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
                      title: Text(items[index].name),
                      subtitle: Text(items[index].phone),
                      trailing: const Icon(Icons.person),
                      onTap: () {
                        //signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Beautiful(user: items[index])),
                        );
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
