import 'package:app_3/models/kas.dart';
import 'package:app_3/providers/kas_provider.dart';
import 'package:app_3/widgets/kas_item.dart';
import 'package:app_3/widgets/card_kas_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KasKeluarScreen extends StatefulWidget {
  const KasKeluarScreen({super.key});

  @override
  State<KasKeluarScreen> createState() => _KasKeluarScreenState();
}

class _KasKeluarScreenState extends State<KasKeluarScreen> {
// var items = <Kas>[
  //  Kas.keluar(
  //  keterangan: 'Dikasih Mamah', nominal: 2000, dateTime: DateTime.now()),
  //  Kas.keluar(
  //  keterangan: 'Dapet Upah', nominal: 5000, dateTime: DateTime.now()),
  //  Kas.keluar(
  // keterangan: 'Nemu Dijalan', nominal: 10000, dateTime: DateTime.now()),
  // ];

  void baru() async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: BaruDialog(
            onSimpan: Provider.of<KasProvider>(context, listen: false).tambah,
          ),
        );
      },
    );
  }

//  void hapus(Kas kas) {
  //  setState(() {
  //  items.remove(kas);
  //  });
//  }

//  void tambah(Kas kas) {
  //  setState(() {
  //  items.add(kas);
  //  });
//  }

  void onItemTap(Kas kas) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus'),
        content: const Text('Yakin Ingin Menghapus Kas Yang Masuk?'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Provider.of<KasProvider>(context, listen: false).hapus(kas);
                Navigator.of(context).pop();
              },
              child: const Text('Ya')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tidak')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas Keluar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: baru,
        child: const Icon(Icons.add),
      ),
      body: Consumer<KasProvider>(
        builder: (context, value, child) {
          final items = value.keluarItems;
          return Column(
            children: [
              CardKasInfo(items: items, jenis: JenisKas.KasKeluar),
              Flexible(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: Colors.blueGrey,
                  ),
                  itemBuilder: (context, index) {
                    var kas = items[index];
                    return KasItem(
                      kas: kas,
                      onTap: () => onItemTap(kas),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BaruDialog extends StatefulWidget {
  const BaruDialog({super.key, required this.onSimpan});

  final void Function(Kas kas) onSimpan;

  @override
  State<BaruDialog> createState() => _BaruDialogState();
}

class _BaruDialogState extends State<BaruDialog> {
  final nominalController = TextEditingController(text: '');
  final keteranganController = TextEditingController(text: '');

  void onSimpan() {
    double nominal =
        nominalController.text != '' ? double.parse(nominalController.text) : 0;
    var kas = Kas.keluar(
      keterangan: keteranganController.text,
      nominal: nominal,
      dateTime: DateTime.now(),
    );
    widget.onSimpan(kas);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(31, 200, 196, 196),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Untuk Kas Keluar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: nominalController,
            decoration: const InputDecoration(
              labelText: 'Nominal',
              filled: true,
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: keteranganController,
            decoration: const InputDecoration(
              labelText: 'Keterangan',
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSimpan,
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }
}
