import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Offset _startOffset = Offset.zero;
  Offset _endOffset = Offset.zero;
  Offset _updateOffset = Offset.zero;

  double _bottomContainerHeight = 300;
  double get bottomContainerHeight => _bottomContainerHeight;
  set bottomContainerHeight (double value) {
    _bottomContainerHeight = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
              ),
              const SizedBox(height: 300,),
            ],
          )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (value){
                _updateOffset = value.delta;

                final result = bottomContainerHeight - _updateOffset.dy;

                if(result < 300){
                  return;
                }

                if(result > MediaQuery.of(context).size.height - 100){
                  return;
                }

                setState(() {
                  bottomContainerHeight = result;
                });
              },
              onVerticalDragEnd: (value){
                final benchMark = (((MediaQuery.of(context).size.height - 100 ) - 300 )/ 2) + 300;

                print(benchMark);

                if(bottomContainerHeight < benchMark){
                  setState(() {
                    bottomContainerHeight = 300;
                  });
                  return;
                }else{
                  setState(() {
                    bottomContainerHeight = MediaQuery.of(context).size.height - 100;
                  });
                  return;
                }
              },
              child: Container(
                alignment: Alignment.center,
                child: Text("Bottom sheet dialog"),
                height:bottomContainerHeight,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.redAccent),),
            ),
          ),
        ],
      ),
    );
  }
}
