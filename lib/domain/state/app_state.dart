// import 'package:flutter/material.dart';
// import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';
// import '../model/models.dart';

// import '../repository/demo_users.dart';

// /// State related to Stream-agram app.
// ///
// /// Manages the connection and stores a references to the [StreamFeedClient]
// /// and [StreamagramUser].
// ///
// /// Provides various convenience methods.
// class AppState extends ChangeNotifier {
//   /// Create new [AppState].
//   AppState({
//     required StreamFeedClient client,
//   }) : _client = client;

//   late final StreamFeedClient _client;

//   /// Stream Feed client.
//   StreamFeedClient get client => _client;

//   /// Stream Feed user - [StreamUser].
//   StreamUser get user => _client.currentUser!;

//   TuneLikeUser? _streamagramUser;

//   /// The extraData from [user], mapped to an [StreamagramUser] object.
//   TuneLikeUser? get streamagramUser => _streamagramUser;

//   /// Connect to Stream Feed with one of the demo users, using a predefined,
//   /// hardcoded token.
//   ///
//   /// THIS IS ONLY FOR DEMONSTRATIONS PURPOSES. USER TOKENS SHOULD NOT BE
//   /// HARDCODED LIKE THIS.
//   Future<bool> connect(DemoAppUser demoUser) async {
//     final currentUser = await _client.setUser(
//       User(id: demoUser.id),
//       demoUser.token!,
//       extraData: demoUser.data,
//     );

//     if (currentUser.data != null) {
//       _streamagramUser = TuneLikeUser.fromMap(currentUser.data!);
//       notifyListeners();
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
