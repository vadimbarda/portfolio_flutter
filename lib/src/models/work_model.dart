import 'package:flutter/material.dart';

class WorkModel {
  const WorkModel({
    required this.name,
    required this.position,
    required this.location,
    required this.startDate,
    this.endDate,
    this.description,
    this.logo,
    this.links,
    this.type,
    this.locationType,
  });

  final String name;
  final String position;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;
  final String? description;
  final ImageProvider? logo;
  final List<Uri>? links;
  final String? type;
  final String? locationType;
}
