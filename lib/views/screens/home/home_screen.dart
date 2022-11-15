import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int? currentID;

  @override
  Widget build(BuildContext context) {
    return
        // FirebaseFirestore.instance
        //             .collection('Users')
        //             .where('UserID' == currentID) ==
        //         null
        //     ? const Scaffold()
        //     :
        Scaffold(
      appBar: AppBar(
          title: const Text('TuneLike'), centerTitle: true, elevation: 0),
      // appBar: MyAppbar(title: const Text('TuneLike')),
      body: const Center(
        child: Text(
          'Home',
        ),
      ),
    );
  }
}
