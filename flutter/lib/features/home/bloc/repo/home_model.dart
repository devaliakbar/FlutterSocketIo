import 'package:flutter/material.dart';

enum MessageOwner { SENDER, RECIEVER }

class HomeModel {
  final String message;
  final MessageOwner messageOwner;

  HomeModel({@required this.message, @required this.messageOwner});
}
