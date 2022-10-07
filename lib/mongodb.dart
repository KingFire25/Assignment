// ignore_for_file: constant_identifier_names, unused_element

import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
class MongoDB {
  static const MongURL ="mongodb+srv://test:test@cluster123.ep7naxj.mongodb.net/test?retryWrites=true&w=majority";
  static const coll_name ="users";
  static connect() async{
    var db = await Db.create(MongURL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(coll_name);
    // collection.insertOne({"name":"ABC","username":"test","password":"test1234"});
    collection.deleteMany({"name":"ABC"});
  }
}