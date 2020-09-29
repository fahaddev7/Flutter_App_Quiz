import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:quiz_app/quizpage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> images = [
    "images/py.png",
    "images/java.png",
   
  ];
  Widget customcard(String langname, String image) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Getjson(),));
        },
        child: Material(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 10.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(100.0),
                    elevation: 5.0,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: ClipOval(
                        child: Image(
                          
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  langname,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("hfbjd,hf jhd,jsgsdasgdj ,afsgd rekglkrejglkrejglkerjglkrjglkjglkdgjgfjsda, sdg gfds",
                    maxLines: 3,
                    style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        title: Text("Quiz Arena"),
      ),
      body: ListView(
        
        children: <Widget>[
          customcard("Python", images[0]),
          customcard("Java",images[1]),
          
          
          ],
      ),
    ), 
    onWillPop: (){
      return showDialog(context: context,builder: (context)=>AlertDialog(
        title: Text("Warning"),
        content: Text("Do you want to Exit"),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(context).pop(true);
          }, child: Text("Yes"), ),
          FlatButton(onPressed: (){
            Navigator.of(context).pop(false);
          }, child: Text("No"), ),
        ],
      ),);
  });
  }
}
