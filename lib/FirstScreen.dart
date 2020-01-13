import 'package:flutter/material.dart';
import 'package:enetb/RegisterTeacher.dart';
import 'package:enetb/LoginScreen.dart';
import 'package:enetb/RegisterStudent.dart';

// render buttons
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        body: SingleChildScrollView(
        child: Center(

        child:
            Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 100, 0, 15),
                    height: 160.00,
                    width: 300.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bc.png"),
                      ),
                    ),
                  ),

          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child : ButtonTheme(
              minWidth: 250.0,
              height: 50.0,
              child:  RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Color(0xffee6200),
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('เข้าใช้งานสำหรับบุคลากร'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute<Null>(builder: (BuildContext context) { return new LoginUserTeacher();
                }));
              },
              ),
            ),
          ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child : ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child:  RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xfffe0000),
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('เข้าใช้งานสำหรับนักศึกษา'),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<Null>(builder: (BuildContext context) { return new LoginUserStudent();
                          }));
                        },
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child : ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child:  RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffee6200),
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('ลงทะเบียนสำหรับบุคลากร'),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<Null>(builder: (BuildContext context) { return new RegisterTeacher();
                          }));
                        },
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child : ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child:  RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xfffe0000),
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('ลงทะเบียนสำหรับนักศึกษา'),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<Null>(builder: (BuildContext context) { return new RegisterStudent();
                          }));
                        },
                      ),
                    ),
                  ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
