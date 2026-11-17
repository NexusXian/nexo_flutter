import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> _tablists = [
    {
      'id': 'chat',
      'label': '聊天',
      'icon': Icons.chat_bubble_outline,
      'activeIcon': Icons.chat_bubble,
    },
    {
      'id': 'contact',
      'label': '联系人',
      'icon': Icons.people_outline,
      'activeIcon': Icons.people,
    },
    {
      'id': 'setting',
      'label': '设置',
      'icon': Icons.settings_outlined,
      'activeIcon': Icons.settings,
    },
    {
      'id': 'profile',
      'label': '个人资料',
      'icon': Icons.person_outline,
      'activeIcon': Icons.person,
    },
  ];

  List<BottomNavigationBarItem> _buildTabItems() {
    return List.generate(_tablists.length, (index) {
      return BottomNavigationBarItem(
        icon: Icon(_tablists[index]['icon']),
        label: _tablists[index]['label'],
        activeIcon: Icon(_tablists[index]['activeIcon']),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _buildTabItems(),
        onTap: (index) {
          print('点击了第 $index 个 tab');
        },
      ),
    );
  }
}
