import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class sign_up extends StatefulWidget {
  @override
  sign_upState createState() {
    return sign_upState();
  }
}

// Create a corresponding State class, which holds data related to the form.
// ignore: camel_case_types
class sign_upState extends State<sign_up> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  static const String _title = 'Rice App';
  String accounType = "Seller";
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
          title: const Text(_title),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30)))),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/rice_logo.png',
                height: 200,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  )),
              Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          icon: Icon(Icons.person),
                          hintText: 'Enter your full name',
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          icon: Icon(Icons.phone),
                          hintText: 'Enter a phone number',
                          labelText: 'Phone',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          icon: Icon(Icons.calendar_today),
                          hintText: 'Enter your date of birth',
                          labelText: 'Dob',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter valid date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.09),
                          child: ToggleSwitch(
                            minWidth: 170.0,
                            cornerRadius: 20.0,
                            activeBgColors: const [
                              [Color.fromARGB(255, 0, 102, 255)],
                              [Color.fromARGB(255, 0, 102, 255)]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor:
                                const Color.fromARGB(255, 165, 165, 165),
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: const ['Seller', 'Buyer'],
                            radiusStyle: true,
                            onToggle: (index) {
                              // ignore: avoid_print
                              print('switched to: $index');
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: SizedBox(
                            height: 50,
                            width: 340,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
