import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  Sales({Key key}) : super(key: key);

  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final List<String> sales = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sales",
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
                  sales.add("valuw");
                })
              },
            )
          ],
        ),
        body: ListView.separated(
          itemCount: sales.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            final item = sales[index];
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  sales.removeAt(index);
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
                title: Text(sales[index]),
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
