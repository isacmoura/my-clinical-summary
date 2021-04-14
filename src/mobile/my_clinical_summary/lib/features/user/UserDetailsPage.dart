import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:my_clinical_summary/features/user/UserStore.dart';
import 'package:my_clinical_summary/repositories/models/viewModels.dart';
import 'package:my_clinical_summary/resources/components/CircularProgress.dart';
import 'package:my_clinical_summary/resources/consts/AppStrings.dart';
import 'package:my_clinical_summary/resources/exceptions/Failures.dart';
import 'package:my_clinical_summary/resources/utils/StoreStatus.dart';

class UserDetailsPage extends StatefulWidget {
  final UserStore _userStore;
  final int id;

  UserDetailsPage(this._userStore, {Key key, this.id}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    widget._userStore.getUserInformation(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Modular.to.pop(),
      ), 
        centerTitle: true,
        title: Text(AppStrings.userDetails,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: RefreshIndicator(
          onRefresh: () async =>
              widget._userStore.getUserInformation(widget.id),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (widget._userStore.userStatus == StoreStatus.Loading &&
                    widget._userStore.userIsEmpty)
                  return Expanded(
                    child: Center(child: CircularProgress()),
                  );
                return _buildUserDetails(widget._userStore.user);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetails(Either<Failures, UserViewModel> user) {
    return user.fold(
      (failure) => Container(
        child: Text(AppStrings.usersErrorLoadingTitle),
      ),
      (user) => Expanded(
        child:
            ListView(controller: _controller, children: [_buildUserCard(user)]),
      ),
    );
  }

  Widget _buildUserCard(UserViewModel user) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: _buildUserInfo(user),
            height: 150,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 0,
            ),
          ),
          Text(
            AppStrings.medications,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
          Column(
            children: user.medications
                .map((m) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Nome: ${m.name}', style: TextStyle(fontSize: 16)),
                      Text('Descrição: ${m.description}', style: TextStyle(fontSize: 16)),
                    ]))
                .toList(),
          ),
          Divider(height: 10, thickness: 1, color: Colors.black),
          Text(
            AppStrings.futureAppointments,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
          Column(
            children: widget._userStore.futureAppointments.map((e) =>
              Column(
                children: [
                  Text(e.name),
                  Text(e.description),
                  Text(e.date.toString())
                ]))
              .toList(),
          ),
          Divider(height: 10, thickness: 1, color: Colors.black),
          Text(
            AppStrings.pastAppointments,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
          Column(
            children: widget._userStore.pastAppointments.map((e) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${e.name}', style: TextStyle(fontSize: 16)),
                  Text('Descrição: ${e.description}', style: TextStyle(fontSize: 16)),
                  Text('Data: ${DateFormat('dd/MM/yyyy – HH:mm').format(e.date.toLocal())}', style: TextStyle(fontSize: 16))
                ]))
              .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(UserViewModel user) {
    return Card(
      color: Colors.white60,
      elevation: 3,
      child: Container(
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 16, left: 16),
                color: Colors.transparent,
                child: Text(
                  user.name,
                  style: TextStyle(
                      color: Color(0xff444444),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.clip,
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  user.email,
                  style: TextStyle(
                      color: Color(0xff444444),
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  overflow: TextOverflow.clip,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
