import 'package:adv_basics/custom_widget/app_titlebar.dart';
import 'package:adv_basics/login.dart';
import 'package:adv_basics/mfaRegister.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  bool _isDrawerOpen = false;

  final List<Widget> _tabs = [
    const MFA(), // see the HomeTab class below
    const Login() // see the SettingsTab class below
  ];
  // @override
  // Widget build(context) {
  //   // return CupertinoPageScaffold(
  //   //   backgroundColor: const Color.fromARGB(255, 232, 227, 227),
  //   //   navigationBar: CupertinoNavigationBar(
  //   //     leading: CupertinoButton(
  //   //         child: const Icon(Icons.arrow_back_ios),
  //   //         onPressed: () {
  //   //           Navigator.pushReplacement(
  //   //             context,
  //   //             MaterialPageRoute(builder: (context) => const Login()),
  //   //           );
  //   //         }),
  //   //     middle: const Text('Dashboard'),
  //   //   ),
  //   //   child: const SafeArea(
  //   //     child: Center(child: Text('Dashboard')),
  //   //   ),
  //   // );
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.eye_fill),
                    label: 'Overview',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.graph_circle_fill),
                    label: 'Dashplan',
                  ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return CupertinoPageScaffold(
                      navigationBar: appTitleBar(context, '', 'Dashboard'),
                      child: SafeArea(
                        child: Center(
                          child: Container(
                          //  color: Colors.blue,
                            child: const Text('Test Dashboard'),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 50.0,
          left: 15.0,
          //right: 0.0,
          child: Container(
           
            child: GestureDetector(
                onTap: () {
                  setState(() => _isDrawerOpen = true);
                },
                child: const Icon(
                  Icons.menu,
                  size: 30,
                )),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          top: 0.0,
          bottom: 0.0,
          left: _isDrawerOpen
              ? 0.0
              : -(MediaQuery.of(context).size.width / 3) * 2,
          child: Container(
            width: (MediaQuery.of(context).size.width / 3) * 2,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height / 1.8 - 90.0) -
                      120.0,
                  color: CupertinoColors.activeBlue,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 30.0,
                        left: 10.0,
                        child: GestureDetector(
                          onTap: () => setState(() => _isDrawerOpen = false),
                          child: const Icon(
                            CupertinoIcons.clear,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.8 + 30.0,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 46.0, top: 46.0),
                      child: Column(
                        children: <Widget>[
                          MenuItem(
                            icon: Icon(Icons.house),
                            label: 'Households',
                          ),
                          MenuItem(
                            icon: Icon(Icons.verified_user),
                            label: 'Contacts',
                          ),
                          MenuItem(
                            icon: Icon(Icons.password),
                            label: 'Change Password',
                          ),
                          MenuItem(
                            icon: Icon(Icons.logout),
                            label: 'Logout',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final Icon icon;
  final String label;

  const MenuItem({super.key, 
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 42.0),
      child: GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon.icon,
              color: CupertinoColors.activeBlue
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            
          ],
        ),
        onTap: () {
       Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
      },
      ),
    );
  }
}
