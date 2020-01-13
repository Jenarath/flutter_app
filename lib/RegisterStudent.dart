import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:enetb/FirstScreen.dart';

class RegisterStudent extends StatefulWidget {
  RegisterStudent() : super();

  final String title = "ลงทะเบียนสำหรับนักศึกษา";
  @override
  RegisterStudentState createState() => RegisterStudentState();
}

class RegisterStudentState extends State<RegisterStudent> {
  //
  static final String uploadEndPoint =
      'http://128.199.170.20/api_enetb/register_student.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  bool visible = false ;

  // Getting value from TextField widget.
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final studentIdController = TextEditingController();
  final passwordController = TextEditingController();

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });

    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String studentId = studentIdController.text;
    String password = passwordController.text;
    if(tmpFile == null || firstName.isEmpty || lastName.isEmpty || studentId.isEmpty || password.isEmpty){
      alertDialog();
    }else{
      String fileName = tmpFile.path.split('/').last;
      uploadData(fileName,firstName,lastName,studentId,password);
    }
  }

  alertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('กรุณาใส่ข้อมูลให้ครบถ้วน !'),
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

  uploadData (String fileName, String firstName, String lastName, String studentId, String password) async {

    // Store all data with Param Name.
    var data = {
      'image' : base64Image,
      'name' : fileName,
      'firstName': firstName,
      'lastName': lastName,
      'studentId': studentId,
      'password': password
    };

    // Starting Web API Call.
    var response = await http.post(uploadEndPoint, body: json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    if(message == 'ลงทะเบียนสำเร็จ !'){
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
                    return new FirstScreen();
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

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return  Container(
              decoration: BoxDecoration(color: Colors.teal),
              child: Padding(
              padding: const EdgeInsets.all(8.0),
                child: Image.file(snapshot.data, fit: BoxFit.fill),
              )
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ลงทะเบียนสำหรับนักศึกษา')),
      body:  Container(padding: EdgeInsets.only(top : 50.0, left: 80, right: 80),
        child: SingleChildScrollView(
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: chooseImage,
              child: Text('เลือกรูปภาพ'),
            ),
            SizedBox(
              height: 20.0,
            ),

                Container(
                    width: 300,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: firstNameController,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'ชื่อจริง',
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
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: lastNameController,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'นามสกุล',
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
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: studentIdController,
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
                    margin: const EdgeInsets.only(bottom: 20.0),
                    width: 300,
                    height: 70,
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

                ButtonTheme(
                  minWidth: 300.0,
                  height: 50.0,
                  padding: EdgeInsets.all(20.0),
                  child:  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xfffe0000),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('ลงทะเบียน'),
                    onPressed: startUpload,
                  ),
                ),


          ],
        ),
      )),
    );

  }
}
