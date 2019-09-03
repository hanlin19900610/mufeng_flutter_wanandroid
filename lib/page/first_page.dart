import 'package:flutter/material.dart';
import 'package:mufeng_flutter_wanandroid/store/index.dart'
    show Store, UserModel;

import 'second_page.dart';

class FirstPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('first page rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Store.connect<UserModel>(builder: (context, snapshot, child) {
              return Text('${Store.value<UserModel>(context).name}');
            }),
            TextField(
              controller: controller,
            ),
            Store.connect<UserModel>(builder: (context, snapshot, child) {
              return RaisedButton(
                child: Text('修改昵称'),
                onPressed: () {
                  snapshot.setName(controller.text);
                },
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.group_work),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
      ),
    );
  }
}
