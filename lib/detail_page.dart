import 'package:flutter/material.dart';
import 'package:my_first_app/search_test_page.dart';

class DetailPage extends StatelessWidget {
  var data;
  DetailPage(this.data ) ;

  final List<String> searchTargets =
  List.generate(10, (index) => 'Something ${index + 1}');

  List<String> searchResults = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body:Column(
        children: [
          ListTile(
            title: Text(data['detail']),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchTestPage(data)));
            },
          ),


        ],
      ),

    );
  }

}
