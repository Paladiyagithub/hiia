import 'package:flutter/material.dart';
import 'package:hii/insertpage.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    double totalewidth = MediaQuery.of(context).size.width;
    double totaleheight = MediaQuery.of(context).size.height;

    double stbarheight = MediaQuery.of(context).padding.top;
    double nvbarheight = MediaQuery.of(context).padding.bottom;
    double bodyheight = totaleheight - stbarheight - nvbarheight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Row(
              children: [
                Container(margin: EdgeInsets.only(left: totaleheight  * 0.008,top: totaleheight * 0.01),
                  child: Text("Contacts",
                      style: TextStyle(fontSize: totaleheight * 0.050)),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: totaleheight * 0.045, top: totaleheight * 0.012),
                      child: Icon(Icons.check_box)),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: totaleheight * 0.030, top: totaleheight * 0.012),
                      child: Icon(Icons.search)),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: totaleheight * 0.030, top: totaleheight * 0.012),
                      child: Icon(Icons.more_vert_sharp)),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.indigoAccent,
          onPressed: () {
            Navigator.pushReplacement(   context, MaterialPageRoute(
              builder: (context) {
                return second();
              },
            ));
          },
          label: Icon(Icons.add,)),
    );
  }
}
