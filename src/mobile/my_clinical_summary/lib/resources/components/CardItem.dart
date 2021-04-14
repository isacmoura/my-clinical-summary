import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/AppRoutes.dart';
import 'package:my_clinical_summary/repositories/models/viewModels.dart';

class CardItem extends StatelessWidget {
  final UserViewModel user;
  final int index;

  const CardItem({Key key, @required this.user, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: Card(
        color: Colors.white60,
        elevation: 3,
        child: Container(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.only(top: 16, left: 16),
                  color: Colors.blueAccent,
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
              Positioned.fill(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16),
                  child: InkWell(
                      child: Icon(Icons.arrow_forward,
                          size: 30, color: Colors.blueAccent),
                      onTap: () => Modular.to.pushNamed(
                            AppRoutes.user.replaceFirst(":id", "${user.id.toString()}"),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
