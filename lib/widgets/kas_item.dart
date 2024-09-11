import 'package:app_3/models/kas.dart';
import 'package:flutter/material.dart';

class KasItem extends StatelessWidget {
  const KasItem({super.key, required this.kas, required this.onTap});

  final Kas kas;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Builder(
        builder: (context) {
          var color = Colors.greenAccent;
          var icon = Icons.add;

          if (kas.jenis == JenisKas.KasKeluar) {
            color = Colors.redAccent;
            icon = Icons.remove;
          }

          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          );
        },
      ),
      title: Text(
        'IDR ${kas.nominal.round()}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(kas.keterangan),
    );
  }
}
