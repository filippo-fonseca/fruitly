import 'package:FruitBasket/services/twilio/twilioService.dart';
import 'package:FruitBasket/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "widgets/canvas.dart";

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(FruitBasket());
}

class FruitBasket extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _FruitBasketState createState() => _FruitBasketState();
}

class _FruitBasketState extends State<FruitBasket> {
  TextEditingController etUsername = TextEditingController();
  Canvas canvas = Canvas();
  String nUsername = "";
  final twilioService = TwilioService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.centerRight,
                        child: Center(
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
                            color: Colors.pink[300],
                            textColor: Colors.white,
                            child: Text('Submit'),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Thank you $nUsername",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
