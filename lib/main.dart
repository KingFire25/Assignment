import 'package:Assignment/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'mongodb.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Welcome Page',),
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Container(
              child: const Text("Welcome",style:TextStyle(fontSize: 39),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(  
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
                },  
                icon: Icon(Icons.arrow_circle_right),  
                label: Text("Next"),  
              ),
          ],
        ),
      ),
    );
  }
}
