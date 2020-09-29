import 'package:flutter/material.dart';
import 'package:quiz_app/Home.dart';

class Results extends StatefulWidget {
  int marks;
  Results({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState(marks);
}

class _ResultsState extends State<Results> {
  int marks;
  _ResultsState(this.marks);

  List<String> image = [
    "images/good.png",
    "images/bad.png",
    "images/success.png",
  ];

  String message;
  String images;
  @override
  void initState() {
    if (marks < 20) {
      images = image[1];
      message = "try again next time \n you scored $marks marks";
    } else if (marks < 35) {
      images = image[0];
      message = "Well played try harder \n you scored $marks marks";
    } else {
      images=image[2];
      message="congrats \n you scored $marks marks";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 9,
              child: Material(
                child: Container(
                    height: 250.0,
                    width: 250.0,
                    child: Column(
                      children: <Widget>[
                        ClipRect(
                          child: Image(
                            image: AssetImage(
                              images,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(message),
                        ),
                      ],
                    )),
              )),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Continue"),
                  ),
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 5.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
