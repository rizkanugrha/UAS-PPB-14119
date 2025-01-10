import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarbershopExploreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> barbershopLocations = [
    {
      'title': 'Barbershop Elite Jakarta',
      'description': 'Terletak di pusat kota Jakarta, Barbershop Elite Jakarta '
          'menawarkan layanan cukur premium dengan suasana modern. Fasilitas mencakup '
          'lounge eksklusif, layanan grooming, dan konsultasi gaya rambut.',
      'image': 'assets/images/barbershop_jakarta.webp',
    },
    {
      'title': 'Barbershop Elite Bali',
      'description':
          'Berada di kawasan Seminyak, Barbershop Elite Bali menghadirkan '
              'suasana santai dengan layanan perawatan rambut lengkap. Cocok untuk Anda yang ingin '
              'memadukan liburan dengan perawatan gaya rambut terbaik.',
      'image': 'assets/images/barbershop_bali.webp',
    },
    {
      'title': 'Barbershop Elite Surabaya',
      'description': 'Terletak di jantung kota Surabaya, Barbershop Elite Surabaya '
          'menawarkan kenyamanan maksimal dengan tim profesional yang siap memberikan layanan '
          'gaya rambut sesuai kebutuhan Anda.',
      'image': 'assets/images/barbershop_surabaya.webp',
    },
    {
      'title': 'Barbershop Elite Bandung',
      'description':
          'Dikelilingi oleh suasana sejuk Bandung, Barbershop Elite Bandung '
              'menyediakan layanan cukur premium dengan fokus pada kenyamanan dan detail. Cocok '
              'untuk semua kalangan.',
      'image': 'assets/images/barbershop_bandung.webp',
    },
    {
      'title': 'Barbershop Elite Yogyakarta',
      'description': 'Barbershop Elite Yogyakarta menghadirkan nuansa tradisional '
          'dengan layanan modern. Terletak dekat pusat kota, ideal untuk perawatan '
          'dan gaya rambut yang kekinian.',
      'image': 'assets/images/barbershop_yogyakarta.webp',
    },
  ];

  BarbershopExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lokasi Barbershop',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: barbershopLocations.length,
        itemBuilder: (context, index) {
          final barbershop = barbershopLocations[index];
          return GestureDetector(
            onTap: () => _showLocationDetail(
              context,
              barbershop['title']!,
              barbershop['description']!,
              barbershop['image']!,
            ),
            child: _buildBarbershopCard(
              barbershop['title']!,
              barbershop['description']!,
              barbershop['image']!,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBarbershopCard(String title, String description, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gambar Lokasi Barbershop
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Informasi Lokasi Barbershop
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationDetail(
      BuildContext context, String title, String description, String image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Tutup',
                style: GoogleFonts.poppins(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
