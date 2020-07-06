import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My first App Screen",
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  var displayResult = "";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      getImageAsset(),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: principalController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              // ignore: missing_return
                              return "Please enter the principal";
                            }

                          },
                          decoration: InputDecoration(
                            labelText: "Principal",
                            hintText: "Enter Principal ",
                            errorStyle:
                                TextStyle(fontSize: 15.0, color: Colors.yellow),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          controller: rateController,
                          keyboardType: TextInputType.number,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Please enter the Rate";

                            }

                          },
                          decoration: InputDecoration(
                            labelText: "Amount ",
                            hintText: "Enter Amount ",
                            errorStyle:
                            TextStyle(fontSize: 15.0, color: Colors.yellow),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          controller: timeController,
                          keyboardType: TextInputType.number,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Please enter the time";
                            }

                          },
                          decoration: InputDecoration(
                            labelText: "Time ",
                            hintText: "Enter Time ",
                            errorStyle:
                            TextStyle(fontSize: 15.0, color: Colors.yellow),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                color: Colors.lightBlue,
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      this.displayResult = _calculateResult();
                                    }
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 10.0,
                            ),
                            Expanded(
                                child: RaisedButton(
                              child: Text("Reset"),
                              color: Colors.deepOrange,
                              onPressed: () {
                                setState(() {
                                  _reset();
                                });
                              },
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          this.displayResult,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/dollar.jpg");
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    );
    return Container(
      child: image,
    );
  }

  String _calculateResult() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double time = double.parse(timeController.text);
    double simpleInterest = (principal * rate * time) / 100;
    String result = "Simple interest : $simpleInterest";
    return result;
  }

  void _reset() {
    principalController.text = "";
    rateController.text = "";
    timeController.text = "";
    displayResult = "";
  }
}
