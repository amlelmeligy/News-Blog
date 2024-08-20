import 'package:flutter/material.dart';
import 'package:project/login/widget/messages.dart';

class chatscreen extends StatelessWidget {
  const chatscreen({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 65, 91),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              )),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.only(left: 16, bottom: 30, top: 30, right: 16),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

///////
class chatscreenforfriend extends StatelessWidget {
  const chatscreenforfriend({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 133, 136, 138),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              )),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.only(left: 16, bottom: 30, top: 30, right: 16),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
