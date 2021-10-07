import 'package:admin/model/AdminsModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminInfoPage extends StatefulWidget {
  const AdminInfoPage({Key? key}) : super(key: key);
  static String? name;
  static String? photourl;
  static String? email;
  static bool? isSuperAdmin;

  @override
  _AdminInfoPageState createState() => _AdminInfoPageState();
}

class _AdminInfoPageState extends State<AdminInfoPage> {
  String? dropdownvalue;
  bool? superAdmin;
  void superadminCheck() {
    if (AdminInfoPage.isSuperAdmin == true) {
      dropdownvalue = 'SuperAdmin';
      superAdmin = true;
    } else {
      dropdownvalue = 'Admin';
      superAdmin = false;
    }
  }

  var items = ['Admin', 'SuperAdmin'];
  @override
  void initState() {
    superadminCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
          color: Color(0xFF2C384A),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          CircleAvatar(
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                image: AdminInfoPage.photourl!,
                placeholder: 'assets/noimage.jpg',
              ),
            ),
            radius: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              AdminInfoPage.name!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Mail - ' + AdminInfoPage.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Role -',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              DropdownButton(
                // underline: ,
                dropdownColor: Color(0xFF2C384A),
                value: dropdownvalue,
                icon: Icon(
                  Icons.person,
                  color: Color(0xfff57c00),
                ),
                style: TextStyle(color: Colors.white),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    if (dropdownvalue == 'SuperAdmin') {
                      superAdmin = true;
                    } else {
                      superAdmin = false;
                    }
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  AdminsInfo.delete(
                      docId: AdminInfoPage.email!, context: context);
                },
                child: Center(
                  child: Text("Delete"),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  fixedSize: Size(150, 45),
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (superAdmin != AdminInfoPage.isSuperAdmin) {
                    AdminsInfo.update(
                        email: AdminInfoPage.email!,
                        isSuperAdmin: superAdmin!,
                        context: context);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Nothing to Update already $dropdownvalue');
                  }
                },
                child: Center(
                  child: Text("Update"),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  fixedSize: Size(150, 45),
                  primary: Colors.white,
                  backgroundColor: Color(0xfff57c00),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
