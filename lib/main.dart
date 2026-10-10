import 'package:flutter/material.dart';

void main() {
  runApp(const CamiSessizApp());
}

class CamiSessizApp extends StatelessWidget {
  const CamiSessizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cami Modu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isServiceActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cami Modu (BLE Otomasyon)'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isServiceActive ? Icons.notifications_off : Icons.notifications_active,
              size: 100,
              color: isServiceActive ? Colors.teal : Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              isServiceActive ? 'Cami Modu Aktif' : 'Cami Modu Pasif',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Camiye girildiğinde telefon otomatik sessize alınır.'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isServiceActive = !isServiceActive;
                });
              },
              icon: Icon(isServiceActive ? Icons.stop : Icons.play_arrow),
              label: Text(isServiceActive ? 'Servisi Durdur' : 'Servisi Başlat'),
            ),
          ],
        ),
      ),
    );
  }
}