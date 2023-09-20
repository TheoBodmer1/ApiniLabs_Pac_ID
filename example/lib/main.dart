// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_pkg/flutter_pkg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApiniLabs Test PAC-ID Package',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(title: 'ApiniLabs Test PAC-ID Package'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _issuerController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _pacIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _reset();
  }

  void _createPacId() {
    var p = PacId(
      _issuerController.text,
      _categoryController.text,
      _identifierController.text,
    );
    _pacIdController.text = p.toString();
  }

  void _reset() {
    _issuerController.text = "pac.apinilabs.com";
    _categoryController.text = "myapp";
    _identifierController.text = "MDEyMzQ1Njc4OTAxMjM0NQ";
    _pacIdController.text = "";
  }

  void _parseLink() {
    var p = PacId.fromLink(_pacIdController.text);
    _issuerController.text = p.issuer;
    _categoryController.text = p.category;
    _identifierController.text = p.identifier;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width - 110,
              child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _issuerController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Issuer',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width - 110,
              child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _categoryController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width - 110,
              child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _identifierController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'identifier',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Create PAC-ID'),
                  onPressed: () {
                    _createPacId();
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text('RESET'),
                  onPressed: () {
                    _reset();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width - 20,
              child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _pacIdController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'PAC-ID',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Parse Link'),
              onPressed: () {
                _parseLink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
