import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {

  // QuerySnapshot _snapshot = FirebaseFirestore.instance.collection('memo').snapshots();

  @override
  _Test2State createState() => _Test2State();
}



class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('テストページ'),
      ),
      body: Column(

      ),
    );
  }
}
