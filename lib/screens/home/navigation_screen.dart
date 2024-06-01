import 'package:chat/components/tab_item.dart';
import 'package:chat/screens/discussion/group_screen.dart';
import 'package:chat/screens/discussion/message_screen.dart';
import 'package:chat/screens/new/chat_screen.dart';
import 'package:chat/screens/user/user_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildAppBarTitle() {
    if (_selectedIndex == 0) {
      return const TabBarTitle();
    } else {
      return const Text('Users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Log out action
              },
            ),
          ],
          title: _buildAppBarTitle(),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Discussions'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(0);
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(1);
                },
              ),
            ],
          ),
        ),
        body: _selectedIndex == 0
            ? const TabBarViewContent()
            : const UserScreen(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_rounded),
              label: 'Discussions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Users',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 70, 50, 93),
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 70, 50, 93),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class TabBarTitle extends StatelessWidget {
  const TabBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                height: 40,
                color: const Color.fromRGBO(235, 224, 255, 1.0),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Color.fromARGB(255, 70, 50, 93),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color.fromARGB(255, 70, 50, 93),
                  tabs: [
                    TabItem(title: "Message"),
                    TabItem(title: "Group"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarViewContent extends StatelessWidget {
  const TabBarViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        MessageScreen(),
        GroupScreen(),
      ],
    );
  }
}
