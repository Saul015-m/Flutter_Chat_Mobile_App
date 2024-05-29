import 'package:chat/components/tab_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.density_small_rounded,
                      color: Color.fromARGB(255, 70, 50, 93),
                    ),
                    onPressed: () {
                      // Action pour l'icône de paramètres
                    },
                  ),
                  Expanded(
                    child: ClipRRect(
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromRGBO(235, 224, 255, 1.0),
                        ),
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
                  IconButton(
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Color.fromARGB(255, 70, 50, 93),
                    ),
                    onPressed: () {
                      // Action pour l'icône de sortie
                    },
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Message Content')),
                  Center(child: Text("Group Content")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
