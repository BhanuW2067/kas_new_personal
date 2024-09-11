import 'package:flutter/material.dart';
import 'package:app_3/models/kas.dart';

class KasProvider extends ChangeNotifier {
  final List<Kas> _items = [];

  List<Kas> get items => _items;

  List<Kas> get masukItems => _items.where((e) => e.jenis == JenisKas.KasMasuk).toList();

  List<Kas> get keluarItems => _items.where((e) => e.jenis == JenisKas.KasKeluar).toList();

  void tambah(Kas kas) {
    _items.add(kas);
    notifyListeners();
  }

  void hapus(Kas kas) {
    _items.remove(kas);
    notifyListeners();
  }
}
