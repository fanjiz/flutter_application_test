import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true),

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 64, 141, 192)),
      ),
      home: const Profile(title: 'Study Club',),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});
  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;

  void incrementCounter() {
    setState(() {

      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    void dialog(BuildContext context) {
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Berhasil"),
            content: Text("Data berhasil disimpan")
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 141, 192),
        title: const Text(
          "PROFILE",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Opacity(
            opacity: 0.1,
            child: Image.network(
              'https://i.pinimg.com/736x/2a/b6/de/2ab6de494264e21a38516197c060f16c.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1597491283941261312/bcJ67p9M_400x400.jpg",
                        ),
                        radius: 80,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 64, 141, 192),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 10),
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 13, 67, 92), fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Irfan Aziz",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.edit, color: Color.fromARGB(255, 64, 141, 192)),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),

                // Email
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 13, 67, 92), fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "irpanaziz232@gmail.com",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.edit, color: Color.fromARGB(255, 64, 141, 192)),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),

                // Phone
                const Text(
                  "Phone",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 13, 67, 92), fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "085282706360",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.edit, color: Color.fromARGB(255, 64, 141, 192)),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),

                const Text(
                  "About Me",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 13, 67, 92), fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // biar ikon ikut di atas
                  children: const [
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(fontSize: 18,),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.edit, color: Color.fromARGB(255, 64, 141, 192)),
                  ],
                ),
                const Divider(),
                SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 64, 141, 192),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    dialog(context);
                  },
                  child: const Text(
                    "Update Profile",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 64, 141, 192),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
