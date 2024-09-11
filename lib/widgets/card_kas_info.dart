import 'package:app_3/models/kas.dart';
import 'package:flutter/material.dart';

class CardKasInfo extends StatelessWidget {
  const CardKasInfo({super.key, required this.items, required this.jenis});

  final List<Kas> items;
  final JenisKas jenis;

  double countTotal() {
    if (jenis == JenisKas.KasMasuk) {
      var masukList = items.where((e) => e.jenis == JenisKas.KasMasuk);
      var masuk = masukList.isNotEmpty
          ? masukList
              .map((e) => e.nominal)
              .reduce((value, element) => value + element)
          : 0.0;
      return masuk;
    } else if (jenis == JenisKas.KasKeluar) {
      var keluarList = items.where((e) => e.jenis == JenisKas.KasKeluar);
      var keluar = keluarList.isNotEmpty
          ? keluarList
              .map((e) => e.nominal)
              .reduce((value, element) => value + element)
          : 0.0;
      return keluar;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 89, 234),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Total Transaksi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    items.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 89, 234),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      var text = '';
                      if (jenis == JenisKas.KasMasuk) {
                        text = 'Total Pemasukan';
                      } else if (jenis == JenisKas.KasKeluar) {
                        text = 'Total Pengeluaran';
                      }
                      return Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Text(
                    'IDR ${countTotal().round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
