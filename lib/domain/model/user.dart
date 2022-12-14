import 'package:flutter/material.dart';

class Genre {
  final int id;
  final String name;
  final Color color;
  Genre({required this.id, required this.name, required this.color});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class GenreCategory {
  final String name;
  final List<Genre> genres;

  GenreCategory(this.name, this.genres);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreCategory &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          genres == other.genres;

  @override
  int get hashCode => name.hashCode ^ genres.hashCode;
}

class LocationModel {
  final String address;

  LocationModel(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModel &&
          runtimeType == other.runtimeType &&
          address == other.address;

  @override
  int get hashCode => address.hashCode;
}

class LanguageModel {
  final String name;
  final String languageCode;

  LanguageModel(this.name, this.languageCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          languageCode == other.languageCode;

  @override
  int get hashCode => name.hashCode ^ languageCode.hashCode;
}
