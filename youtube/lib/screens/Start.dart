import 'package:flutter/material.dart';

import '../infra/Api.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.pesquisar("");

    return Container(
      child: Center(
        child: Text(
          "Start",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
