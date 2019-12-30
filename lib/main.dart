import 'package:flutter/material.dart';
import 'helper/GetMediaSize.dart';
import 'package:kpoplistapp/screens/MainList.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Login()
      ),
    );
  }
}

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screenWidth(context,dividedBy: 1),
                height: screenHeightExcludingToolbar(context, dividedBy: 3),
                color:Colors.black,
                child: FutureBuilder(
                  future: loadAsset(),
                  builder: (context, snapshot) {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Container(
                width: screenWidth(context,dividedBy: 1),
                height: screenHeightExcludingToolbar(context, dividedBy: 1.79),
                color:Colors.green,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(icon: Icon(Icons.account_circle),labelText: "Email"),
                        ),
                        TextFormField(
                          decoration: InputDecoration(icon: Icon(Icons.lock),labelText: "Password"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: SizedBox(
                            width: screenWidth(context,dividedBy: 1) * 0.8,
                            child: RaisedButton(
                              color: Colors.blue,
                              child:Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context) => MainList()));
                              }
                            ),
                          ),
                        ), 
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth(context,dividedBy: 1),
                height: screenHeightExcludingToolbar(context, dividedBy: 6),
                color:Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        "Don't Have a Account? Join in!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('lib/data/DefaultData.json');
}