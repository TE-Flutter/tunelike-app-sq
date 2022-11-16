import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/user.dart';

/// Data model for a feed user's extra data.
@immutable
class TuneLikeUser {
  /// Data model for a feed user's extra data.
  const TuneLikeUser(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      this.profilePhoto,
      this.profilePhotoResized,
      this.profilePhotoThumbnail,
      this.genres,
      this.location,
      this.languages});

  /// Converts a Map to this.
  factory TuneLikeUser.fromMap(Map<String, dynamic> map) {
    return TuneLikeUser(
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      userName: map['user_name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profilePhoto: map['profile_photo'] as String?,
      profilePhotoResized: map['profile_photo_resized'] as String?,
      profilePhotoThumbnail: map['profile_photo_thumbnail'] as String?,
      genres: map['genres'] as List<Genre>?,
      location: map['location'] as LocationModel?,
      languages: map['languages'] as List<LanguageModel>?,
    );
  }

  /// Converts json to this.
  factory TuneLikeUser.fromJson(String source) =>
      TuneLikeUser.fromMap(json.decode(source) as Map<String, dynamic>);

  /// User's first name
  final String firstName;

  /// User's last name
  final String lastName;

  /// User's username
  final String userName;

  ///User's email
  final String email;

  ///User's password
  final String password;

  ///User's phone number
  final String phoneNumber;

  /// URL to user's profile photo.
  final String? profilePhoto;

  /// A 500x500 version of the [profilePhoto].
  final String? profilePhotoResized;

  /// A small thumbnail version of the [profilePhoto].
  final String? profilePhotoThumbnail;

  /// User preferred genres list
  final List<Genre>? genres;

  ///User geo history
  final LocationModel? location;

  ///User preferred languages
  final List<LanguageModel>? languages;

  /// Convenient method to replace certain fields.
  TuneLikeUser copyWith({
    String? firstName,
    String? lastName,
    String? userName,
    String? profilePhoto,
    String? profilePhotoResized,
    String? profilePhotoThumbnail,
    String? email,
    String? password,
    String? phoneNumber,
    List<Genre>? genres,
    LocationModel? location,
    List<LanguageModel>? languages,
  }) {
    return TuneLikeUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      profilePhotoResized: profilePhotoResized ?? this.profilePhotoResized,
      profilePhotoThumbnail:
          profilePhotoThumbnail ?? this.profilePhotoThumbnail,
      genres: genres ?? this.genres,
      location: location ?? this.location,
      languages: languages ?? this.languages,
    );
  }

  /// Converts this model to a Map.
  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'user_name': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profile_photo': profilePhoto,
      'profile_photo_resized': profilePhotoResized,
      'profile_photo_thumbnail': profilePhotoThumbnail,
      'genres': genres,
      'location': location,
      'languages': languages,
    };
  }

  /// Converts this class to json.
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return '''UserData(firstName: $firstName, lastName: $lastName, userName: $userName, profilePhoto: $profilePhoto, profilePhotoResized: $profilePhotoResized, profilePhotoThumbnail: $profilePhotoThumbnail)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TuneLikeUser &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userName == userName &&
        other.email == email &&
        other.profilePhoto == profilePhoto &&
        other.profilePhotoResized == profilePhotoResized &&
        other.profilePhotoThumbnail == profilePhotoThumbnail;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        userName.hashCode ^
        profilePhoto.hashCode ^
        profilePhotoResized.hashCode ^
        profilePhotoThumbnail.hashCode;
  }
}
