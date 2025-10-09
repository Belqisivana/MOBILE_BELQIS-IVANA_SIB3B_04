import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue[50],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 80),
              const SizedBox(height: 20),
              // Foto profil
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.grey[300],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/foto_formal_Belqisimut.jpg',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),

              const SizedBox(height: 20),
              // Nama, NIM, Jurusan
              Text(
                'Belqis Ivana Fidelia Arfany',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'NIM: 2341760075',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              Text(
                'Jurusan: Teknologi Informasi',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Icon kontak
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 5),
                  Text('belqis@polinema.ac.id'),
                  SizedBox(width: 15),
                  Icon(Icons.phone, color: Colors.green),
                  SizedBox(width: 5),
                  Text('0821-4075-2116'),
                ],
              ),
              const SizedBox(height: 30),
              const Placeholder(
                fallbackHeight: 150,
                fallbackWidth: double.infinity,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
