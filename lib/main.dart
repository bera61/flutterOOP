import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'animals/pets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart pet manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Pet> pets = [
      Dog('karabas'),
      Cat('misket'),
      Bird.named(name: 'cicikus'), // Named constructor kullanımı
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Pet Manager',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
     body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final Pet pet = pets[index];
                String icon;
                String soundText;

                if (pet is Dog) {
                  icon = "🐶";
                  soundText = "Woof Woof!";
                } else if (pet is Cat) {
                  icon = "🐱";
                  soundText = "Meow!";
                } else if (pet is Bird) {
                  icon = "🐦";
                  soundText = "Chirp Chirp!";
                } else {
                  icon = "🐾";
                  soundText = "";
                }

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: Text(
                      icon,
                      style: const TextStyle(fontSize: 28),
                    ),
                    title: Text("${pet.runtimeType}: ${pet.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text(soundText),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Total Pets: ${Pet.totalPets}",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}