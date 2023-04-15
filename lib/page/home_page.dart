import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _berat = 0;
  double _tinggi = 0;
  double _bmi = 0;
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang, $username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
              ),
              onChanged: (value) {
                setState(() {
                  _berat = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (cm)',
              ),
              onChanged: (value) {
                setState(() {
                  _tinggi = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bmi = hitungBMI(_berat, _tinggi);
                  _status = getStatusBMI(_bmi);
                });
              },
              child: Text('Hitung'),
            ),
            SizedBox(height: 16),
            Text(
              'BMI: ${_bmi.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Status: $_status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menghitung BMI
  double hitungBMI(double berat, double tinggi) {
    double bmi = berat / ((tinggi / 100) * (tinggi / 100));
    return bmi;
  }

  // Fungsi untuk menentukan status BMI
  String getStatusBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Kurus';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Gemuk';
    } else {
      return 'Obesitas';
    }
  }
}
