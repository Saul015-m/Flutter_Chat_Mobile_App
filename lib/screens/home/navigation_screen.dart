import 'package:chat/screens/auth/login_screen.dart';
import 'package:chat/screens/home/discussion_screen.dart';
import 'package:chat/screens/new/chat_screen.dart';
import 'package:chat/screens/profile/profile_screen.dart';
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
      return const Row(
        children: [
          Spacer(),
          Text(
            'Users',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 70, 50, 93),
            ),
          ),
          Spacer(),
        ],
      );
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
              return Padding(
                padding: const EdgeInsets.only(left: 30),
                child: IconButton(
                  icon: const Icon(
                    Icons.density_small_rounded,
                    color: Color.fromARGB(255, 70, 50, 93),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              );
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 70, 50, 93),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
          title: _buildAppBarTitle(),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.only(top: 60),
            children: [
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
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
