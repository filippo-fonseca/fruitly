import 'package:FruitBasket/services/twilio/twilioService.dart';
import "package:flutter/material.dart";

import 'utils/constants.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController etUsername = TextEditingController();
  final twilioService = TwilioService();

  String nUsername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("fruitly"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/strawberry.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                    "Enter the name of the person you'd like to send a virtual fruit basket to.",
                    style: kHeader1Style,
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                // child: TextField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder().copyWith(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     labelText: 'Maria, Joseph, Daniel, etc....',
                //   ),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                    ),
                    TextFormField(
                      controller: etUsername,
                      decoration: InputDecoration(
                          hintText: 'Maria, Joseph, Daniel, Richard, etc...'),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            nUsername = etUsername.text;
                          });
                          twilioService.sendSMS(
                              "Hello $nUsername, someone has gratitude for you and has sent you a virtual fruit basket!",
                              "+506 60499858");
                          Navigator.pushNamed(context, "canvaspage");
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Text('Submit'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(left: 120.0),
                      child: Row(
                        children: <Widget>[
                          Text("Thank you, " + nUsername),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
