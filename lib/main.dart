import 'package:flutter/material.dart';
import 'package:flutter_gridio/gridio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Gridio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String selectedItem;

  @override
  void initState() {
    selectedItem = "Item 0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(15.0),
        child: Gridio<String>(
          itemBuilder: (context, item) {
            return Center(
              child: Text(
                item,
                style: TextStyle(
                  color: item == selectedItem ? Colors.white : Colors.black,
                ),
              ),
            );
          },
          value: selectedItem,
          onChanged: (value){
            setState(() {
              selectedItem = value;
            });
          },
          items: List.generate(10, (index) => "Item $index"),
        ),
      ),
    );
  }
}
