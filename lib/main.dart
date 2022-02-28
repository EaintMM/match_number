import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Number',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Match Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //var list = new List<int>.generate(9, (i) => i + 1);
  //var numlist = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var img1 = 1;
  var img2 = 2;
  var img3 = 3;
  var num = 2;
  var score = 0;
  var msg = '';
  var list = [];

  void change() {
    setState(() {
      list = [];
      Random random = new Random();
      while (list.length < 3) {
        int randnum = random.nextInt(8) + 1;
        if (!list.contains(randnum)) {
          list.add(randnum);
        }
      }
      img1 = list[0];
      img2 = list[1];
      img3 = list[2];
      list.shuffle();
      num = list.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please select $num',style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (num == img1) {
                    setState(() {
                      score++;
                      msg = "Your answer is correct ";
                    });
                  } else {
                    setState(() {
                      msg = "Your answer is not correct";
                    });
                  }
                },
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('images/$img1.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              // 2nd image
              InkWell(
                onTap: () {
                  if (num == img2) {
                    setState(() {
                      score++;
                      msg = "Your answer is correct ";
                    });
                  } else {
                    setState(() {
                      msg = "Your answer is not correct";
                    });
                  }
                },
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/$img2.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //3rd image
              InkWell(
                onTap: () {
                  if (num == img3) {
                    setState(() {
                      score++;
                      msg = "Your answer is correct ";
                    });
                  } else {
                    setState(() {
                      msg = "Your answer is not correct";
                    });
                  }
                },
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/$img3.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text(msg),

              SizedBox(
                height: 20,
              ),

              // next button
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  print('hi');
                  change();
                  print(img1);
                  print(num);
                },
                child: Text('Next'),
              ),

              SizedBox(
                height: 20,
              ),

              // Score
              Text('Your score : $score')
            ],
          ),
        ),
      ),
    );
  }
}
