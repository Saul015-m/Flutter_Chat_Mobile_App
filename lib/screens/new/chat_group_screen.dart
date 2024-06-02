import 'package:chat/components/chat_title.dart';
import 'package:chat/screens/new/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/components/search_field.dart';

class ChatGroupScreen extends StatefulWidget {
  const ChatGroupScreen({super.key});

  @override
  State<ChatGroupScreen> createState() => _ChatGroupScreenState();
}

class _ChatGroupScreenState extends State<ChatGroupScreen> {
  final List<String> _selectedUsers = [];
  final List<String> _users = ['Lola', 'John', 'Mike'];

  void _toggleSelection(String user) {
    setState(() {
      if (_selectedUsers.contains(user)) {
        _selectedUsers.remove(user);
      } else {
        _selectedUsers.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> usersByInitial = {};

    for (var user in _users) {
      String initial = user[0].toUpperCase();
      if (!usersByInitial.containsKey(initial)) {
        usersByInitial[initial] = [];
      }
      usersByInitial[initial]!.add(user);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            ChatTitle(
              title: 'New Chat Group',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SearchField(
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _selectedUsers.isNotEmpty
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: _selectedUsers.map((user) {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedUsers.remove(user);
                                        });
                                      },
                                      child: const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.close,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: usersByInitial.keys.map((initial) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            initial,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...usersByInitial[initial]!.map(
                            (user) {
                              return Column(
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      _toggleSelection(user);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: const Image(
                                              width: 40,
                                              height: 40,
                                              image: NetworkImage(
                                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                        Text(
                                          user,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.purple,
                                            ),
                                            color: _selectedUsers.contains(user)
                                                ? Colors.purple
                                                : Colors.transparent,
                                          ),
                                          child: _selectedUsers.contains(user)
                                              ? const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 10,
                                                )
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
