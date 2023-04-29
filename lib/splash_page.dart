import 'package:flutter/material.dart';
import 'package:web_nav_use_frank_fiireb/routes/app_routes.dart';
import 'package:web_nav_use_frank_fiireb/routes/router_delegate.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SplashPage') ,),
      body: Column(
        children: [
          Container(
            child: Text('SplashPage'),
          ),
          ElevatedButton(onPressed: (){
            HARouterDelegate.instance.push(HARoutePath.mainTab());
          }, child: Text('To MainTabPage'))
        ],
      ),
    );
  }
}
