
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDrawerOpen = false;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(label: 'Tab 1', icon: Icon(Icons.ac_unit)),
    const BottomNavigationBarItem(label: 'Tab 2', icon: Icon(Icons.ac_unit)),
  ];

  List<String> titles = ["title 1", "title 2"];
  List<String> contents = ["contents 1", "contents 2"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: items,
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return CupertinoPageScaffold(
                      navigationBar: CupertinoNavigationBar(
                        middle: Text(titles[index]),
                      ),
                      child: SafeArea(
                          child: Center(
                              child: Container(
                                  color: Colors.blue,
                                  child: Text(contents[index])))),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: -30.0,
          //right: 0.0,
          child: SizedBox(
            width: 100,
            child: GestureDetector(
                onTap: () {
                  setState(() => _isDrawerOpen = true);
                },
                child: const Icon(Icons.menu, size: 30,)),
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
                  color: const Color(0xFFB42827),
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
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 46.0, bottom: 46.0),
                          child: UserInfo(
                            picture: 'https://picsum.photos/250?image=9',
                            name: 'Ryan',
                            id: '0023-Ryan',
                            company: 'Universal Data Center',
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
                            icon: Icon(Icons.accessibility),
                            label: 'Message center',
                          ),
                          MenuItem(
                            icon: Icon(Icons.height),
                            label: 'Ticket research',
                          ),
                          MenuItem(
                            icon: Icon(Icons.event),
                            label: 'Suggestion',
                          ),
                          MenuItem(
                            icon: Icon(Icons.phone),
                            label: 'Contact us',
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon.icon,
            color: const Color(0xFFB42827),
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
    );
  }
}

class UserInfo extends StatelessWidget {
  final String picture;
  final String name;
  final String id;
  final String company;

  const UserInfo({super.key, 
    required this.picture,
    required this.name,
    required this.id,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(picture),
            ),
          ),
        ),
        const SizedBox(
          height: 9.0,
        ),
        Row(
          children: <Widget>[
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.play_arrow_solid,
                  size: 8.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          id,
          style: Theme.of(context)
              .textTheme
              .bodySmall?.copyWith(color: Colors.white.withOpacity(0.6)),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          company,
          style: Theme.of(context)
              .textTheme
              .bodySmall?.copyWith(color: Colors.white.withOpacity(0.6)),
        )
      ],
    );
  }
}