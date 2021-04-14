import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_clinical_summary/features/home/HomeStore.dart';
import 'package:my_clinical_summary/repositories/models/viewModels.dart';
import 'package:my_clinical_summary/resources/components/CardItem.dart';
import 'package:my_clinical_summary/resources/components/CircularProgress.dart';
import 'package:my_clinical_summary/resources/consts/AppStrings.dart';
import 'package:my_clinical_summary/resources/exceptions/Failures.dart';
import 'package:my_clinical_summary/resources/utils/StoreStatus.dart';

class HomePage extends StatefulWidget {
  final HomeStore _homeStore;

  HomePage(this._homeStore);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    widget._homeStore.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.home,
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: RefreshIndicator(
          onRefresh: () async => widget._homeStore.refresh(),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (widget._homeStore.usersStatus == StoreStatus.Loading && widget._homeStore.usersAreEmpty)
                  return Expanded(
                    child: Center(child: CircularProgress()),
                  );
                  return _buildUsersList(widget._homeStore.users);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsersList(Either<Failures, List<UserViewModel>> items) {
    return items.fold(
      (failure) => Container(
        child: Text(AppStrings.usersErrorLoadingTitle),
      ),
      (users) => Expanded(
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (_, index) => _buildUsersDetails(users, index),
          itemCount: users.length,
        ),
      ),
    );
  }

  Widget _buildUsersDetails(List<UserViewModel> users, int index) {
    return Container(
      child: CardItem(
        user: users[index],
      ),
      height: 195,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 22,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}