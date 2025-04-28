import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AnimatedSwitcher with LayoutBuilder')),
        body: SwitcherWidget(),
      ),
    );
  }
}

class SwitcherWidget extends StatefulWidget {
  @override
  _SwitcherWidgetState createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            layoutBuilder: (currentChild, previousChildren) {
              // Custom layout for the transition
              return Stack(
                children: [
                  ...previousChildren, // Old widgets will be stacked behind
                  Positioned(
                    left: 0,
                    top: 0,
                    child: currentChild ??
                        SizedBox.shrink(), // Current widget will be on top
                  ),
                ],
              );
            },
            child: _isFirst
                ? Container(
                    key: ValueKey<int>(1),
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: Center(
                        child: Text('Hello',
                            style: TextStyle(color: Colors.white))),
                  )
                : Container(
                    key: ValueKey<int>(2),
                    width: 200,
                    height: 200,
                    color: Colors.green,
                    child: Center(
                        child: Text('Goodbye',
                            style: TextStyle(color: Colors.white))),
                  ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFirst = !_isFirst; // Toggle between true and false
              });
            },
            child: Text('Switch Container'),
          ),
        ],
      ),
    );
  }
}
