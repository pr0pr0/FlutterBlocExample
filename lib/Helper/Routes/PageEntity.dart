// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;
  
  PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });
}
