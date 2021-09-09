import 'package:admin/AllPageutils/EditPage.dart';
import 'package:admin/AllPageutils/MenuItemModel.dart';
import 'package:admin/model/HoroschopeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static bool? isSuperuser;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      appBar: AppBar(
        title: Text('Horoscope'),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuIteam>(
              color: Color(0xFF2C384A),
              onSelected: (item) => onSelect(context, item),
              itemBuilder: (context) => [
                    ...MenuIteams.iteamsSuperAdmin.map(buildIteam).toList(),
                  ]),
        ],
        backgroundColor: Color(0xFFF57C00),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: Database.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var noteInfo = snapshot.data!.docs[index].data();
                String docID = snapshot.data!.docs[index].id;
                // String title = noteInfo['title'];
                String description = noteInfo['General Horoscope'];
                String love = noteInfo['Love'];
                String health = noteInfo['Health'];
                Timestamp datetime = noteInfo['UpdatedAt'];
                DateTime datetime2 = datetime.toDate();
                DateTime datetime1 = DateTime.now();
                final hr = datetime1.difference(datetime2).inHours;
                // final min = datetime1.difference(datetime2).inMinutes;
                bool colorchange = false;
                // print(hr.toString());
                if (hr > 24) {
                  colorchange = true;
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xFFECEFF1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onTap: () {
                        EditPage.docName = docID;
                        EditPage.discription = description;
                        EditPage.love = love;
                        EditPage.health = health;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditPage()));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            docID,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Updated ' + hr.toString() + ' Hours ago',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: colorchange
                                    ? Colors.redAccent
                                    : Colors.greenAccent),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        description,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFF57C00),
              ),
            ),
          );
        },
      ),
    );
  }
}
