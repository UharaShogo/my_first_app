import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  Future<void> addMemo() async{
    var collection = await FirebaseFirestore.instance.collection("memo");
    collection.add({
      'title': titleController.text,
      'detail': detailController.text,
      'created_date': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('追加ページ'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('タイトル'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                  width: MediaQuery.of(context).size.width *0.8,
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10)

                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('メモ内容'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  width: MediaQuery.of(context).size.width *0.8,
                  child: TextField(
                    controller: detailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)

                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width *0.8,
                alignment: Alignment.center,
                child: RaisedButton(
                  color:  Theme.of(context).primaryColor,
                    onPressed: () async{
                      await addMemo();
                      Navigator.pop(context);


                    },
                    child: Text('追加',style: TextStyle(color: Colors.white)),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
