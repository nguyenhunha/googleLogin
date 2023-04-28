import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../services/firebase_services.dart';
import 'google_login.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('photoURL:'),
            Image.network(_currentUser.photoURL!),
            SizedBox(
              height: 20,
            ),

            Divider(),
            Text('displayName:'),
            Text("${_currentUser.displayName}"),


            Divider(),
            Text('email:'),
            Text("${_currentUser.email}"),
            SizedBox(
              height: 20,
            ),

            Divider(),
            Text('uid:'),
            Text("${_currentUser.uid}"),

            Divider(),
            Text('ProviderData:'),
            Text("${_currentUser.providerData}"),
            Divider(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.logout_string,),
              onPressed: () async {
                await FirebaseServices().googleSignOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GoogleLoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
