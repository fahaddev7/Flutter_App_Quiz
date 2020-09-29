import 'dart:async';
import 'dart:convert';






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/results.dart';


class Getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            backgroundColor: Colors.grey,
            body: Center(
              child: Text("loading"),
            ),
          );
        } else {
          return Quizpage(mydata: mydata);
        }
      },
    );
  }
}

class Quizpage extends StatefulWidget {
   var mydata;
  Quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _QuizpageState createState() => _QuizpageState(mydata);
}

class _QuizpageState extends State<Quizpage> {
  var mydata;
  _QuizpageState(this.mydata);

  Color colortoshow = Colors.indigo;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int timer = 60;
  String showtimer="60";

  Map<String,Color> btncolor = {
    "a" : Colors.purple,
    "b" : Colors.purple,
    "c" : Colors.purple,
    "d" : Colors.purple,
  };
 
// bool canceltimer = false;

  @override
  void initState(){
    starttimer();
    super.initState();
  }

  void starttimer() async{
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(() {
        if(timer < 1){
           t.cancel();
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Results(marks: marks),));}
        //   nextq();
        // }
        // else if(canceltimer==true){
        //   t.cancel();
        // }
        // else {
        //   timer= timer-1;
        // }
        timer = timer-1;
        showtimer = timer.toString();
      });
    });
  }

  int i = 1;

  void nextq(){
    // canceltimer=false;
    // timer=30;
    setState(() {
      if (i < 10) {
    i++;      
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Results(marks:marks),));
    }
    btncolor["a"]=Colors.indigoAccent;
    btncolor["b"]=Colors.indigoAccent;
    btncolor["c"]=Colors.indigoAccent;
    btncolor["d"]=Colors.indigoAccent;
    });
    // starttimer();
  }
  void checkans(String k){
    if(mydata[2]["1"] == mydata[1]["1"][k]){
      marks=marks+5;
      colortoshow=right;
    }else{
      colortoshow=wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      // canceltimer=true;
    });

  Timer(Duration(seconds: 2), nextq);
  
  }

  Widget custombutton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: MaterialButton(
        onPressed: () => checkans(k),
        color: btncolor[k],
        splashColor: Colors.indigoAccent,
        highlightColor: Colors.indigo,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        minWidth: 200.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            mydata[1][i.toString()][k],
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(mydata[0][i.toString()],
                    style: TextStyle(
                      fontFamily: "times new roman",
                      fontSize: 18.0,
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                children: <Widget>[
                  custombutton("a"),
                  custombutton("b"),
                  custombutton("c"),
                  custombutton("d"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container( 
              child: Center(child: Text("Duration: $showtimer sec",style:TextStyle(fontSize: 20.0,),)),
              
            ),
          ),
        ],
      ),
    );
  }
}
