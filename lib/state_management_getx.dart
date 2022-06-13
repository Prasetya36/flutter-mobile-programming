import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(
      title: 'State Management Getx',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(title: const Text('Halaman Awal')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    "${c.count}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 40),
                  )),
              ButtonBar(alignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    child: const Text("Screen 1"),
                    onPressed: () => Get.to(screen1())),
                ElevatedButton(
                    child: const Text("Screen 2"),
                    onPressed: () => Get.to(screen2())),
                ElevatedButton(
                    child: const Text("Screen 3"),
                    onPressed: () => Get.to(screen3())),
              ]),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: c.increment,
          tooltip: 'Ini tombol',
        ));
  }
}

class screen1 extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Halaman Pertama")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50),
        )));
  }
}

class screen2 extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Halaman Kedua")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50),
        )));
  }
}

class screen3 extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Halaman Ketiga")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50),
        )));
  }
}
