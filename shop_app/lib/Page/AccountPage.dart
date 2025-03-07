import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Page/welcomePage.dart';
import 'package:shop_app/UserProvider.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUserStatus();
    });
  }

  void _checkUserStatus() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await  userProvider.loadSavedLogin();
    if (userProvider.user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: user != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${user['name'] ?? 'User'}!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Email: ${user['email'] ?? ''}'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      userProvider.logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    },
                    child: Text('Logout'),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
