import 'package:flutter/material.dart';
import 'package:my_clinical_summary/features/user/UserStore.dart';
//import 'package:my_clinical_summary/auto_export.dart';


class UserDetailsPage extends StatefulWidget {
  final UserStore _userStore;
  final int id;

  UserDetailsPage(this._userStore, {Key key, this.id}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
