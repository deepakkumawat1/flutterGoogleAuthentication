import 'ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  String _email;
  String _password;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future _signIn(BuildContext context) async {
    setState(() async {
      print("in signin fhuction");
      try {
        final GoogleSignInAccount googleUser = await _googlSignIn.signIn();

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        AuthResult userDetails =
            await _firebaseAuth.signInWithCredential(credential);
        print(userDetails.user.email);
      } catch (e) {
        print("ERROR..................$e");
      }

      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new ProfileScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("afttttt");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("            Form_Login"),
          leading: Icon(FontAwesomeIcons.truckMonster),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Container(
              //color: Colors.red,
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
                    SizedBox(height: 10.0),
                    Container(
                        width: 250.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Color(0xffffffff),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xffCE107C),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                _signIn(context).then((user) {
                                  print(user);
                                  print("In onpressed of function");
                                }).catchError((e) => print(e));
                              });
                            },
                          ),
                        )),
                    Container(
                      width: 250.0,
                      child: Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Color(0xffffffff),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.google,
                                    color: Color(0xffCE107C),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Sign Out from account',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.0),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                try {
                                  _googlSignIn.signOut().whenComplete(() {
                                    setState(() {});
                                  });
                                  print("Signing------------- out---------");
                                } catch (e) {
                                  print("signout error===============-");
                                }
                              })),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: RaisedButton(
                      //     child: Text("Sign out"),
                      //     onPressed: () {
                      //       try {
                      //         _googlSignIn.signOut().whenComplete(() {
                      //           setState(() {});
                      //         });
                      //         print("Signing------------- out---------");
                      //       } catch (e) {
                      //         print("signout error===============-");
                      //       }

                      //       //  await .instanc.signOut().then((_) {
                      //       //   print("uuuussseeerrr ssiiigggnnnoouuuttt");
                      //       //   });
                      //       // Navigator.pop(context);
                      //     },
                      //   ),
                      // )
                    )
                  ])
            ],
          )),
        ));
  }

  // void signOutGoogle() async {
  //   await FirebaseAuth.instance.signOut().then((_) {
  //     print("uuuussseeerrr ssiiigggnnnoouuuttt");
  //   });
  // }
}
