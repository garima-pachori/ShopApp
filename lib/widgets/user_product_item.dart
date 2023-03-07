import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {

  final String title;
  final String imageURL;

  UserProductItem(
    this.title,
    this.imageURL
  );


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      trailing: Row(children: <Widget>[
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.delete),
            color: Theme.of(context).errorColor,
          )
      ]),
    );
  }
}