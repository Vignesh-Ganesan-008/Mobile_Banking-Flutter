import 'package:Mobile_Banking/Dummy_DB.dart';
import 'package:Mobile_Banking/screens/home_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController pin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Vicky Pay",
          style: TextStyle(fontSize: 50, color: Colors.deepPurple),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: phoneNumber,
            maxLength: 10,
            autofocus: false,
            decoration: InputDecoration(labelText: "Phone Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (registeredNumbers.keys.contains(phoneNumber.text)) {
              buildShowDialog(context, () {
                if (registeredNumbers[phoneNumber.text] == pin.text) {
                  phoneNumber.text = "";
                  pin.text = "";
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              }, "PIN");
            } else {
              buildShowDialog(context, () {
                registeredNumbers.putIfAbsent(phoneNumber.text, () => pin.text);
                phoneNumber.text = "";
                pin.text = "";
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }, "New PIN");
            }
            logedPhone = int.parse(phoneNumber.text);
            dummy.putIfAbsent(logedPhone.toString(), () => {});
            amount.putIfAbsent(logedPhone.toString(), () => 50000.toString());
          },
          child: Text("Login"),
        )
      ],
    ));
  }

  Future buildShowDialog(BuildContext context, Function funn, String label) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.check_circle_outline_rounded,
                  size: 30,
                ),
                onPressed: funn)
          ],
          content: TextField(
            controller: pin,
            keyboardType: TextInputType.number,
            maxLength: 4,
            decoration: InputDecoration(labelText: label),
          ),
        );
      },
    );
  }
}
