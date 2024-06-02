import 'package:chat/components/tab_item.dart';
import 'package:chat/screens/discussion/group_screen.dart';
import 'package:chat/screens/discussion/message_screen.dart';
import 'package:flutter/material.dart';

class TabBarTitle extends StatelessWidget {
  const TabBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
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
