import 'package:flutter/material.dart';
import 'package:my_clinical_summary/features/home/HomeStore.dart';

class HomePage extends StatefulWidget {
  final HomeStore _homeStore;

  HomePage(this._homeStore);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
