import 'package:flutter/material.dart';

import 'ProfileScreen.dart';

class homee extends StatefulWidget {
  List<userdetailsone> _listhome = List();
  homee(this._listhome);
  @override
  _homeeState createState() => _homeeState();
}

class _homeeState extends State<homee> {
  String name;
  var phonenumber;
  var email;
  var dob;
  var address;
  var nickname;

  @override
  void setState(fn) {
    // name = widget._listhome[0].name;
    // print("nameeeeeisss$name");
    phonenumber = widget._listhome[0].phonenumber;
    email = widget._listhome[0].email;
    dob = widget._listhome[0].dob;
    address = widget._listhome[0].address;
    nickname = widget._listhome[0].nickname;

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    print("new updated name is${widget._listhome[0].name}");
    //print("in thenkjbnkusdfhg-------");
    //print("listhomeeehhhhhhhhhhhhhhhhhh${widget._listhome[0].name}");
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Screen"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                    'https://i.pinimg.com/564x/18/61/21/1861217e6f76f569f70ac2a9cca8ece7.jpg',
                    fit: BoxFit.fill,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    colorBlendMode: BlendMode.modulate),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                          color: Colors.red,
                          child: FlatButton(
                            child: Text(
                              "Name is:${name}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              setState(() {
                                name = widget._listhome[0].name;
                                //print("nameeeeeisss$name");
                              });
                            },
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Phonenumber:$phonenumber",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "E-mail:$email",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "DOB is:$dob",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Address is:$address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "nickname is:$nickname",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Previous Menu<------------"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
