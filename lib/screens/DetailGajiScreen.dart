import 'package:flutter/material.dart';
import './HomeScreen.dart';

class DetailGajiScreenArguments {
  final gaji;
  final jabatan;

  DetailGajiScreenArguments(this.gaji, this.jabatan);
}

class DetailGajiScreen extends StatelessWidget {
  const DetailGajiScreen({Key key, this.data}) : super(key: key);
  static const routeName = '/detailgaji';
  final List data;
  @override
  Widget build(BuildContext context) {
    final DetailGajiScreenArguments args = ModalRoute.of(context).settings.arguments;
        print(args.gaji);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Gaji"),
      ),
      body: ListView(
          children: <Widget>[
          ListData(dataInt: args.jabatan['gaji_pokok'], title: "Gaji Pokok", isDark: true),
          ListData(dataInt: args.jabatan['upah_lembur'], title: "Upah Lembur", isDark: false),
          ListData(data: args.gaji['jam_lembur'].toString() + " jam", title: "Jam Lembur", isDark: false),
          ListData(dataInt: args.gaji['jumlah_lembur'], title: "Jumlah Lembur", isDark: true),
          ListData(dataInt: args.gaji['total_tunjangan'], title: "Total Tunjangan", isDark: false),
          ListData(dataInt: args.gaji['gaji_kotor'], title: "Gaji Kotor", isDark: true),
          ListData(dataInt: args.gaji['pajak'], title: "Pajak", isDark: false),
          ListData(dataInt: args.gaji['gaji_bersih'], title: "Gaji Bersih", isDark: true),
          ListData(data: bulan(args.gaji['bulan'].toString()) + ", " + args.gaji['tahun'].toString(), title: "Bulan", isDark: false),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}