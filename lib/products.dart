import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final List<String> products = [];
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
                  products.add("valuw");
                })
              },
            )
          ],
        ),
        body: ListView.separated(
          itemCount: products.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            final item = products[index];
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  products.removeAt(index);
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
                    "Products",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              child: ListTile(
                title: Text(products[index]),
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
