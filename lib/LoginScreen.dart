import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:enetb/FirstScreen.dart';
import 'package:enetb/HomeScreen.dart';

class LoginUserStudent extends StatefulWidget {

  LoginUserStudentState createState() => LoginUserStudentState();

}

class LoginUserTeacher extends StatefulWidget {

  LoginUserTeacherState createState() => LoginUserTeacherState();

}


class LoginUserStudentState extends State {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final idController = TextEditingController();
  final passwordController = TextEditingController();


  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller

    String id = idController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'http://128.199.170.20/api_enetb/login_student.php';

    // Store all data with Param Name.
    var data = {
      'id': id,
      'password': password
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    if(message == 'เข้าสู่ระบบสำเร็จ !'){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new HomeScreen(userId : id);
                  }));
                },
              ),
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        },
      );
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('เข้าสู่ระบบสำหรับนักศึกษา')),
        backgroundColor: Theme.of(context).accentColor,
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('',
                          style: TextStyle(fontSize: 21))),

                  Container(
                    height: 148.00,
                    width: 148.00,
                    padding: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/student.png"),
                      ),
                    ),
                  ),


                  Container(
                      width: 300,
                      height: 80,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: idController,
                        autocorrect: true,
                        decoration:
                        InputDecoration(hintText: 'รหัสประจำตัวนักศึกษา',
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                        ),

                      )
                  ),

                  Container(
                      width: 300,
                      height: 80,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: passwordController,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'รหัสผ่าน',
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),

                        ),
                      )
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child : ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child:  RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffee6200),
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('เข้าสู่ระบบ'),
                        onPressed: () {
                          userRegistration();

                        },
                      ),
                    ),
                  ),

                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator( backgroundColor: Colors.black)
                      )
                  ),

                ],
              ),
            )));
  }
}



class LoginUserTeacherState extends State {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final idController = TextEditingController();
  final passwordController = TextEditingController();


  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller

    String id = idController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'http://128.199.170.20/api_enetb/login_teacher.php';

    // Store all data with Param Name.
    var data = {
      'id': id,
      'password': password
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    if(message == 'เข้าสู่ระบบสำเร็จ !'){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new HomeScreen(userId : id);
                  }));
                },
              ),
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('เข้าสู่ระบบสำหรับบุคลากร')),
        backgroundColor: Theme.of(context).accentColor,
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('',
                          style: TextStyle(fontSize: 21))),

                  Container(
                    height: 148.00,
                    width: 148.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/prof.png"),
                      ),
                    ),
                  ),



                  Container(
                      width: 300,
                      height: 80,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: idController,
                        autocorrect: true,
                        decoration:
                        InputDecoration(hintText: 'Username',
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                        ),

                      )
                  ),

                  Container(
                      width: 300,
                      height: 80,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: passwordController,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),

                        ),
                      )
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child : ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child:  RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffee6200),
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('เข้าสู่ระบบ'),
                        onPressed: () {
                          userRegistration();
                        },
                      ),
                    ),
                  ),

                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator( backgroundColor: Colors.black)
                      )
                  ),

                ],
              ),
            )));
  }
}