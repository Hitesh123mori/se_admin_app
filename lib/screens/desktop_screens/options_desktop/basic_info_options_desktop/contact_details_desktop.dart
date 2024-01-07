import 'package:flutter/material.dart';

class ContactDetailsDesktop extends StatefulWidget {
  const ContactDetailsDesktop({super.key});

  @override
  State<ContactDetailsDesktop> createState() => _ContactDetailsDesktopState();
}

class _ContactDetailsDesktopState extends State<ContactDetailsDesktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Contact Details",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
