import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/detail_page.dart';

import 'add_page.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dog Name Voting",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  var input_wrod =TextEditingController();
  late int document_num;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dog Name Voting")),
      body: Column(
        children: [
          _buildBody(),
        ],


      ),



        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));

          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),

    );

  }
  final store = FirebaseFirestore.instance;

  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(  // Streamを監視して、イベントが通知される度にWidgetを更新する
      stream: FirebaseFirestore.instance.collection("memo").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> snapList) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(18.0),
        itemCount: snapList.length,
        itemBuilder: (context, i) {
          return _buildListItem(snapList[i]);
        }
    );
  }

  Widget _buildListItem(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical:9.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(data["titleだよ１"]),
          trailing: Text(data["detail"].toString()),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(snap)));

          },
          // onTap: () => snap.reference.update({"votes": FieldValue.increment(1)}),
        ),
      ),
    );
  }
}