import 'package:flutter/material.dart';
import 'riwayat_beli.dart';
import 'detail.dart';
import 'custom_navbar.dart';
import 'profile.dart';

/// Halaman utama yang menampilkan daftar rekomendasi produk
class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final Categoryawal = "semua";
  final List<Map<String, dynamic>> listproduct = [
    {
    "nama": 'Play Station 5',
    "harga": 13449000,
    "gambar":
        "https://images.tokopedia.net/img/cache/700/OJWluG/2022/3/21/9cc55e78-b91e-4b8b-a588-c4fa991fc89c.jpg?ect=4g",
    "detail": 'Konsol game generasi terbaru dengan grafis ultra HD',
    },
    {
    'nama': 'PSP',
    'harga': 300000,
    'gambar':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi6fInb4EIPgCJo9h1KuKTdIjVG1ihamloew&s",
    'detail': 'Konsol portable klasik dari Sony',
    },
    {
      'nama': 'Nintendo Switch 2',
      'harga': 8775000,
      'gambar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkEGIbQ2AyXOSWG6FMylggWqgyIpv_wsTtqQ&s',
      'detail': 'Konsol hybrid dengan mode handheld dan dock',
    },
    {
      'nama': 'Nintendo DS',
      'harga': 20000,
      'gambar':
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Nintendo_DS_Lite_side.jpg/1200px-Nintendo_DS_Lite_side.jpg",
      'detail': 'Konsol portable layar ganda dengan stylus',
    }
  ];

  // ** TAMBAHAN BARU: Method untuk handle navigasi navbar **
  void _onNavbarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index yang dipilih
    if (index == 1) {
      // Navigasi ke halaman Profile
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Profile(title: 'Profile'), // Tambahkan required title parameter
        ),
      ).then((value) {
        // Reset index ke 0 (Home) setelah kembali dari profile
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
    // Jika index == 0 (Home), tidak perlu navigasi karena sudah di halaman Home
  }

  @override
  Widget build(BuildContext context) {
    final categoryTerpilih = 
      Categoryawal == "semua"
      ? listproduct
      : listproduct.where((p) => p["kategori"] == Categoryawal).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            ),
          ),
        backgroundColor: const Color.fromARGB(255, 64, 141, 192),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            color: Colors.white, // Icon riwayat
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RiwayatBeli(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Rekomendasi",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2, // jumlah kolom
            shrinkWrap: true, // biar muat di ListView
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.68, // proporsi tinggi-lebar item
            children: 
              categoryTerpilih.map((item) {
                return listItem(
                  nama: item['nama'],
                  harga: item['harga'],
                  gambar: item['gambar'],
                  detail: item['detail'],
                );
            }).toList(),            
          ),
        ],
      ),
      // ** PERUBAHAN: Ganti onTap dengan method navigasi kita **
      bottomNavigationBar: MyNavbar(
        selectedIndex: _selectedIndex,
        onTap: _onNavbarTap, // Gunakan method _onNavbarTap yang baru
      ),
    );
  }

  /// Membuat widget item produk
  Widget listItem({
    required String nama,
    required int harga,
    required String gambar,
    required String detail,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar produk
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                gambar,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

            // Nama produk
            Text(
              nama,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Harga
            Text(
              "Rp ${harga.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 105, 59),
                fontSize: 14,
              ),
            ),
            // Tombol detail
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 64, 141, 192),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  textStyle: const TextStyle(fontSize: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProduk(
                        nama: nama,
                        gambar: gambar,
                        harga: harga,
                        detail: detail,
                      ),
                    ),
                  );
                },
                child: const Text("Lihat Detail", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}