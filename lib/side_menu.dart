import 'package:adv_basics/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: MySideMenu(title: 'Flutter Demo Home Page'),
    );
  }
}

class MySideMenu extends StatefulWidget {
  final String title;
  const MySideMenu({Key? key, required this.title}) : super(key: key);

  @override
  _MySideMenuState createState() => _MySideMenuState();
}

class _MySideMenuState extends State<MySideMenu> {
  bool _isDrawerOpen = false;

//   List<BottomNavigationBarItem> items = [
//     const BottomNavigationBarItem(label: 'Tab 1', icon: Icon(Icons.ac_unit)),
//     const BottomNavigationBarItem(label: 'Tab 2', icon: Icon(Icons.ac_unit)),
//   ];

//   List<String> titles = ["title 1", "title 2"];
//   List<String> contents = ["contents 1", "contents 2"];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: SizedBox(
          width: 100,
          child: GestureDetector(
              onTap: () {
                setState(() => _isDrawerOpen = true);
              },
              child: Icon(
                Icons.menu,
                size: 30,
              )),
        ),
        middle: Text('Dashboard'),
      ),
      child: Expanded(
        child: Stack(
          children: <Widget>[
            //NavigationBar(destinations: destinations),
            // Positioned(
            //   top: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height,
            //     child: Text('Test')
            //   ),
            // ),

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
                      color: Color.fromARGB(255, 125, 75, 241),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 50.0,
                            left: 10.0,
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _isDrawerOpen = false),
                              child: const Icon(
                                CupertinoIcons.clear,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 46.0, bottom: 46.0),
                              child: UserInfo(
                                picture:
                                    'https://picsum.photos/seed/picsum/300/300',
                                name: 'Test User',
                                id: '0023',
                                company: 'Owlinvest',
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
                        child: Padding(
                          padding: EdgeInsets.only(left: 46.0, top: 46.0),
                          child: Column(
                            children: <Widget>[
                              MenuItem(
                                icon: Icon(Icons.house),
                                label: 'Households',
                              ),
                              MenuItem(
                                icon: Icon(Icons.supervised_user_circle_sharp),
                                label: 'Contacts',
                              ),
                              MenuItem(
                                icon: Icon(Icons.password_sharp),
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
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Icon icon;
  final String label;

  MenuItem({
    required this.icon,
    required this.label,
  })  : assert(icon != null),
        assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 42.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon.icon,
            color: Color.fromARGB(255, 125, 75, 241),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
