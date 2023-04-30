import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  _MainTabPageState createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  @override
  void initState() {
    super.initState();
    if (UniversalPlatform.isAndroid) {
      // TODO
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MainTabPage') ,),
      body: Container(
        child: Text('MainTabPage'),
      ),
    );
  }
}
