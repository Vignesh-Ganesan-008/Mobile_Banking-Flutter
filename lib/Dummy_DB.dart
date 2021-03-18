import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Map dummy;
Map amount;
Map registeredNumbers;
// Map dummy = {
//   '1234567890': {
//     'Vignesh': '1000',
//     'Ram': '500',
//     'Raj': '100',
//     'Simon': '100',
//     'Syed': '1000',
//     'Ruth': '500',
//     'Rakesh': '100',
//     'Peakash': '100',
//     'Kumar': '1000',
//   },
//   '9789257576': {
//     'Jaga': '1000',
//     'R': '500',
//     'RK': '100',
//     'Suru': '100',
//     'Sugumar Sir': '1000',
//     'Priya Mam': '500',
//     'Shanthi Mam': '100',
//     'Prakash': '100',
//   },
// };

// Map amount = {'1234567890': '50000', '9789257576': '75000'};
// Map registeredNumbers = {'1234567890': '1234', '9789257576': '0000'};
int logedPhone = 0;

void toStringMap() {
  jsonEncode(dummy);
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory);
  return directory.path;
}

Future<File> get _localHis async {
  final path = await _localPath;
  return File('$path/his.txt');
}

Future<File> get _localMon async {
  final path = await _localPath;
  return File('$path/mon.txt');
}

Future<File> get _localUser async {
  final path = await _localPath;
  return File('$path/user.txt');
}

writeCounter() async {
  print("wirte");
  var history = jsonEncode(dummy);
  var money = jsonEncode(amount);
  var users = jsonEncode(registeredNumbers);
  final file1 = await _localHis;
  final file2 = await _localMon;
  final file3 = await _localUser;
  file2.writeAsString('$money');
  file3.writeAsString('$users');
  file1.writeAsString('$history');
}

readCounter() async {
  print("read");
  try {
    final file1 = await _localHis;
    final file2 = await _localMon;
    final file3 = await _localUser;

    String contents1 = await file1.readAsString();
    String contents2 = await file2.readAsString();
    String contents3 = await file3.readAsString();
    print(contents1);
    print(contents2);
    print(contents3);
    dummy = jsonDecode(contents1);
    amount = jsonDecode(contents2);
    registeredNumbers = jsonDecode(contents3);
    print("hello");
  } catch (e) {
    // If encountering an error, return 0.
    return 0;
  }
}
