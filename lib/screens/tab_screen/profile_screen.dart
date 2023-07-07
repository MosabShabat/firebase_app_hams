import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../fire_base/store_firebase.dart';

class FriendPage extends StatefulWidget {
  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StoreFirebase().getAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  snapshot.data![index].name,
                  style: GoogleFonts.actor(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1,
                  ),
                ),
                subtitle: Text(snapshot.data![index].email),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    color: Colors.orange),
              );
            },
          );
        } else {
          return Text("no data found");
        }
      },
    );
  }
}
