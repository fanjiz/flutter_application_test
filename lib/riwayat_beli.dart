import 'package:flutter/material.dart';
import 'custom_navbar.dart';

class RiwayatBeli extends StatefulWidget {
  const RiwayatBeli({super.key});

  @override
  State<RiwayatBeli> createState() => _RiwayatBeliState();
}

class _RiwayatBeliState extends State<RiwayatBeli> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> riwayat = const [
    {
      "nama": "Play Station 5",
      "gambar":
          "https://images.tokopedia.net/img/cache/700/OJWluG/2022/3/21/9cc55e78-b91e-4b8b-a588-c4fa991fc89c.jpg?ect=4g",
      "harga": 13449000,
      "tanggal": "12 Agustus 2025"
    },
    {
      "nama": "Nintendo Switch 2",
      "gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkEGIbQ2AyXOSWG6FMylggWqgyIpv_wsTtqQ&s",
      "harga": 8775000,
      "tanggal": "2 Agustus 2025"
    },
  ];

  int? _pressedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          "Riwayat Pembelian",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 141, 192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: riwayat.length,
        itemBuilder: (context, index) {
          final item = riwayat[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          // Mengganti GestureDetector & AnimatedScale
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            // Mengganti BoxDecoration dengan Material Elevation
            elevation: 3, 
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // Logika yang ingin dijalankan saat card diklik
                debugPrint('Klik: ${item["nama"]}');
              },                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item["gambar"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item["nama"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rp ${item["harga"]}",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          item["tanggal"],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: MyNavbar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
