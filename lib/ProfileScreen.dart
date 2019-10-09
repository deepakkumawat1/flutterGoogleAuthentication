import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'homee.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class userdetailsone {
  var name;
  var phonenumber;
  var email;
  var dob;
  var address;
  var nickname;
  userdetailsone(
      {this.name,
      this.phonenumber,
      this.email,
      this.dob,
      this.address,
      this.nickname});
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _name;
  var _phonenumber;
  var _email;
  var _dob;
  var _address;
  var _nickname;
  bool _autoValidate = false;

  int _currentStep = 0;
  List<userdetailsone> _list = new List();
  final _formKey = GlobalKey<FormState>();
  //final _formkey = GlobalKey<FormState>();

  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  // var _namecontroller = TextEditingController();
  // var _phonecontroller = TextEditingController();
  // var _emailcontroller = TextEditingController();
  // var _dobcontroller = TextEditingController();
  // var _addresscontroller = TextEditingController();
  // var _nicknamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile Screen"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            color: Colors.black38,
            child: ListView(
              children: <Widget>[
                //Text("now you are in the 2 page"),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Stepper(
                        steps: _mySteps(),
                        currentStep: this._currentStep,
                        onStepTapped: (step) {
                          setState(() {
                            this._currentStep = step;
                          });
                        },
                        onStepContinue: () {
                          setState(() {
                            if (this._currentStep <
                                this._mySteps().length - 1) {
                              this._currentStep = this._currentStep + 1;
                            } else {
                              //Logic to check if everything is completed
                              //_submitbutton(context);
                              print('Completed, check fields.');
                            }
                          });
                        },
                        onStepCancel: () {
                          setState(() {
                            if (this._currentStep > 0) {
                              this._currentStep = this._currentStep - 1;
                            } else {
                              this._currentStep = 0;
                            }
                          });
                        },
                      ),
                    ),
                    color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _submitbutton(context),
                ),
              ],
            )));
  }

  Widget _submitbutton(BuildContext context) {
    return RaisedButton(
      color: Colors.blueAccent,
      child: Text("Submit"),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          print("name is --------->......>>>>$_name");
        } else {
          setState(() {
            _autoValidate = true;
          });
        }
        setState(() {
          //print("name is --------->......>>>>$_name");
          // print("phoennumber us is $_phonenumber");
          userdetailsone userdetail = userdetailsone(
              name: _name,
              phonenumber: _phonenumber,
              email: _email,
              dob: _dob,
              address: _address,
              nickname: _nickname);

          _list.add(userdetail);
          print("$_list");
          print(":List ijjdsbhjdbh ${_list[0].name}");
        });

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homee(_list)));
      },
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Step 1'),
        content: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter name";
                      } else
                        return null;
                    },
                    onSaved: (_) {
                      _name = _;
                    },
                    // controller: _namecontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                        labelText: "name",
                        border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3),
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter phone ";
                      } else
                        return null;
                    },
                    onSaved: (_) {
                      _phonenumber = _;
                    },
                    //controller: _phonecontroller,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "PhoneNUmber",
                        border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3),
                        )),
                  )),
            ],
          ),
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Step 2'),
        content: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Description";
                      } else
                        return null;
                    },
                    onSaved: (_) {
                      _email = _;
                    },
                    //controller: _emailcontroller,
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3),
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter DOB";
                      } else
                        return null;
                    },
                    onSaved: (_) {
                      _dob = _;
                    },
                    //controller: _dobcontroller,
                    decoration: InputDecoration(
                        labelText: "DOB",
                        border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3),
                        )),
                  )),
            ],
          ),
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Step 3'),
        content: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter address";
                      } else
                        return null;
                    },
                    onSaved: (_) {
                      _address = _;
                    },
                    //controller: _addresscontroller,
                    decoration: InputDecoration(
                        labelText: "address",
                        border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3),
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter nickname";
                      } else
                        return null;
                    },
                    onSaved: (_) {
                      _nickname = _;
                    },
                    //controller: _nicknamecontroller,
                    decoration: InputDecoration(
                        labelText: "Nickname",
                        border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3),
                        )),
                  )),
            ],
          ),
        ),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}
