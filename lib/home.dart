import 'package:backdrop/backdrop.dart';
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
  String categoryTerpilih = "Semua";
  
  final List<Map<String, dynamic>> listproduct = [
    {
      "nama": 'Play Station 5',
      "harga": 13449000,
      "gambar":
          "https://images.tokopedia.net/img/cache/700/OJWluG/2022/3/21/9cc55e78-b91e-4b8b-a588-c4fa991fc89c.jpg?ect=4g",
      "detail": 'Konsol game generasi terbaru dengan grafis ultra HD',
      'kategori': 'Sony',
    },
    {
      'nama': 'PSP',
      'harga': 300000,
      'gambar':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi6fInb4EIPgCJo9h1KuKTdIjVG1ihamloew&s",
      'detail': 'Konsol portable klasik dari Sony',
      'kategori': 'Sony',
    },
    {
      'nama': 'Nintendo Switch 2',
      'harga': 8775000,
      'gambar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkEGIbQ2AyXOSWG6FMylggWqgyIpv_wsTtqQ&s',
      'detail': 'Konsol hybrid dengan mode handheld dan dock',
      'kategori': 'Nintendo',
    },
    {
      'nama': 'Nintendo DS',
      'harga': 20000,
      'gambar':
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Nintendo_DS_Lite_side.jpg/1200px-Nintendo_DS_Lite_side.jpg",
      'detail': 'Konsol portable layar ganda dengan stylus',
      'kategori': 'Nintendo',
    }
  ];

  void _onNavbarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Profile(title: 'Profile'),
        ),
      ).then((value) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  List<Map<String, dynamic>> _getFilteredProducts() {
    if (categoryTerpilih == "Semua") {
      return listproduct;
    } else {
      return listproduct.where((p) => p["kategori"] == categoryTerpilih).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final produkTerfilter = _getFilteredProducts();

    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text(
          'Home - $categoryTerpilih',
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
            color: Colors.white,
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
      
      backLayer: Container(
        color: Colors.grey[100],
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Pilih Kategori',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 64, 141, 192),
              ),
            ),
            const SizedBox(height: 16),
            
            // ** PERBAIKAN: Gunakan Builder untuk context yang benar **
            for (var category in ["Semua", "Sony", "Nintendo"])
              Builder(
                builder: (BuildContext builderContext) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: RadioListTile<String>(
                      title: Text(
                        category,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      value: category,
                      groupValue: categoryTerpilih,
                      activeColor: const Color.fromARGB(255, 64, 141, 192),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            categoryTerpilih = value;
                          });
                          // ** PERBAIKAN: Gunakan context dari Builder **
                          Backdrop.of(builderContext).concealBackLayer();
                        }
                      },
                      secondary: Icon(
                        category == "Semua" 
                            ? Icons.apps 
                            : category == "Sony" 
                                ? Icons.videogame_asset 
                                : Icons.games,
                        color: const Color.fromARGB(255, 64, 141, 192),
                      ),
                    ),
                  );
                }
              ),
            
            const SizedBox(height: 20),
            Text(
              'Total: ${produkTerfilter.length} produk',
              style: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),

      frontLayer: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Rekomendasi",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              // ** PERUBAHAN: Ganti chip dengan keterangan jumlah produk **
              Container(
                child: Text(
                  '${produkTerfilter.length} produk',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          
          produkTerfilter.isEmpty
              ? Container(
                  height: 200,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Tidak ada produk untuk kategori ini',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.68,
                  children: produkTerfilter.map((item) {
                    return listItem(
                      nama: item['nama'],
                      harga: item['harga'],
                      gambar: item['gambar'],
                      detail: item['detail'],
                      kategori: item['kategori'],
                    );
                  }).toList(),
                ),
        ],
      ),
      
      bottomNavigationBar: MyNavbar(
        selectedIndex: _selectedIndex,
        onTap: _onNavbarTap,
      ),
    );
  }

  Widget listItem({
    required String nama,
    required int harga,
    required String gambar,
    required String detail,
    required String kategori,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              decoration: BoxDecoration(
                color: kategori == 'Sony' 
                    ? Colors.blue[100] 
                    : Colors.red[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                kategori,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: kategori == 'Sony' 
                      ? Colors.blue[800] 
                      : Colors.red[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                gambar,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

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

            Text(
              "Rp ${harga.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 105, 59),
                fontSize: 14,
              ),
            ),
            
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
                child: const Text(
                  "Lihat Detail",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}