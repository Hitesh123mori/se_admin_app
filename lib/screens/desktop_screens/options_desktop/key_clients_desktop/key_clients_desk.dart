import 'package:flutter/material.dart' ;
import 'package:se_admin_app/models/client.dart';


class ClientsDetailDesktop extends StatefulWidget {
  final KClient client ;
  const ClientsDetailDesktop({super.key, required this.client});

  @override
  State<ClientsDetailDesktop> createState() => _ClientsDetailDesktopState();
}

class _ClientsDetailDesktopState extends State<ClientsDetailDesktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(widget.client.name,style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
