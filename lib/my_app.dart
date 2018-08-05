import 'package:flutter/material.dart';
import 'package:learning_design/custom_widgets/my_float_button.dart';
import 'package:learning_design/simple_dialog/simple_dialog.dart';
import 'package:learning_design/utils/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Designs',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
        buttonColor: Colors.purple,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Constants.RootRoute: (BuildContext context) => MyHomePage(),
        Constants.MySimpleDialog: (BuildContext context) => MySimpleDialog(),
        Constants.MyFloatButton: (BuildContext context) => MyFloatButton(),
      },
    );
  }
}

class ExampleList {
  const ExampleList({this.title, this.subTitle});

  final String title;
  final String subTitle;
}

final List<ExampleList> _examplesList = <ExampleList>[
  ExampleList(
    title: 'Simple Dialog',
    subTitle: 'A simple dialog using material design components...',
  ),
  ExampleList(
    title: 'Custom Floating Button',
    subTitle: 'A custom Floating button widget using material design...',
  ),
  ExampleList(
    title: 'More Designs',
    subTitle: 'Coming soon :). You are welcome to contribute anytime ',
  ),
];

class MyHomePage extends StatelessWidget {
  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(Constants.MySimpleDialog);
        break;
      case 1:
        Navigator.of(context).pushNamed(Constants.MyFloatButton);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Flutter Design'),
      ),
      body: ListView.builder(
        itemCount: _examplesList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            leading: CircleAvatar(
              child: Text(_examplesList[index].title[0]),
            ),
            title: Text(_examplesList[index].title),
            subtitle: Text(_examplesList[index].subTitle),
            onTap: () => _navigateToPage(context, index),
          );
        },
      ),
    );
  }
}