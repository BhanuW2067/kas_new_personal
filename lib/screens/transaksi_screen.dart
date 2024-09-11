import 'package:app_3/providers/kas_provider.dart';
import 'package:app_3/widgets/kas_item.dart';
import 'package:app_3/widgets/card_kas_info_all.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransaksiScreen extends StatelessWidget {
  const TransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Transaksi'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<KasProvider>(
              builder: (context, value, child) {
                final items = value.items;
                return CardKasInfoAll(
                    items: items);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: const Color.fromARGB(255, 200, 199, 199),
              height: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<KasProvider>(
                builder: (context, value, child) {
                  final items = value.items; 
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: Colors.blueGrey,
                    ),
                    itemBuilder: (context, index) {
                      var kas = items[index];
                      return KasItem(
                        kas: kas,
                        onTap: () {},
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
