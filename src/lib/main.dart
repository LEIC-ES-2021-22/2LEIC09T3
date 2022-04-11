import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uni',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Raleway'
          ),
          bodySmall: TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontFamily: 'Roboto',
            height: 1.5
          )
        )
      ),
      home: const HomePage(title: 'uni - 2LEIC09T3'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4.0, 4.0))
                ],
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Credits',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                  ),
                  Text(
                    'Project made by:\n'
                    '  André Lima - up202008169\n'
                    '  Guilherme Almeida - up202006137\n'
                    '  Guilherme Sequeira - up202004648\n'
                    '  Mariana Lobão - up202004260\n'
                    '  Pedro Ramalho - up202004715',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
            ),
          ],
        ),
      ),
    );
  }
}