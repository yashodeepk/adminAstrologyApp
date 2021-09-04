import 'package:admin/Pages/CheckPayments.dart';
import 'package:admin/Pages/HomePage.dart';
import 'package:admin/Pages/LoginPage.dart';
import 'package:admin/Pages/VerifyUser.dart';
import 'package:admin/api/signinapi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          home: Home(),
          // theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
        ),
      );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return PageNavigator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Signin fail'));
              } else {
                return LoginPage();
              }
            }),
      );
}

class PageNavigator extends StatefulWidget {
  const PageNavigator({Key? key}) : super(key: key);

  @override
  _PageNavigatorState createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int selectedPage = 0;

  final _pageOptions = [HomePage(), VerifyUser(), PaymentCheck()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageOptions[selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFF2C384A),
        selectedItemColor: Color(0xFFF57C00),
        unselectedItemColor: Colors.white,
        elevation: 0,
        // fixedColor: Color(0xff22262B),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Horoscope',
              backgroundColor: Color(0xFF2C384A)),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_fill),
              label: 'Verify',
              backgroundColor: Color(0xFF2C384A)
              // backgroundColor: Colors.transparent
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_rounded),
              label: 'Payments',
              backgroundColor: Color(0xFF2C384A)
              // backgroundColor: Colors.transparent
              ),
        ],
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
