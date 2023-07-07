import 'package:flutter/material.dart';

import '../../fire_base/store_firebase.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData(){
    setState(() {
      isLoading = true;
    });
    StoreFirebase().getAllUsers();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {

    },);
  }
}
