import 'package:admin/model/MenuItemModel.dart';
import 'package:admin/AstrologerUtils/AstrologerPage.dart';
import 'package:admin/AstrologerUtils/TempAstrologer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyAstrologer extends StatefulWidget {
  const VerifyAstrologer({Key? key}) : super(key: key);

  @override
  _VerifyAstrologerState createState() => _VerifyAstrologerState();
}

class _VerifyAstrologerState extends State<VerifyAstrologer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF2C384A),
        appBar: AppBar(
          title: Text('Verify Astrologer'),
          centerTitle: true,
          actions: [
            PopupMenuButton<MenuIteam>(
                color: Color(0xFF2C384A),
                onSelected: (item) => onSelect(context, item),
                itemBuilder: (context) => [
                      ...MenuIteams.iteamsSuperAdmin.map(buildIteam).toList(),
                    ]),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Astrologers',
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Temp-Astrologers',
                icon: Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
          backgroundColor: Color(0xFFF57C00),
        ),
        body: TabBarView(
          children: [
            AllAstrologer(),
            TempAstrologerPage(),
          ],
        ),
      ),
    );
  }
}
