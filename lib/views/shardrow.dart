import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShardRow extends StatefulWidget {
  final String name;
  final String myShards;
  ShardRow(this.name, this.myShards);

  @override
  _ShardRowState createState() => _ShardRowState(this.name, this.myShards);
}

class _ShardRowState extends State<ShardRow> {
  final String name;
  final String myShards;
  _ShardRowState(this.name, this.myShards);


void nameShard() async {
    SharedPreferences names = await SharedPreferences.getInstance();
    if (names.getStringList('names') != null) {
      var shardNames = names.getStringList('names');
      shardNames.add('turkey');
      names.setStringList('names', shardNames);
    } else {
      var shardNames = <String>['chicken'];
      names.setStringList('names', shardNames);
    }
  }

void getShardNames() async {
  SharedPreferences names = await SharedPreferences.getInstance();
  var something = names.getStringList('names');
  print(something);
}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget> [
            CircleAvatar(
              child: Text(name[0]),
              ),
            Padding(padding: EdgeInsets.only(right: 10.0)),
            Text(name),
            FlatButton(
              onPressed: null,
              padding: EdgeInsets.all(2.0),
              child: Icon(
                Icons.edit,
                color: Colors.green[600],
                size: 30,
              )
            ),
            FlatButton(
              onPressed:getShardNames,
              child: Icon(
                Icons.photo_camera,
                color: Colors.green[600],
                size: 30,
              )
            ),
          ]
        )
      )
    );
  }
}

 