import 'package:expresscrm/contacts.dart';
import 'package:expresscrm/products.dart';
import 'package:expresscrm/reports.dart';
import 'package:expresscrm/sales.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Express CRM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final bodyItems = [Products(), Contacts(), Sales(), Reports()];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.bodyItems[
          position], // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => {
          setState(() {
            position = index;
          })
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Products"),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text("Customers"),
            icon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(
            title: Text("Sales"),
            icon: Icon(Icons.add_shopping_cart),
          ),
          BottomNavigationBarItem(
            title: Text("Reports"),
            icon: Icon(Icons.dashboard),
          ),
        ],
        currentIndex: position,
      ),
    );
  }
}
