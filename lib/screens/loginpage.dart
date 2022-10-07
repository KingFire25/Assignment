// ignore_for_file: prefer_final_fields

import 'package:Assignment/screens/homescreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController(),
      pass = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    bool obs=true;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Enter your username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: pass,
                obscureText: obs,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                  setState(() {
                      obs = !obs;   ////not working idk why
                  });
                },
                  icon: Icon(
                        obs ? Icons.visibility : Icons.visibility_off,
                      )
                  ),
                      fillColor: Colors.grey, 
                      focusColor: Colors.grey,
                      labelText: 'Enter your password',
                ),
              ),
            ),
            
            const SizedBox(
              height:40,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                if(pass.text.isEmpty || name.text.isEmpty){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Username or Password is empty",),backgroundColor: Colors.red,));
                }
                /*
                
                Authentication code

                */
                else
                  Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
              },
              icon: Icon(Icons.arrow_circle_right),
              label: Text("Login"),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginDetails()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    )
                  ),
                child: const Text(
                  "Skip and use as a guest",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
class loginDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _loginDetail();
}
class _loginDetail extends State<loginDetails>{
  @override
  TextEditingController _name = TextEditingController(),
      _add = TextEditingController(),_pnum=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Info"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _name,
              decoration: InputDecoration(
                labelText: "Name"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _pnum,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone Number",
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _add,
              decoration: InputDecoration(
                labelText: "Address"
              ),
            ),
          ),
          FloatingActionButton.extended(
            elevation: 0,
            onPressed: (){
              if(_add.text.isEmpty || _name.text.isEmpty || _pnum.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Field is empty",
                    ),
                    backgroundColor: Colors.red,
                  ));
              } else  
                Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
            }, 
            label: Row(children: [
              Icon(Icons.save),Text("  Save"),])
            )
        ],
      ),
    );
  }

}
