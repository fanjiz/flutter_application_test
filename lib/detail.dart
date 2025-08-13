import 'package:flutter/material.dart';

class DetailProduk extends StatelessWidget {
  final String nama;
  final String gambar;
  final int harga;
  final String detail;

  const DetailProduk({
    super.key,
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
          nama,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 141, 192),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar Produk
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                gambar,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Nama Produk
            Text(
              nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Harga
            Text(
              "Rp ${harga.toString()}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            // Detail Produk
            Text(
              detail,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 25),

            // Tombol Beli
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Produk '$nama' dibeli!")),
                );
              },
              label: const Text("Beli Sekarang", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Color.fromARGB(255, 255, 255, 255)),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 64, 141, 192),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
