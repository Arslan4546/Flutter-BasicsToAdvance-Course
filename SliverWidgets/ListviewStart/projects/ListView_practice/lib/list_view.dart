import 'package:flutter/material.dart';
import 'package:list_view_flutter/list_tile.dart';
import 'package:list_view_flutter/users.dart';

class UserListView extends StatelessWidget {
  final List<User> listOfUser;
  final DeleteFunction deleteFunction;
  const UserListView({super.key, required this.listOfUser, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfUser.length,
      itemBuilder: (context, index) => UserListTile(
        user: listOfUser[index],
        index: index,
        deleteFunction: deleteFunction,
      ),
    );
  }
}
