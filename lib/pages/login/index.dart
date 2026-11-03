import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Widget')),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: '请输入邮箱',
                  labelText: "邮箱",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
              ),
            ),
            SizedBox(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  labelText: "密码",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
              ),
            ),
            SizedBox(),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: ElevatedButton(onPressed: () {}, child: Text('登录')),
            ),
          ],
        ),
      ),
    );
  }
}
