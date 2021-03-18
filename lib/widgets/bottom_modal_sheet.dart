import 'package:Mobile_Banking/widgets/circular_button.dart';
import 'package:flutter/material.dart';

import '../Dummy_DB.dart';

TextEditingController reciverID = TextEditingController();
TextEditingController transferAmount = TextEditingController();

void bankTransfer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(10.0),
        title: Text("Bank Details"),
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Account Number"),
          ),
          TextField(
            decoration: InputDecoration(labelText: " Re-enter Account Number"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "IFSC"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Recpient Name"),
            controller: reciverID,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Done"))
        ],
      );
    },
  );
}

void phoneTransfer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(10.0),
        title: Text("Phone Details"),
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Phone Number"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Recpient Name"),
            controller: reciverID,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Done"))
        ],
      );
    },
  );
}

void upiTransfer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(10.0),
        title: Text("UPI Details"),
        children: [
          TextField(
            decoration: InputDecoration(labelText: "UPI ID"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Recpient Name"),
            controller: reciverID,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Done"))
        ],
      );
    },
  );
}

void newPayment(BuildContext context, Function fun) {
  reciverID.text = "";
  transferAmount.text = "";
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularButton(() {
                    bankTransfer(context);
                  }, Icons.transform_outlined, "Bank Transfer"),
                  CircularButton(() {
                    phoneTransfer(context);
                  }, Icons.phone, "Number"),
                  CircularButton(() {
                    upiTransfer(context);
                  }, Icons.text_format_sharp, "UPI"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: "Amount to transfer"),
                  controller: transferAmount,
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (transferAmount.text.isNotEmpty) {
                      if (double.parse(amount[logedPhone.toString()]) <
                          double.parse(transferAmount.text)) {
                        transferAmount.text = "";
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: Text("Insufficient Balance"),
                                titlePadding: EdgeInsets.all(10),
                              );
                            });
                      } else {
                        amount[logedPhone.toString()] =
                            (int.parse(amount[logedPhone.toString()]) -
                                    int.parse(transferAmount.text))
                                .toString();
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Icon(
                                Icons.check,
                                size: 100,
                                color: Colors.white,
                              );
                            });
                        if (dummy[logedPhone.toString()]
                            .containsKey(reciverID.text)) {
                          dummy[logedPhone.toString()].update(
                              reciverID.text, (value) => transferAmount.text);
                        } else {
                          dummy[logedPhone.toString()].putIfAbsent(
                              reciverID.text, () => transferAmount.text);
                        }
                      }
                    }
                    fun();
                  },
                  child: Text("Pay to " + reciverID.text)),
            ],
          ),
        );
      });
}
