import 'package:flutter/material.dart';
import 'package:mufeng_flutter_wanandroid/store/index.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('second page rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Store.connect<UserModel>(
                builder: (context, snapshot, child) {
                  return Text('${Store.value<UserModel>(context).name}');
                }
            ),
            TextField(
              controller: controller,
            ),
            Store.connect<UserModel>(
                builder: (context, snapshot, child){
                  return RaisedButton(
                    child: Text('修改昵称'),
                    onPressed: (){
                      snapshot.setName(controller.text);
                    },
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
