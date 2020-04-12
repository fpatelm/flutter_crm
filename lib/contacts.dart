import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final List<String> contatcs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Customers",
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.blueGrey,
              ),
              onPressed: () => {
                setState(() {
                  contatcs.add("valuw");
                })
              },
            )
          ],
        ),
        body: 
        contatcs.isEmpty ? Center(child: Text("Add a customer")) :
        
        ListView.separated(
          itemCount: contatcs.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            final item = contatcs[index];
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  contatcs.removeAt(index);
                });

                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Removed"),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Remove",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              child: ListTile(
                title: Text(contatcs[index]),
                subtitle: Text("data"),
                onTap: () => {},
                selected: true,
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              key: UniqueKey(),
            );
          },
        ));
  }
}
