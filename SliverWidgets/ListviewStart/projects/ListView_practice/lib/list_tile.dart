import 'package:flutter/material.dart';
import 'package:list_view_flutter/users.dart';

typedef DeleteFunction = void Function(int);

class UserListTile extends StatelessWidget {
  final User user;
  final int index;
  final DeleteFunction deleteFunction;

   const UserListTile(
      {super.key,
      required this.user,
      required this.index,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Dismissible(
          key: ValueKey(user.userName),
          movementDuration: const Duration(milliseconds: 700),
          resizeDuration: const Duration(milliseconds: 400),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) => deleteFunction(index),
          background: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFE4A49),
              borderRadius: BorderRadius.circular(15)
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.delete, color: Colors.white,),
                Text('Delete', style: TextStyle(fontFamily: 'Jost', color: Colors.white),)
              ],
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              user.userName,
              style: const TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              user.occupation,
              style: const TextStyle(
                fontFamily: 'jost',
              ),
            ),
            // trailing: const Icon(FontAwesomeIcons.greaterThan, size: 10,),
            tileColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ),
    );
  }
}






// Slidable(
//           key: ValueKey(user.userName),
//           endActionPane: ActionPane(
//             motion: const StretchMotion(),
//             dismissible: DismissiblePane(onDismissed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data')))),
//             extentRatio: 1,
//               children: [
//                SlidableAction(
//                 onPressed: (context) => deleteFunction(index),
//                 borderRadius: BorderRadius.circular(15),
//                 backgroundColor: const Color(0xFFFE4A49),
//                 foregroundColor: Colors.white,
//                 icon: Icons.delete,
//                 label: 'Delete',
//               ),
//             ],
//           ),
//           child: ListTile(
//             leading: const Icon(Icons.person),
//             title: Text(
//               user.userName,
//               style: const TextStyle(fontFamily: 'Jost', fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               user.occupation,
//               style: const TextStyle(
//                 fontFamily: 'jost',
//               ),
//             ),
//             // trailing: const Icon(FontAwesomeIcons.greaterThan, size: 10,),
//             tileColor: Colors.white,
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//           ),
//         ),
