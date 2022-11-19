import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

const animals = [
  "cat",
  "dog",
  "duck",
];

const animalImages = {
  "cat": "animals/cat.png",
  "dog": "animals/dog.png",
  "duck": "animals/duck.jpg",
};

class _ProfileEditPageState extends State<ProfileEditPage> {
  final maxRadius = 180;
  final minRadius = 40;

  double radius = 100;

  String? selectedAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedAnimal,
              items: animals
                  .map((animal) =>
                      DropdownMenuItem(value: animal, child: Text(animal)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedAnimal = value;
                });
              },
            ),
          ),
          Expanded(
              child: Center(
            child: CircleAvatar(
              radius: radius,
              foregroundImage: selectedAnimal == null
                  ? null
                  : AssetImage(animalImages[selectedAnimal]!),
              backgroundColor: Colors.grey[200],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: radius <= minRadius
                          ? null
                          : () {
                              setState(() {
                                radius -= 10;
                              });
                            },
                      child: Icon(Icons.remove)),
                  ElevatedButton(
                      onPressed: radius >= maxRadius
                          ? null
                          : () {
                              setState(() {
                                radius += 10;
                              });
                            },
                      child: Icon(Icons.add)),
                ]),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
