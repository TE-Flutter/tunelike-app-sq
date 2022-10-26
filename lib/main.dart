import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:soar_quest/soar_quest.dart';

late SQCollection categories, courses, lessons;

void main() async {
  await SQApp.init("TuneLike",
      userDocFields: [SQStringField("Telegram Username")],
      firebaseOptions: DefaultFirebaseOptions.currentPlatform);

  await UserSettings.setSettings([
    SQBoolField("Visual Impairment", value: false),
  ]);

  categories = FirestoreCollection(id: "Categories", fields: [
    SQStringField("Title"),
    SQStringField("Description"),
    SQImageField("Image"),
  ]);

  courses = FirestoreCollection(id: "Courses", fields: [
    SQStringField("Title"),
    SQStringField("Description"),
    SQRefField("Categories", collection: categories),
    SQRefDocsField("Lessons",
        refCollection: () => lessons, refFieldName: "Course"),
  ], actions: [
    GoScreenAction("Go to Lessons",
        icon: Icons.note,
        screen: (courseDoc) => CollectionScreen(collection: lessons))
  ]);

  lessons = FirestoreCollection(id: "Lessons", fields: [
    SQStringField("Title"),
    SQStringField("Description"),
    SQRefField("Course", collection: courses),
    VideoLinkField("Video Link"),
  ]);

  SQApp.run(
      SQNavBar(
        [
          GalleryScreen(collection: categories),
          GalleryScreen(collection: courses),
          // GalleryScreen(collection: lessons),
          UserSettings.settingsScreen(),
        ],
      ),
      drawer: SQDrawer([]));
}
