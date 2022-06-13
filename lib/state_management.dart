import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "State Management",
      initialRoute: '/Screen',
      routes: {
        '/Screen': (context) => const MyHomePage(title: "Halaman Pertama"),
        '/screen1': (context) => const onescreen(),
        '/screen2': (context) => const secondscreen(),
        '/screen3': (context) => const thirdscreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_counter',
                style: TextStyle(fontSize: 50),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Screen1'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/screen1',
                          arguments: Data('$_counter', 'Halaman Pertama'));
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Screen2'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/screen2',
                          arguments: Data('$_counter', 'Halaman Kedua'));
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Screen3'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/screen3',
                          arguments: Data('$_counter', 'Halaman Ketiga'));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Data {
  final String title;
  final String count;

  Data(this.count, this.title);
}

class onescreen extends StatelessWidget {
  const onescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count, style: const TextStyle(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}

class secondscreen extends StatelessWidget {
  const secondscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count, style: const TextStyle(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}

class thirdscreen extends StatelessWidget {
  const thirdscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count, style: const TextStyle(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
