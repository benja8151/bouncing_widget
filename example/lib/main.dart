import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _scaleFactor = 1.0;
  bool stayOnBottom = true;

  _onPressed(BuildContext context) {
    print("CLICK");
  }

  @override
  Widget build(BuildContext context) {
    print("BUild");
    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BouncingWidget(
              scaleFactor: _scaleFactor,
              onPressed: () => _onPressed(context),
              stayOnBottom: stayOnBottom,
              child: Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8185E2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            BouncingWidget(
              scaleFactor: _scaleFactor,
              onPressed: () {
                setState(() {
                  print("toto");
                  stayOnBottom = !stayOnBottom;
                });
                _onPressed(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            BouncingWidget(
              scaleFactor: _scaleFactor,
              onPressed: () => _onPressed(context),
              child: Text(
                "Hello !",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .5,
              child: Slider(
                activeColor: Colors.amber,
                inactiveColor: Colors.amberAccent,
                min: -5,
                max: 5,
                value: _scaleFactor,
                onChanged: (double newValue) {
                  setState(() {
                    _scaleFactor = newValue;
                  });
                },
              ),
            ),
            Center(
              child: Text(
                "Scale factor = ${num.parse(_scaleFactor.toStringAsFixed(2))}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
