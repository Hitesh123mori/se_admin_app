import 'package:flutter/material.dart' ;

class KClientsDesktop extends StatefulWidget {
  const KClientsDesktop({super.key});

  @override
  State<KClientsDesktop> createState() => _KClientsDesktopState();
}

class _KClientsDesktopState extends State<KClientsDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Key Clients",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
