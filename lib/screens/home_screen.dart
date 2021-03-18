import 'package:Mobile_Banking/Dummy_DB.dart';
import 'package:Mobile_Banking/widgets/bottom_modal_sheet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vicky Pay"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                writeCounter();
                readCounter();
                setState(() {});
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          newPayment(context, () {
            setState(() {});
          });
        },
        label: Text("New Payment"),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Transaction History",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: Divider(
              height: 3,
              thickness: 3,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: dummy[logedPhone.toString()]
                    .keys
                    .map<Widget>((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e,
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              dummy[logedPhone.toString()][e].toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        contentPadding: EdgeInsets.all(10),
                        title: Text("Balance"),
                        children: [
                          Center(
                              child: Text(
                            amount[logedPhone.toString()].toString(),
                            style: TextStyle(fontSize: 25),
                          ))
                        ],
                      );
                    },
                  );
                },
                child: Text("Check Balance")),
          )
        ],
      ),
    );
  }
}
