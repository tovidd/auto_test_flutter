import 'package:flutter/material.dart';
import 'dart:async';

import '../bloc/home_bloc.dart';
import '../bloc/home_provider.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = HomeProvider.of(context);
    bloc.reset();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Automation Test'),
      ),
      body: buildBody(context, bloc),
      backgroundColor: Colors.white,
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
      duration: Duration(seconds: 1),
    ));
  }

  Widget buildBody(BuildContext context, HomeBloc bloc) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: <Widget>[
          all(),
          allButton(),
          allTextField(),
          allSlider(bloc),
          allRadioButton(bloc),
          allImage(),
          allSwitch(bloc),
          allCheckBox(bloc),
          all()
        ],
      ),
    );
  }

  Widget allButton() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Flat Button'),
          Row(
            children: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.send,
                  color: Colors.blue,
                  size: 40,
                  semanticLabel: 'Semantic Label: Flat Button (Icon)',
                  key: Key('flat_button_key'),
                ),
                color: Colors.blue[100],
                onPressed: () {
                  showInSnackBar('Clicked on: Flat Button (Icon)');
                },
              ),
              SizedBox(
                width: 20,
              ),
              FlatButton(
                child: Text(
                  'Flat button',
                  style: TextStyle(color: Colors.blue),
                ),
                color: Colors.blue[100],
                onPressed: () {
                  showInSnackBar('Clicked on: Flat Button (Text)');
                },
              ),
            ],
          ),
          Text('Raised Button'),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Icon(
                  Icons.send,
                  color: Colors.blue,
                  size: 40,
                  semanticLabel: 'Semantic Label: Raised Button (Icon)',
                  key: Key('raised_button_key'),
                ),
                color: Colors.blue[100],
                onPressed: () {
                  showInSnackBar('Clicked on: Raised Button (Icon)');
                },
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                child: Text(
                  'Raised button',
                  style: TextStyle(color: Colors.blue),
                ),
                color: Colors.blue[100],
                onPressed: () {
                  showInSnackBar('Clicked on: Raised Button (Text)');
                },
              ),
            ],
          ),
          Text('Icon Button'),
          Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 40,
                  ),
                  onPressed: () {
                    showInSnackBar('Clicked on: Icon Button (Icon)');
                  },
                  tooltip: 'icon button',
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 10),
                color: Colors.blue[100],
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () {
                    showInSnackBar('Clicked on: Icon Button (Icon)');
                  },
                  tooltip: 'icon button 2',
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(top: 10),
                color: Colors.pink[100],
              ),
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget allTextField() {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Text Field Hint', labelText: 'Text Field Label'),
                onTap: () {
                  showInSnackBar('Clicked on: Text Field');
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 50,
              width: 150,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Text Form Field Hint',
                    labelText: 'Text Form Field Label'),
                onTap: () {
                  showInSnackBar('Clicked on: Text Form Field');
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    ));
  }

  Widget allRadioButton(HomeBloc bloc) {
    return StreamBuilder(
        stream: bloc.radioButtonValue,
        builder: (context, AsyncSnapshot<int> snapshot) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: snapshot.data ?? 0,
                    onChanged: (val) {
                      bloc.addRadioButtonValue(val);
                      showInSnackBar('Clicked on: Radio 1');
                    },
                  ),
                  Text('Radio 1'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                    value: 1,
                    groupValue: snapshot.data ?? 0,
                    onChanged: (val) {
                      bloc.addRadioButtonValue(val);
                      showInSnackBar('Clicked on: Radio 2');
                    },
                  ),
                  Text('Radio 2'),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          );
        });
  }

  Widget allImage() {
    return Column(
      children: <Widget>[
        Text('Ini gambar'),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          color: Colors.blue,
          child: GestureDetector(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
              width: 100,
              height: 100,
            ),
            onTap: () {
              showInSnackBar('Clicked on: Image');
            },
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget allSlider(HomeBloc bloc) {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: bloc.sliderValues,
          builder: (context, AsyncSnapshot<double> snapshot) {
            return Slider(
              activeColor: Colors.indigoAccent,
              min: 0.0,
              max: 100.0,
              onChanged: (val) {
                bloc.addSliderValues(val);
                showInSnackBar('Clicked on: Slider (value: $val)');
                Timer(Duration(milliseconds: 900), () {
                  _scaffoldKey.currentState.removeCurrentSnackBar();
                });
              },
              value: snapshot.data ?? 0,
            );
          },
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget allSwitch(HomeBloc bloc) {
    return Column(
      children: <Widget>[
        StreamBuilder<bool>(
          stream: bloc.switchValue,
          builder: (context, snapshot) {
            return Container(
              margin: EdgeInsets.only(left: 150, right: 150),
              child: Switch(
                value: snapshot.data ?? false,
                onChanged: (val) {
                  bloc.addSwitchValue(val);
                  showInSnackBar('Clicked on: Switch');
                },
                activeTrackColor: Colors.lightBlue[300],
                activeColor: Colors.blue,
              ),
            );
          },
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget allCheckBox(HomeBloc bloc) {
    return Column(
      children: <Widget>[
        StreamBuilder<bool>(
          stream: bloc.checkBoxValue,
          builder: (context, snapshot) {
            return Container(
              child: Checkbox(
                value: snapshot.data ?? false,
                onChanged: (val) {
                  bloc.addCheckBoxValue(val);
                  showInSnackBar('Clicked on: Check Box');
                },
                checkColor: Colors.blue,
              ),
            );
          },
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget all() {
    return Container(
      child: SizedBox(
        height: 50,
      ),
    );
  }
}
