import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNamePage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text(
          "My Name",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.person_pin),
          onPressed: () {
            context.go("/profile");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/task");
            },
            icon: Icon(
              Icons.bookmark_added_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Write your name..",
                  labelText: "Name",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        if (_controller.text != "Khaled") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You're nor the one..."),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          context.push("/print", extra: _controller.text);
                        }
                      }
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
              onEditingComplete: () {
                if (_controller.text.isNotEmpty) {
                  if (_controller.text != "Khaled") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You're nor the one..."),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    context.push("/print", extra: _controller.text);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
